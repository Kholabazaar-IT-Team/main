<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Session;
use Auth;
use Illuminate\Routing\UrlGenerator;
use App\Http\Controllers;
use App\Order;
use App\BusinessSetting;
use App\Seller;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\CommissionController;
use App\Http\Controllers\WalletController;
use App\CustomerPackage;
use App\SellerPackage;
use App\CombinedOrder;
use App\Http\Controllers\CustomerPackageController;
session_start();

class ShurhoPayController extends Controller
{
    protected $sslc_submit_url;
    protected $sslc_validation_url;
    protected $payment_validation_url;
    protected $sslc_mode;
    protected $sslc_data;
    protected $user_name;
    protected $store_pass;
    protected $token_type;
    protected $token;
    public $error = '';
    public function __construct()
    {
        if(Session::has('payment_type')){
            if(Session::get('payment_type') == 'cart_payment' || Session::get('payment_type') == 'wallet_payment'){
                # IF SANDBOX TRUE, THEN IT WILL CONNECT WITH SSLCOMMERZ SANDBOX (TEST) SYSTEM
                if(BusinessSetting::where('type', 'shurjopay_sandbox')->first()->value == 1){
                    define("SSLCZ_IS_SANDBOX", true);
                }
                else{
                    define("SSLCZ_IS_SANDBOX", false);
                }

                $this->shurjoPayMode((SSLCZ_IS_SANDBOX) ? 1 : 0);
                $this->user_name = env('SHURJOPAY_USERNAME');
                $this->store_pass = env('SHURJOPAY_PASSWD');
            }
            elseif (Session::get('payment_type') == 'seller_payment') {
                $seller = Seller::findOrFail(Session::get('payment_data')['seller_id']);
                $this->shurjoPayMode((true) ? 1 : 0);
                $this->store_id = $seller->ssl_store_id;
                $this->store_pass = $seller->ssl_password;
            }
        }
        $this->sslc_submit_url ="https://" . $this->sslc_mode . ".shurjopayment.com/api/secret-pay";
        $this->sslc_validation_url = "https://" . $this->sslc_mode . ".shurjopayment.com/api/get_token";
        $this->payment_validation_url= "https://" . $this->sslc_mode . ".shurjopayment.com/api/verification";
        $this->token_type='Bearer';
    }
        # SET SSLCOMMERZ PAYMENT MODE - LIVE OR TEST
        protected function shurjoPayMode($test)
        {
            if ($test) {
                $this->sslc_mode = "sandbox";
            } else {
                $this->sslc_mode = "engine";
            }
        }

