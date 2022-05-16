<?php

namespace App\Http\Controllers;
use App\BusinessSetting;
use App\Http\Controllers\SSLCommerz;
use App\CombinedOrder;
use App\User;
use App\Wallet;
use Auth;
use Illuminate\Http\Request;

class ShurjopayApiController extends Controller
{


    protected $sslc_submit_url;
    protected $sslc_validation_url;
    protected $payment_validation_url;
    // protected $payment_validation_url;
    protected $sslc_mode;
    protected $sslc_data;
    protected $user_name;
    protected $store_pass;
    protected $token_type;
    protected $token;
    public $error = '';
    public function begin(Request $request){

        $payment_type = $request->payment_type;
        $combined_order_id = $request->combined_order_id;
        $amount = $request->amount;
        $user_id = $request->user_id;

        $post_data = array();


        // if ($request->payment_type == "sslcommerz_payment") {
        //     $post_data['tran_id'] = 'AIZ-' . $request->combined_order_id . '-' . date('Ymd'); // tran_id must be unique

        // } else if ($request->payment_type == "wallet_payment") {
        //     $post_data['tran_id'] = 'AIZ-' . $request->user_id . '-' . date('Ymd');
        // }
        if ($payment_type == "shurjopay_payment") {

            $combined_order = CombinedOrder::find($combined_order_id);
            $post_data['currency'] = "BDT";
            $post_data['order_id'] = (string)$combined_order_id; // order_id must be unique
            $post_data['value1'] =(string) $post_data['order_id'];
            $post_data['value2'] =  (string)$combined_order_id; // order_id must be unique
            $post_data['value3'] =(string) $payment_type;
            $post_data['value4'] =(string) $payment_type;
            $post_data['amount'] = $combined_order->grand_total; # You cant not pay less than 10

        } else if ($request->payment_type == "wallet_payment") {
            $post_data['value_a'] = $request->user_id;
            $post_data['value_b'] = 'sslcommerz';
            $post_data['value_c'] = $request->payment_type;
            $post_data['value_d'] = $request->amount;

        }
         # CUSTOMER INFORMATION
         $user = User::findOrFail( $request->user_id);
         $post_data['customer_name'] = $user->name;
         $post_data['customer_address'] = $user->address;
         $post_data['customer_city'] = $user->city;
         $post_data['customer_postcode'] = $user->postal_code;
         $post_data['customer_country'] = $user->country;
         $post_data['customer_state'] = $user->country;
         $post_data['customer_phone'] = $user->phone?$user->phone:'01886790890';
         $post_data['customer_email'] = $user->email;
         $post_data['return_url'] =url("api/v2/shurjopay/success/".$user->id);
         $post_data['cancel_url'] = url("shurjopay/cancel");

        //  $this->user_name = env('SHURJOPAY_USERNAME');
        //  $this->store_pass = env('SHURJOPAY_PASSWD');
        if (BusinessSetting::where('type', 'sslcommerz_sandbox')->first()->value == 1) {

            define("SSLCZ_IS_SANDBOX", true);
        }
        else {
            define("SSLCZ_IS_SANDBOX", false);
        }

        $this->setSSLCommerzMode((SSLCZ_IS_SANDBOX) ? 1 : 0);


        $this->sslc_submit_url ="https://" . $this->sslc_mode . ".shurjopayment.com/api/secret-pay";
        $this->sslc_validation_url = "https://" . $this->sslc_mode . ".shurjopayment.com/api/get_token";
        $this->payment_validation_url= "https://" . $this->sslc_mode . ".shurjopayment.com/api/verification";
        $this->user_name = env('SHURJOPAY_USERNAME');
        $this->store_pass = env('SHURJOPAY_PASSWD');
         $resp=$this->validate_user();
            if($resp->sp_code=='200'){
                // $request->session()->put('token', $resp->token);
                // $user=Auth::user();
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
            // $payment_options = $this->initiate($post_data, false);

            // if (!is_array($payment_options)) {
            //     print_r($payment_options);
            //     $payment_options = array();
            // }


    }
    # SET SSLCOMMERZ PAYMENT MODE - LIVE OR TEST
    public function setSSLCommerzMode($test)
    {
        if ($test) {
            $this->sslc_mode = "sandbox";
        } else {
            $this->sslc_mode = "securepay";
        }
    }

    public function validate_user(){

        $url=$this->sslc_validation_url;
        $ch = curl_init($url);

        $data["username"]=env('SHURJOPAY_USERNAME');
        $data["password"]=env('SHURJOPAY_PASSWD');
        $postdata=json_encode($data);
        // dd($url);
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
                           try{
                            // return response()->json([
                            //     'result' => true,
                            //     'url' =>  $load_sslc->checkout_url,
                            //     'message' => 'Redirect Url is found'
                            // ]);
                            // return response()->json([
                            // 'result' => true,
                            // 'url' =>  $this->sslc_data['GatewayPageURL'],
                            // 'message' => 'Redirect Url is found'
                            // ]);
                            // dd(json_encode([
                            //     'result' => true,
                            //     'url' =>  $load_sslc->checkout_url,
                            //     'message' => 'Redirect Url is found'
                            // ]));
                            dd($load_sslc->checkout_url);
                            $r=json_encode(array(
                                'result' => true,
                                    'url' =>  $load_sslc->checkout_url,
                                    'message' => 'Redirect Url is found'
                            ));
                            print_r($r);
                           }catch(Exception $e){
                               dd($e);
                           }
                            // echo $load_sslc->checkout_url;

                        } else {
                            return response()->json([
                                'result' => false,
                                'url' => '',
                                'message' => 'No redirect URL found!'
                            ]);
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
        // dd($url);
        $ch = curl_init($url);
        $header[] = "Content-type: application/json";
        $header[] = "Accept: application/json";
        $header[]="AuthorizationBearer: Bearer".$post_data["token"]."";


        // $order=CombinedOrder::findOrFail($post_data["value2"]);
        // $order->update([
        //     'token'=>$post_data["token"]
        // ]);
        // Session::set('token_type' ,$this->token_type);
        $postdata=json_encode($post_data);
        // dd($postdata);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS,$postdata);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch,CURLOPT_HTTPHEADER,$header);
        $server_output = curl_exec($ch);
        $resp=json_decode($server_output);
        return $resp;

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

      public function payment_fail(Request $request){
        return response()->json(['result' => true, 'message' => translate("Payment Failed")]);
      }
    public function payment_success(Request $request ,$id){
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
        $user=User::findOrFail($id);
        $header[] = "Content-type: application/json";
        $header[] = "Accept: application/json";
        $header[]="Authorization: Bearer ".$user->pay_token."";

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
                // dd('hit');
                if($resp->order_id==$request->order_id){
                    // dd($resp->value2);
                    if($resp->value3 == 'shurjopay_payment'){
                        if(BusinessSetting::where('type', 'shurjopay_sandbox')->first()->value == 1){
                            return response()->json(['result' => true, 'message' => translate("This Pay method is in Sandbox Mode")]);
                        }

                        checkout_done($resp->value2,json_encode($resp));
                        return response()->json(['result' => true, 'message' => translate("Payment is successful")]);
                    }
                    elseif ($resp->value3 == 'wallet_payment') {
                        wallet_payment_done($resp->value2, $resp->value_d, 'Shurjopay', json_encode($resp));
                        return response()->json(['result' => true, 'message' => translate("Payment is successful")]);
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
                    return response()->json(['result' => true, 'message' => translate("Payment Failed")]);
                }
            }else{
                return response()->json(['result' => true, 'message' => translate("Payment Failed")]);
            }
        }
       }else{
        return response()->json(['result' => true, 'message' => translate("Payment Failed")]);
       }

    }
}
