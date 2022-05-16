<?php

namespace App\Http\Controllers\Api\V2;
use App\Http\Controllers\AffiliateController;

use App\Address;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Cart;
use App\Models\Product;
use App\Models\OrderDetail;
use App\Models\Coupon;
use App\Models\CouponUsage;
use App\CombinedOrder;
use App\Models\BusinessSetting;
use App\User;
use DB;

class OrderController extends Controller
{
     public function store(Request $request, $set_paid = false)
    {

        $cartItems = Cart::where('user_id', $request->user_id)->get();

        if ($cartItems->isEmpty()) {
            return response()->json([
                'order_id' => 0,
                'result' => false,
                'message' => 'Cart is Empty'
            ]);
        }

        $user = User::find($request->user_id);

        $address = Address::where('id', $cartItems->first()->address_id)->first();
        $shippingAddress = [];
        if ($address != null) {
            $shippingAddress['name']        = $user->name;
            $shippingAddress['email']       = $user->email;
            $shippingAddress['address']     = $address->address;
            $shippingAddress['country']     = $address->country;
            $shippingAddress['city']        = $address->city;
            $shippingAddress['postal_code'] = $address->postal_code;
            $shippingAddress['phone']       = $address->phone;
            if($address->latitude || $address->longitude) {
                $shippingAddress['lat_lang'] = $address->latitude.','.$address->longitude;
            }
        }

        DB::beginTransaction();
        try{
            $combined_order = new CombinedOrder;
            $combined_order->user_id = $user->id;
            $combined_order->shipping_address = json_encode($shippingAddress);
            $combined_order->save();


            $seller_products = array();
            foreach ($cartItems as $cartItem) {
                $product_ids = array();
                $product = Product::find($cartItem['product_id']);
                if (isset($seller_products[$product->user_id])) {
                    $product_ids = $seller_products[$product->user_id];
                }
                array_push($product_ids, $cartItem);
                $seller_products[$product->user_id] = $product_ids;
            }


            foreach ($seller_products as $seller_product) {
                    $order = new Order;
                    $order->type="App";
                    $order->combined_order_id = $combined_order->id;
                    $order->user_id = $user->id;
                    $order->shipping_address = json_encode($shippingAddress);

                    $order->payment_type = $request->payment_type;
                    $order->delivery_viewed = '0';
                    $order->payment_status_viewed = '0';
                    // $order->code = date('Ymd-His') . rand(10, 99);
                    $order->date = strtotime('now');
                    if($set_paid){
                        $order->payment_status = 'paid';
                    }else{
                        $order->payment_status = 'unpaid';
                    }

                    $order->save();

                    $subtotal = 0;
                    $tax = 0;
                    $shipping = 0;
                    $coupon_discount = 0;

                    //Order Details Storing
                    foreach ($seller_product as $cartItem) {
                        $product = Product::find($cartItem['product_id']);
                        $product_variation = $cartItem['variation'];
                        $product_stock = $product->stocks->where('variant', $product_variation)->first();

                        $subtotal += formated_discounted_price($product,$product_stock) * $cartItem['quantity'];
                        $tax += $cartItem['tax'] * $cartItem['quantity'];
                        $coupon_discount += $cartItem['discount'];


                        if ($product->digital != 1 && $cartItem['quantity'] > $product_stock->qty) {
                            $order->delete();
                            $combined_order->delete();
                            return response()->json([
                                'combined_order_id' => 0,
                                'result' => false,
                                'message' => translate('The requested quantity is not available for ') . $product->name
                            ]);
                        } elseif ($product->digital != 1) {
                            $product_stock->qty -= $cartItem['quantity'];
                            $product_stock->qty_sold += $cartItem['quantity'];
                            $product_stock->save();
                        }

                        $order_detail = new OrderDetail;
                        $order_detail->order_id = $order->id;
                        $order_detail->seller_id = $product->user_id;
                        $order_detail->product_id = $product->id;
                        $order_detail->variation = $product_variation;
                        $order_detail->price = formated_discounted_price($product,$product_stock) * $cartItem['quantity'];
                        $order_detail->tax = $cartItem['tax'] * $cartItem['quantity'];
                        $order_detail->shipping_type = $cartItem['shipping_type'];
                        $order_detail->product_referral_code = $cartItem['product_referral_code'];
                        $order_detail->shipping_cost = $cartItem['shipping_cost'];

                        $shipping += $order_detail->shipping_cost;

                        if ($cartItem['shipping_type'] == 'pickup_point') {
                            $order_detail->pickup_point_id = $cartItem['pickup_point'];
                        }
                        //End of storing shipping cost

                        $order_detail->quantity = $cartItem['quantity'];
                        $order_detail->save();

                        $product->num_of_sale = $product->num_of_sale + $cartItem['quantity'];
                        $product->save();

                        $order->seller_id = $product->user_id;
                        if ($product->added_by == 'seller' && $product->user->seller != null){
                            $seller = $product->user->seller;
                            $seller->num_of_sale += $cartItem['quantity'];
                            $seller->save();
                        }

                        if (\App\Addon::where('unique_identifier', 'affiliate_system')->first() != null &&
                                \App\Addon::where('unique_identifier', 'affiliate_system')->first()->activated) {
                            if($order_detail->product_referral_code) {
                                $referred_by_user = User::where('referral_code', $order_detail->product_referral_code)->first();

                                $affiliateController = new AffiliateController;
                                $affiliateController->processAffiliateStats($referred_by_user->id, 0, $order_detail->quantity, 0, 0);
                            }
                        }
                    }

                    $order->grand_total = $subtotal + $tax + $shipping;

                    if ($seller_product[0]->coupon_code != null) {
                        // if (Session::has('club_point')) {
                        //     $order->club_point = Session::get('club_point');
                        // }
                        $order->coupon_discount = $coupon_discount;
                        $order->grand_total -= $coupon_discount;

                        $coupon_usage = new CouponUsage;
                        $coupon_usage->user_id = $user->id;
                        $coupon_usage->coupon_id = Coupon::where('code', $seller_product[0]->coupon_code)->first()->id;
                        $coupon_usage->save();
                    }

                    $combined_order->grand_total += $order->grand_total;

                    // if (strpos($request->payment_type, "manual_payment_") !== false) { // if payment type like  manual_payment_1 or  manual_payment_25 etc)
                    //     $order->manual_payment = 1;
                    //     $order->save();

                    // }

                    $order->save();
                }
            $combined_order->save();
            DB::commit();
        }catch(\Exception $e){

            DB::rollback();
        }


            Cart::where('user_id', $request->user_id)->delete();

            return response()->json([
                'combined_order_id' =>$combined_order->id,
                'result' => true,
                'message' => translate('Your order has been placed successfully')
            ]);
        }
}