    public function index(Request $request)
    {

            # Here you have to receive all the order data to initate the payment.
            # Lets your oder trnsaction informations are saving in a table called "orders"
            # In orders table order uniq identity is "order_id","order_status" field contain status of the transaction, "grand_total" is the order amount to be paid and "currency" is for storing Site Currency which will be checked with paid currency.
            if(Session::has('payment_type')){
                if(Session::get('payment_type') == 'cart_payment'){
                    $combined_order = CombinedOrder::findOrFail($request->session()->get('combined_order_id'));
                    $post_data = array();
                    $post_data['amount'] = $combined_order->grand_total; # You cant not pay less than 10
                    $post_data['currency'] = "BDT";
                    $post_data['order_id'] = (string)$request->session()->get('combined_order_id'); // order_id must be unique

                    $post_data['value1'] =(string) $post_data['order_id'];
                    $post_data['value2'] =  (string)$request->session()->get('combined_order_id');
                    $post_data['value3'] =(string) $request->session()->get('payment_type');
                    $post_data['value4'] =(string) $request->session()->get('payment_type');

                    #Start to save these value  in session to pick in success page.
                    // $_SESSION['payment_values']['tran_id']=$post_data['tran_id'];
                    // $_SESSION['payment_values']['order_id']=$request->session()->get('order_id');
                    // $_SESSION['payment_values']['payment_type']=$request->session()->get('payment_type');
                    #End to save these value  in session to pick in success page.

                }
                elseif (Session::get('payment_type') == 'wallet_payment') {
                    $post_data = array();
                    $post_data['amount'] = $request->session()->get('payment_data')['amount']; # You cant not pay less than 10
                    $post_data['currency'] = "BDT";
                    $post_data['order_id'] = substr(md5(Auth::user()->id), 0, 10); // tran_id must be unique

                    $post_data['value1'] = $post_data['order_id'];
                    $post_data['value2'] = json_encode($request->session()->get('payment_data'));
                    $post_data['value3'] = $request->session()->get('payment_type');

                    #Start to save these value  in session to pick in success page.
                    // $_SESSION['payment_values']['tran_id']=$post_data['tran_id'];
                    // $_SESSION['payment_values']['payment_data']=$request->session()->get('payment_data');
                    // $_SESSION['payment_values']['payment_type']=$request->session()->get('payment_type');
                    #End to save these value  in session to pick in success page.

                }
                elseif (Session::get('payment_type') == 'customer_package_payment') {
                    $customer_package = CustomerPackage::findOrFail(Session::get('payment_data')['customer_package_id']);
                    $post_data = array();
                    $post_data['amount'] = $customer_package->amount; # You cant not pay less than 10
                    $post_data['currency'] = "BDT";
                    $post_data['order_id'] = substr(md5(Auth::user()->id), 0, 10); // tran_id must be unique

                    $post_data['value1'] = $post_data['order_id'];
                    $post_data['value2'] = json_encode($request->session()->get('payment_data'));
                    $post_data['value3'] = $request->session()->get('payment_type');

                    #Start to save these value  in session to pick in success page.
                    // $_SESSION['payment_values']['tran_id']=$post_data['tran_id'];
                    // $_SESSION['payment_values']['payment_data']=$request->session()->get('payment_data');
                    // $_SESSION['payment_values']['payment_type']=$request->session()->get('payment_type');
                    #End to save these value  in session to pick in success page.
                }
                elseif (Session::get('payment_type') == 'seller_package_payment') {
                    $seller_package = SellerPackage::findOrFail(Session::get('payment_data')['seller_package_id']);
                    $post_data = array();
                    $post_data['amount'] = $seller_package->amount; # You cant not pay less than 10
                    $post_data['currency'] = "BDT";
                    $post_data['order_id'] = substr(md5(Auth::user()->id), 0, 10); // order_id must be unique

                    $post_data['value1'] = $post_data['order_id'];
                    $post_data['value2'] = json_encode($request->session()->get('payment_data'));
                    $post_data['value3'] = $request->session()->get('payment_type');

                    #Start to save these value  in session to pick in success page.
                    // $_SESSION['payment_values']['tran_id']=$post_data['tran_id'];
                    // $_SESSION['payment_values']['payment_data']=$request->session()->get('payment_data');
                    // $_SESSION['payment_values']['payment_type']=$request->session()->get('payment_type');
                    #End to save these value  in session to pick in success page.

                }

                # CUSTOMER INFORMATION
                $user = Auth::user();
                $post_data['customer_name'] = $user->name;
                $post_data['customer_address'] = $user->address?$user->address:"Bangladesh";
                $post_data['customer_city'] = $user->city?$user->city:"Dhaka";
                $post_data['customer_postcode'] = $user->postal_code;
                $post_data['customer_country'] =$user->country? $user->country:"Bangladesh";
                $post_data['customer_state'] = $user->country? $user->country:"Bangladesh";
                $post_data['customer_phone'] = $user->phone?$user->phone:'01886790890';
                $post_data['customer_email'] = $user->email;
            }

            $server_name=$request->root()."/";
            $post_data['return_url'] = $server_name."shurjopay/success";
            $post_data['cancel_url'] = $server_name."shurjopay/cancel";
            $resp=$this->validate_user();
            if($resp->sp_code=='200'){
                $request->session()->put('token', $resp->token);
                $user=Auth::user();
                $user->update([
                    "pay_token"=>$resp->token
                ]);
                $post_data['token'] =$resp->token;
                $post_data['store_id'] =$resp->store_id;
                $post_data['prefix'] =  $this->sslc_mode =="sandbox"?'NOK':'KHOLA';
                // dd($_SERVER);
                $post_data['client_ip']= $request->ip();
                $this->token_type=$resp->token_type;
                $this->initiate($post_data,false);


            }else{
                dd('authorization failed');
            }



            # initiate(Transaction Data , false: Redirect to SSLCOMMERZ gateway/ true: Show all the Payement gateway here )
            $payment_options = $this->initiate($post_data, false);

            if (!is_array($payment_options)) {
                print_r($payment_options);
                $payment_options = array();
            }

    }


