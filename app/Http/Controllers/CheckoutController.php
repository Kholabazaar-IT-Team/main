<?php

namespace App\Http\Controllers;

use App\Utility\PayfastUtility;
use Illuminate\Http\Request;
use Auth;
use App\Category;
use App\Cart;
use App\Http\Controllers\PaypalController;
use App\Http\Controllers\InstamojoController;
use App\Http\Controllers\ClubPointController;
use App\Http\Controllers\StripePaymentController;
use App\Http\Controllers\PublicSslCommerzPaymentController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\AffiliateController;
use App\Http\Controllers\PaytmController;
use App\Order;
use App\CommissionHistory;
use App\BusinessSetting;
use App\Coupon;
use App\CouponUsage;
use App\User;
use App\Address;
use App\CombinedOrder;
use App\Http\Controllers\ShurhoPayController;
use Session;
use App\Utility\PayhereUtility;

class CheckoutController extends Controller
{

    public function __construct()
    {
        //
    }

    //check the selected payment gateway and redirect to that controller accordingly
    public function checkout(Request $request)
    {
        if ($request->payment_option != null) {
            // dd('hit');
            (new OrderController)->store($request);
// dd('hit2');
            $request->session()->put('payment_type', 'cart_payment');

            if ($request->session()->get('combined_order_id') != null) {
                if ($request->payment_option == 'paypal') {
                    $paypal = new PaypalController;
                    return $paypal->getCheckout();
                }elseif($request->payment_option=='shurjopay'){
                    $surjopay=new ShurhoPayController();

                    return $surjopay->index($request);
                }
                elseif ($request->payment_option == 'stripe') {
                    $stripe = new StripePaymentController;
                    return $stripe->stripe();
                } elseif ($request->payment_option == 'sslcommerz') {
                    $sslcommerz = new PublicSslCommerzPaymentController;
                    return $sslcommerz->index($request);
                } elseif ($request->payment_option == 'instamojo') {
                    $instamojo = new InstamojoController;
                    return $instamojo->pay($request);
                } elseif ($request->payment_option == 'razorpay') {
                    $razorpay = new RazorpayController;
                    return $razorpay->payWithRazorpay($request);
                } elseif ($request->payment_option == 'payku') {
                    return (new PaykuController)->create($request);
                } elseif ($request->payment_option == 'voguepay') {
                    $voguePay = new VoguePayController;
                    return $voguePay->customer_showForm();
                } elseif ($request->payment_option == 'ngenius') {
                    $ngenius = new NgeniusController();
                    return $ngenius->pay();
                } elseif ($request->payment_option == 'iyzico') {
                    $iyzico = new IyzicoController();
                    return $iyzico->pay();
                } elseif ($request->payment_option == 'nagad') {
                    $nagad = new NagadController;
                    return $nagad->getSession();
                } elseif ($request->payment_option == 'bkash') {
                    $bkash = new BkashController;
                    return $bkash->pay();
                } elseif ($request->payment_option == 'aamarpay') {
                    $aamarpay = new AamarpayController;
                    return $aamarpay->index();
                } elseif ($request->payment_option == 'flutterwave') {
                    $flutterwave = new FlutterwaveController();
                    return $flutterwave->pay();
                } elseif ($request->payment_option == 'mpesa') {
                    $mpesa = new MpesaController();
                    return $mpesa->pay();
                } elseif ($request->payment_option == 'paystack') {
                    if (addon_is_activated('otp_system') && !Auth::user()->email) {
                        flash(translate('Your email should be verified before order'))->warning();
                        return redirect()->route('cart')->send();
                    }
                    $paystack = new PaystackController;
                    return $paystack->redirectToGateway($request);
                } elseif ($request->payment_option == 'payhere') {
                    $combined_order = CombinedOrder::findOrFail($request->session()->get('combined_order_id'));

                    $combined_order_id = $combined_order->id;
                    $amount = $combined_order->grand_total;
                    $first_name = json_decode($combined_order->shipping_address)->name;
                    $last_name = 'X';
                    $phone = json_decode($combined_order->shipping_address)->phone;
                    $email = json_decode($combined_order->shipping_address)->email;
                    $address = json_decode($combined_order->shipping_address)->address;
                    $city = json_decode($combined_order->shipping_address)->city;

                    return PayhereUtility::create_checkout_form($combined_order_id, $amount, $first_name, $last_name, $phone, $email, $address, $city);
                } elseif ($request->payment_option == 'payfast') {
                    $combined_order = CombinedOrder::findOrFail($request->session()->get('combined_order_id'));

                    $combined_order_id = $combined_order->id;
                    $amount = $combined_order->grand_total;

                    return PayfastUtility::create_checkout_form($combined_order_id, $amount);
                } elseif ($request->payment_option == 'paytm') {
                    if (Auth::user()->phone == null) {
                        flash('Please add phone number to your profile')->warning();
                        return redirect()->route('profile');
                    }

                    $paytm = new PaytmController;
                    return $paytm->index();
                } else if ($request->payment_option == 'authorizenet') {
                    $authorize_net = new AuthorizeNetController();
                    return $authorize_net->pay();
                } elseif ($request->payment_option == 'cash_on_delivery') {
                      $combined_order = CombinedOrder::findOrFail($request->session()->get('combined_order_id'));
                    foreach ($combined_order->orders as $key => $order) {
                        if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated && \App\OtpConfiguration::where('type', 'otp_for_order')->first()->value){
                            try {
                                $otpController = new OTPVerificationController;
                              
                                $otpController->send_order_code($order);
                            } catch (\Exception $e) {

                            }
                        }
                    }

                    $request->session()->forget('club_point');
                    flash(translate("Your order has been placed successfully"))->success();
                    return redirect()->route('order_confirmed');
                } elseif ($request->payment_option == 'wallet') {
                    $user = Auth::user();
                    $combined_order = CombinedOrder::findOrFail($request->session()->get('combined_order_id'));
                    if ($user->balance >= $combined_order->grand_total) {
                        $user->balance -= $combined_order->grand_total;
                        $user->save();
                        return $this->checkout_done($request->session()->get('combined_order_id'), null);
                    }
                } else {
                    $request->session()->forget('club_point');
                    $combined_order = CombinedOrder::findOrFail($request->session()->get('combined_order_id'));
                    foreach ($combined_order->orders as $order) {
                        $order->manual_payment = 1;
                        $order->save();
                    }
                    flash(translate('Your order has been placed successfully. Please submit payment information from purchase history'))->success();
                    return redirect()->route('order_confirmed');
                }
            }
        } else {
            flash(translate('Select Payment Option.'))->warning();
            return back();
        }
    }

    //redirects to this method after a successfull checkout
    public function checkout_done($combined_order_id, $payment)
    {
        $combined_order = CombinedOrder::findOrFail($combined_order_id);

        foreach ($combined_order->orders as $key => $order) {
            // $order = Order::findOrFail($order_id);
            $order->payment_status = 'paid';
            $order->payment_details = $payment;
            $order->save();

            if (\App\Addon::where('unique_identifier', 'affiliate_system')->first() != null && \App\Addon::where('unique_identifier', 'affiliate_system')->first()->activated) {
                $affiliateController = new AffiliateController;
                $affiliateController->processAffiliatePoints($order);
            }

            if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated) {
                if (Auth::check()) {

                    $clubpointController = new ClubPointController;
                    $clubpointController->processClubPoints($order);
                }
            }
            if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated && \App\OtpConfiguration::where('type', 'otp_for_order')->first()->value){
                try {
                    $otpController = new OTPVerificationController;
                    $otpController->send_order_code($order);
                } catch (\Exception $e) {

                }
            }

            $vendor_commission_activation = true;
            if(\App\Addon::where('unique_identifier', 'seller_subscription')->first() != null
                && \App\Addon::where('unique_identifier', 'seller_subscription')->first()->activated
                    && !get_setting('vendor_commission_activation')){
                        $vendor_commission_activation = false;
            }

            if($vendor_commission_activation){
                foreach ($order->orderDetails as $key => $orderDetail) {
                    $orderDetail->payment_status = 'paid';
                    $orderDetail->save();
                    $commission_percentage = 0;

                    if (get_setting('category_wise_commission') != 1) {
                        $commission_percentage = get_setting('vendor_commission');
                    } else if ($orderDetail->product->user->user_type == 'seller') {
                        $commission_percentage = $orderDetail->product->category->commision_rate;
                    }

                    if ($orderDetail->product->user->user_type == 'seller') {
                        $seller = $orderDetail->product->user->seller;
                        $admin_commission = ($orderDetail->price * $commission_percentage)/100;

                        if (get_setting('product_manage_by_admin') == 1) {
                            $seller_earning = ($orderDetail->tax + $orderDetail->price) - $admin_commission;
                            $seller->admin_to_pay += $seller_earning;
                        } else {
                            $seller_earning = ($orderDetail->tax + $orderDetail->shipping_cost + $orderDetail->price) - $admin_commission;
                            $seller->admin_to_pay += $seller_earning;
                        }
                        $seller->save();

                        $commission_history = new CommissionHistory;
                        $commission_history->order_id = $order->id;
                        $commission_history->order_detail_id = $orderDetail->id;
                        $commission_history->seller_id = $orderDetail->seller_id;
                        $commission_history->admin_commission = $admin_commission;
                        $commission_history->seller_earning = $seller_earning;

                        $commission_history->save();
                    }
                }
            }
            else{
                foreach ($order->orderDetails as $key => $orderDetail) {
                    $orderDetail->payment_status = 'paid';
                    $orderDetail->save();
                    if ($orderDetail->product->user->user_type == 'seller') {
                        $seller = $orderDetail->product->user->seller;
                        $seller->admin_to_pay = $seller->admin_to_pay + $orderDetail->price + $orderDetail->tax + $orderDetail->shipping_cost;
                        $seller->save();
                    }
                }
            }

            $order->commission_calculated = 1;
            $order->save();

        }




        Cart::where('owner_id', $order->seller_id)
                ->where('user_id', $order->user_id)
                ->delete();

        Session::forget('club_point');

        Session::put('combined_order_id', $combined_order_id);
        flash(translate('Payment completed'))->success();
        return redirect()->route('order_confirmed');
    }

    public function get_shipping_info(Request $request)
    {
        $carts = array();
        if(Auth::check()){
            $carts = Cart::where('user_id', Auth::user()->id)->get();
        }else{
            $temp_user_id = Session()->get('temp_user_id');
            if($temp_user_id) {
                $carts = Cart::where('temp_user_id', $temp_user_id)->get();
            }
        }
        if ($carts && count($carts) > 0) {
            $categories = Category::all();
            return view('frontend.shipping_info', compact('categories', 'carts'));
        }
        flash(translate('Your cart is empty'))->success();
        return redirect()->route('home');
    }

    public function store_shipping_info(Request $request)
    {
        $carts = array();
        if(Auth::check()){
            if ($request->address_id == null) {
                flash(translate("Please add shipping address"))->warning();
                return back();
            }
            if (!$request->has('same_address') && $request->billing_address_id == null) {
                flash(translate("Please add billing address"))->warning();
                return back();
            }
            $carts = Cart::where('user_id', Auth::user()->id)->get();

            foreach ($carts as $key => $cartItem) {
                $cartItem->address_id = $request->address_id;
                $cartItem->billing_address_id = ($request->has('same_address')) ? $request->address_id : $request->billing_address_id;
                $cartItem->save();
            }
        }else{
            $temp_user_id = Session()->get('temp_user_id');
            if($temp_user_id) {
                $carts = Cart::where('temp_user_id', $temp_user_id)->get();

                $shipping_address = collect();

                $data = array();
                $data['name'] = $request->name;
                $data['address'] = $request->address;
                $data['country'] = $request->country;
                $data['city'] = $request->city;
                   $data['email'] = $request->email;
                $data['area'] = $request->area;
                $data['postal_code'] = $request->postal_code;
                $data['phone'] = $request->phone;

                $shipping_address = collect($data);

                if($request->has('same_address')){
                    $billing_address = collect($data);
                }else{
                    $billing_address = collect();

                    $b_data = array();
                    $b_data['name'] = $request->billing_name;
                    $b_data['address'] = $request->billing_address;
                    $b_data['country'] = $request->billing_country;
                    $b_data['city'] = $request->billing_city;
                    $b_data['area'] = $request->billing_area;
                    $b_data['postal_code'] = $request->billing_postal_code;
                    $b_data['phone'] = $request->billing_phone;

                    $billing_address = collect($b_data);
                }


                foreach ($carts as $key => $cartItem) {
                    $cartItem->shipping_address = json_encode($shipping_address);
                    $cartItem->billing_address = json_encode($billing_address);
                    $cartItem->save();
                }
            }

        }

        if (count($carts) == 0) {
            flash(translate('Your cart is empty'))->success();
            return redirect()->route('home');
        }

        return view('frontend.delivery_info', compact('carts'));
        // return view('frontend.payment_select', compact('total'));
    }

    public function store_delivery_info(Request $request)
    {

        $carts = array();
        if(Auth::check()){
            $carts = Cart::where('user_id', Auth::user()->id)
                // ->where('owner_id', $request->owner_id)
                ->get();
            if (count($carts) > 0) {
                $shipping_info = Address::where('id', $carts[0]['address_id'])->first();
            }
        }else{
            $temp_user_id = Session()->get('temp_user_id');
            if($temp_user_id) {
                // $carts = Cart::where('temp_user_id', $temp_user_id)->where('owner_id', $request->owner_id)->get(); //old
                $carts = Cart::where('temp_user_id', $temp_user_id)->get();

                if (count($carts) > 0) {
                    $shipping_info = Cart::where('temp_user_id', $temp_user_id)->first()->shipping_address;
                    $shipping_info = json_decode($shipping_info,true);
                }
            }
        }

        if (count($carts) == 0) {
            flash(translate('Your cart is empty'))->success();
            return redirect()->route('home');
        }

        $total = 0;
        $tax = 0;
        $shipping = 0;
        $subtotal = 0;
        // dd($carts);
        if ($carts && count($carts) > 0) {
            foreach ($carts as $key => $cartItem) {
                $product = \App\Product::find($cartItem['product_id']);
                $tax += $cartItem['tax'] * $cartItem['quantity'];
                $subtotal += $cartItem['price'] * $cartItem['quantity'];

                if ($request['shipping_type_' . $request->owner_id] == 'pickup_point') {
                    $cartItem['shipping_type'] = 'pickup_point';
                    $cartItem['pickup_point'] = $request['pickup_point_id_' . $request->owner_id];
                    $cartItem['time_slot'] = $request['pickup_point_time_id_' . $request->owner_id];

                } else {
                    $cartItem['shipping_type'] = 'home_delivery';
                }
                $cartItem['shipping_cost'] = 0;
                if ($cartItem['shipping_type'] == 'home_delivery') {
                    $cartItem['shipping_cost'] = getShippingCost($carts, $key);
                }
                    // dd(getShippingCost($carts, $key));
                if(isset($cartItem['shipping_cost']) && is_array(json_decode($cartItem['shipping_cost'], true))) {

                    foreach(json_decode($cartItem['shipping_cost'], true) as $shipping_region => $val) {
                        if($shipping_info['city'] == $shipping_region) {
                            $cartItem['shipping_cost'] = (double)($val);
                            break;
                        } else {
                            $cartItem['shipping_cost'] = 0;
                        }
                    }
                } else {
                    if (!$cartItem['shipping_cost'] ||
                            $cartItem['shipping_cost'] == null ||
                            $cartItem['shipping_cost'] == 'null') {

                        $cartItem['shipping_cost'] = 0;
                    }
                }

                if($product->is_quantity_multiplied == 1 && get_setting('shipping_type') == 'product_wise_shipping') {
                    $cartItem['shipping_cost'] =  $cartItem['shipping_cost'] * $cartItem['quantity'];
                }

                $shipping += $cartItem['shipping_cost'];
                $cartItem->save();

            }
            $total = $subtotal + $tax + $shipping;
            // dd($subtotal , $tax , $shipping);
            return view('frontend.payment_select', compact('carts', 'shipping_info', 'total'));

        } else {
            flash(translate('Your Cart was empty'))->warning();
            return redirect()->route('home');
        }
    }

     public function apply_coupon_code(Request $request)
    {
        $coupon = Coupon::where('code', $request->code)->first();
        if(Auth::check()){
            $usr_id=Auth::user()->id;
            $carts = Cart::where('user_id', Auth::user()->id)
            // ->where('owner_id', $request->owner_id)
            ->get();
        }else{
            $temp_user_id = Session()->get('temp_user_id');
            $usr_id=  $temp_user_id ;
            if($temp_user_id) {
                // $carts = Cart::where('temp_user_id', $temp_user_id)->where('owner_id', $request->owner_id)->get(); //old
                $carts = Cart::where('temp_user_id', $temp_user_id)->get();

            }
        }
        // dd('hit');
        $response_message = array();

        if ($coupon != null) {
            if (strtotime(date('d-m-Y')) >= $coupon->start_date && strtotime(date('d-m-Y')) <= $coupon->end_date) {

                if (CouponUsage::where('user_id',$usr_id)->where('coupon_id', $coupon->id)->count() < $coupon->num_of_use) {
                    $coupon_details = json_decode($coupon->details);
                    $coupon_discount=0;
                    if ($coupon->type == 'cart_base') {
                     
                        $subtotal = 0;
                        $tax = 0;
                        $sum=0;
                        $shipping = 0;
                        $crt_products=[];
                        foreach ($carts as $key => $cartItem) {
                            $subtotal += $cartItem['price'] * $cartItem['quantity'];
                            $tax += $cartItem['tax'] * $cartItem['quantity'];
                            $shipping += $cartItem['shipping_cost'];
                            array_push($crt_products,$cartItem['product_id']);
                            // dd(in_array($cartItem['product_id'],json_decode(json_decode($coupon->details)->products )));
                           
                            if(in_array($cartItem['product_id'],json_decode(json_decode($coupon->details)->products ))){
                                $sum += ($cartItem['price'] * $cartItem['quantity']) ;
                            }

                        }
                        // dd($sum);

                        // dd(json_decode(json_decode($coupon->details)->products )==$crt_products);
                        if(empty(array_intersect(json_decode(json_decode($coupon->details)->products ),$crt_products))){
                            if(  Session()->get('temp_user_id')){
                                $carts = Cart::where('temp_user_id', $temp_user_id)->get();
                    
                                $shipping_info["city"] = json_decode($carts[0]['shipping_address'])->city;
                    
                            }else{
                                $carts = Cart::where('user_id', $usr_id)
                                ->get();
                                $shipping_info = Address::where('id', $carts[0]['address_id'])->first();
                    
                            }
                            $response_message['response'] = 'danger';
                            $response_message['message'] = translate('Required Products For this coupon Not Found ');
                            $returnHTML = view('frontend.partials.cart_summary', compact('coupon', 'carts', 'shipping_info'))->render();
                            return response()->json(array('response_message' => $response_message, 'html'=>$returnHTML));
                        }

                        $sum +=  $tax + $shipping;

                        if ($sum >= $coupon_details->min_buy ) {
                            if ($coupon->discount_type == 'percent') {
                                $coupon_discount = ($sum * $coupon->discount) / 100;
                                // dd($coupon_discount);
                                if ($coupon_discount >= $coupon_details->max_discount) {
                                    $coupon_discount = $coupon_details->max_discount;
                                }
                            } elseif ($coupon->discount_type == 'amount') {
                                // dd($coupon->discount);
                                $coupon_discount = $coupon->discount;
                            }

                        }
                    } elseif ($coupon->type == 'product_base') {
                        $coupon_discount = 0;
                        foreach ($carts as $key => $cartItem) {
                            foreach ($coupon_details as $key => $coupon_detail) {
                                if ($coupon_detail->product_id == $cartItem['product_id']) {
                                    if ($coupon->discount_type == 'percent') {
                                        $coupon_discount += $cartItem['price'] * $coupon->discount / 100;
                                    } elseif ($coupon->discount_type == 'amount') {
                                        $coupon_discount += $coupon->discount;
                                    }
                                }
                            }
                        }
                    }elseif($coupon->type == 'category_base'){

                        $sum=0;
                        $p_price=0;
                        $cats=[];
                        foreach ($carts as $key => $cartItem) {
                            $product=Product::findOrFail($cartItem->product_id);
                            $category=$product->category->id;
                            array_push($cats,$category);
                            if(  $category == (int)$coupon_details->categorty  ){

                                $sum=$sum+(1*$cartItem->quantity);
                                $p_price+=$product->price;

                            }
                        }
                        if ($sum >= $coupon_details->min_buy) {
                            if ($coupon->discount_type == 'percent') {
                                $coupon_discount = ($p_price * $coupon->discount) / 100;
                                if ($coupon_discount > $coupon_details->max_discount) {
                                    $coupon_discount = $coupon_details->max_discount;
                                }
                            } elseif ($coupon->discount_type == 'amount') {
                                $coupon_discount = $coupon->discount;
                            }

                        }
                    }elseif($coupon->type == 'brand_base'){
                        $sum=0;
                        $p_price=0;
                        foreach ($carts as $key => $cartItem) {
                            $product=Product::findOrFail($cartItem->product_id);
                            $brand=$product->brand->id;
                            if(  $brand == $coupon_details->brand){
                                $sum=$sum+1;
                                $p_price+=$product->price;
                            }

                        }

                        if ($sum >= $coupon_details->min_buy) {
                            if ($coupon->discount_type == 'percent') {
                                $coupon_discount = ($p_price * $coupon->discount) / 100;
                                if ($coupon_discount > $coupon_details->max_discount) {
                                    $coupon_discount = $coupon_details->max_discount;
                                }
                            } elseif ($coupon->discount_type == 'amount') {
                                $coupon_discount = $coupon->discount;
                            }

                        }
                    }
                    // dd($coupon_discount);
                   if($coupon_discount>0){
                        if($coupon->type == 'brand_base' || $coupon->type == 'category_base' ){
                            if(Session()->get('temp_user_id')){
                                Cart::where('temp_user_id',$usr_id)

                                ->update(
                                        [
                                            'discount' => $coupon_discount,
                                            'coupon_code' => $request->code,
                                            'coupon_applied' => 1
                                        ]
                                    );
                            }else{
                                Cart::where('user_id', Auth::user()->id)

                                ->update(
                                        [
                                            'discount' => $coupon_discount,
                                            'coupon_code' => $request->code,
                                            'coupon_applied' => 1
                                        ]
                                    );
                            }

                        }else{
                            if(Session()->get('temp_user_id')){
                                Cart::where('temp_user_id', $usr_id)

                                ->update(
                                        [
                                           'discount' => $coupon_discount / count($carts),
                                            'coupon_code' => $request->code,
                                            'coupon_applied' => 1
                                        ]
                                    );
                            }else{
                                Cart::where('user_id', Auth::user()->id)

                                ->update(
                                        [
                                            'discount' => $coupon_discount / count($carts),
                                            'coupon_code' => $request->code,
                                            'coupon_applied' => 1
                                        ]
                                    );
                            }
                        }
                        $response_message['response'] = 'success';
                        $response_message['message'] = translate('Coupon has been applied');
                   }else{
                    $response_message['response'] = 'danger';
                    $response_message['message'] = translate('Not Enough Product found to apply coupon');
                   }


                } else {
                    $response_message['response'] = 'warning';
                    $response_message['message'] = translate('You already used this coupon!');
                }
            } else {
                $response_message['response'] = 'warning';
                $response_message['message'] = translate('Coupon expired!');
            }
        } else {
            $response_message['response'] = 'danger';
            $response_message['message'] = translate('Invalid coupon!');
        }

       if(  Session()->get('temp_user_id')){
            $carts = Cart::where('temp_user_id', $temp_user_id)->get();

            $shipping_info["city"] = json_decode($carts[0]['shipping_address'])->city;

        }else{
            $carts = Cart::where('user_id', $usr_id)
            ->get();
            $shipping_info = Address::where('id', $carts[0]['address_id'])->first();

        }

        $returnHTML = view('frontend.partials.cart_summary', compact('coupon', 'carts', 'shipping_info'))->render();
        return response()->json(array('response_message' => $response_message, 'html'=>$returnHTML));
    }




    public function remove_coupon_code(Request $request)
    {
         if(Auth::check()){
            Cart::where('user_id', Auth::user()->id)
                // ->where('owner_id', $request->owner_id)
                ->update(
                        [
                            'discount' => 0.00,
                            'coupon_code' => '',
                            'coupon_applied' => 0
                        ]
        );
           
        }else{
            $temp_user_id = Session()->get('temp_user_id');
            $usr_id=  $temp_user_id ;
            if($temp_user_id) {
                // $carts = Cart::where('temp_user_id', $temp_user_id)->where('owner_id', $request->owner_id)->get(); //old
                $carts = Cart::where('temp_user_id', $temp_user_id)->update(
                        [
                            'discount' => 0.00,
                            'coupon_code' => '',
                            'coupon_applied' => 0
                        ]
        );;

            }
        }
       

        $coupon = Coupon::where('code', $request->code)->first();
       
//        dd($carts);
       if(  Session()->get('temp_user_id')){
                                $carts = Cart::where('temp_user_id', $temp_user_id)->get();
                    
                                $shipping_info["city"] = json_decode($carts[0]['shipping_address'])->city;
                                 return view('frontend.partials.cart_summary', compact('coupon', 'carts', 'shipping_info'));
                    
                            }else{
                                $carts = Cart::where('user_id', $usr_id)
                                ->get();
                                $shipping_info = Address::where('id', $carts[0]['address_id'])->first();
                                 return view('frontend.partials.cart_summary', compact('coupon', 'carts', 'shipping_info'));
                    
                            }

       
//        return back();
    }
    public function apply_club_point(Request $request) {
        if (\App\Addon::where('unique_identifier', 'club_point')->first() != null &&
                \App\Addon::where('unique_identifier', 'club_point')->first()->activated){

            $point = $request->point;

           if(Auth::user()->club_point->points >= $point) {
            // if(Auth::user()->point_balance >= $point) {
                $request->session()->put('club_point', $point);
                flash(translate('Point has been redeemed'))->success();
            }
            else {
                flash(translate('Invalid point!'))->warning();
            }
        }
        return back();
    }

    public function remove_club_point(Request $request) {
        $request->session()->forget('club_point');
        return back();
    }

    public function order_confirmed()
    {
        // $order = Order::findOrFail(Session::get('order_id')); old

        // Cart::where('user_id', $order->user_id)
        //         ->delete();

        $combined_order = CombinedOrder::findOrFail(Session::get('combined_order_id'));

        Cart::where('user_id', $combined_order->user_id)
                ->orWhere('temp_user_id',$combined_order->user_id)
                ->delete();

        // return view('frontend.order_confirmed', compact('order'));//old
        return view('frontend.order_confirmed', compact('combined_order'));

    }
}