    public function validate_user(){

        $url=$this->sslc_validation_url;
        $ch = curl_init($url);
        $data["username"]=$this->user_name;
        $data["password"]=$this->store_pass;
        $postdata=json_encode($data);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS,$postdata);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);

        // In real life you should use something like:
        curl_setopt($ch, CURLOPT_POSTFIELDS,$data);
        $server_output = curl_exec($ch);
        $resp=json_decode($server_output);

        return $resp;

    }

    public function initiate($post_data, $get_pay_options = false)
    {
        if ($post_data != '' && is_array($post_data)) {

            $load_sslc = $this->sendRequest($post_data);

            // dd($load_sslc);
            if ($load_sslc) {
                if ($load_sslc->transactionStatus == 'Initiated') {
                    if (!$get_pay_options) {
                        if ($load_sslc->checkout_url && $load_sslc->checkout_url != '') {
                            //header("Location: " . $this->sslc_data['GatewayPageURL']);
                            echo "
                                <script>
                                    window.location.href = '" . $load_sslc->checkout_url . "';
                                </script>
                            ";
                            exit;
                        } else {
                            $this->error = "No redirect URL found!";
                            return $this->error;
                        }
                    } else{
                        dd('not handled yet');
                    }

                } else {

                    $this->error = "Invalid Credential!";
                    return $this->error;
                }

            } else {
                $this->error = "Connectivity Issue. Please contact your sslcommerz manager";
                return $this->error;
            }
        } else {
            $msg = "Please provide a valid information list about transaction with transaction id, amount, success url, fail url, cancel url, store id and pass at least";
            $this->error = $msg;
            return false;
        }

    }

    public function sendRequest($post_data){
        // dd($post_data);
        $url=$this->sslc_submit_url;

        $ch = curl_init($url);
        $header[] = "Content-type: application/json";
        $header[] = "Accept: application/json";
        $header[]="AuthorizationBearer: Bearer".$post_data["token"]."";


        $order=CombinedOrder::findOrFail($post_data["value2"]);
        $order->update([
            'token'=>$post_data["token"]
        ]);
        // Session::set('token_type' ,$this->token_type);
        $postdata=json_encode($post_data);

        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS,$postdata);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch,CURLOPT_HTTPHEADER,$header);
        $server_output = curl_exec($ch);
        $resp=json_decode($server_output);
        return $resp;

    }
    public function success(Request $request){
        if($request->order_id !=null ){
            if(BusinessSetting::where('type', 'shurjopay_sandbox')->first()->value == 1){
                define("SSLCZ_IS_SANDBOX", true);
            }
            else{
                define("SSLCZ_IS_SANDBOX", false);
            }

            $this->shurjoPayMode((SSLCZ_IS_SANDBOX) ? 1 : 0);
            $this->payment_validation_url= "https://" . $this->sslc_mode . ".shurjopayment.com/api/verification";

        $url=$this->payment_validation_url;

        $ch = curl_init($url);
        $header[] = "Content-type: application/json";
        $header[] = "Accept: application/json";
        $header[]="Authorization: Bearer ".Auth::user()->pay_token."";

            // dd($header);
        $data["order_id"]=$request->order_id;
        $postdata=json_encode($data);

        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS,$postdata);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch,CURLOPT_HTTPHEADER,$header);
        $server_output = curl_exec($ch);
        $resp=json_decode($server_output);
       if($resp){

            $resp=$resp[0];

            if(  $resp->sp_massage == "Success"){
                if($resp->order_id==$request->order_id){
                    if($resp->value3 == 'cart_payment'){
                        // if(BusinessSetting::where('type', 'shurjopay_sandbox')->first()->value == 1){
                        //     flash(translate('This Payment System is In Sandbox Mode '))->warning();
                        //   return  redirect()->route('home');
                        // }
                        $checkoutController = new CheckoutController;
                        return $checkoutController->checkout_done($resp->customer_order_id,json_encode($resp));
                    }
                    elseif ($resp->value3 == 'wallet_payment') {
                        $walletController = new App\Http\WalletController;
                        return $walletController->wallet_payment_done(json_decode($resp->customer_order_id), json_encode($resp));
                    }
                    elseif ($resp->value3 == 'customer_package_payment') {
                        $customer_package_controller = new App\Http\CustomerPackageController;
                        return $customer_package_controller->purchase_payment_done(json_decode($resp->customer_order_id), json_encode($resp));
                    }
                    elseif ($resp->value3 == 'seller_package_payment') {
                        $seller_package_controller = new App\Http\SellerPackageController;
                        return $seller_package_controller->purchase_payment_done(json_decode($resp->customer_order_id), json_encode($resp));
                    }

                }else{
                    $request->session()->forget('order_id');
                    $request->session()->forget('payment_data');
                    flash(translate('Payment Failed'))->warning();
                    return redirect()->route('checkout.shipping_info');
                }
            }else{
            $request->session()->forget('order_id');
            $request->session()->forget('payment_data');
            flash(translate('Payment Failed'))->warning();
            return redirect()->route('checkout.shipping_info');
            }
        }
       }else{
            $request->session()->forget('order_id');
            $request->session()->forget('payment_data');
            flash(translate('Payment Failed'))->warning();
            return redirect()->route('checkout.shipping_info');
       }

    }
    public function cancel(Request $request){
        $request->session()->forget('order_id');
        $request->session()->forget('payment_data');
        flash(translate('Payment cancelled'))->warning();
    	return redirect()->route('home');
    }

}
