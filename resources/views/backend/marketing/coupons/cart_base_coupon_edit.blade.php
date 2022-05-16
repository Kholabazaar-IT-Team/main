@php
    $coupon_det = json_decode($coupon->details);
@endphp

<div class="card-header mb-2">
   <h3 class="h6">{{translate('Edit Your Cart Base Coupon')}}</h3>
</div>
<div class="form-group row">
   <label class="col-lg-3 col-from-label" for="coupon_code">{{translate('Coupon code')}}</label>
   <div class="col-lg-9">
       <input type="text" value="{{$coupon->code}}" id="coupon_code" name="coupon_code" class="form-control" required>
   </div>
</div>


<div class="form-group row">
  <label class="col-lg-3 col-from-label">{{translate('Minimum Shopping')}}</label>
  <div class="col-lg-9">
     <input type="number" lang="en" min="0" step="0.01" name="min_buy" class="form-control" value="{{ $coupon_det->min_buy }}" required>
  </div>
</div>
<div class="form-group row">
   <label class="col-lg-3 col-from-label">{{translate('Discount')}}</label>
   <div class="col-lg-7">
       <input type="number" lang="en" min="0" step="0.01" placeholder="{{translate('Discount')}}" name="discount" class="form-control" value="{{ $coupon->discount }}" required>
   </div>
   <div class="col-lg-2">
       <select class="form-control aiz-selectpicker" name="discount_type">
           <option value="amount" @if ($coupon->discount_type == 'amount') selected  @endif >{{translate('Amount')}}</option>
           <option value="percent" @if ($coupon->discount_type == 'percent') selected  @endif>{{translate('Percent')}}</option>
       </select>
   </div>
</div>
<div class="form-group row">
  <label class="col-lg-3 col-from-label">{{translate('Maximum Discount Amount')}}</label>
  <div class="col-lg-9">
     <input type="number" lang="en" min="0" step="0.01" placeholder="{{translate('Maximum Discount Amount')}}" name="max_discount" class="form-control" value="{{ $coupon_det->max_discount }}" required>
  </div>
</div>
<div class="form-group row">
    <label class="col-lg-3 control-label" for="name">{{translate('Product')}}</label>
    <div class="col-lg-9">

        <select name="product_ids[]" class="form-control product_id aiz-selectpicker" data-live-search="true" data-selected-text-format="count" required multiple data-actions-box="true">
            @foreach(filter_products(\App\Product::query())->get() as $key => $product)
                <option value="{{$product->id}}"
                    @foreach (json_decode(json_decode($coupon->details)->products ) as $key => $elem)
                        @if ($elem == $product->id)
                            selected
                        @endif
                    @endforeach
                    >{{$product->getTranslation('name')}}</option>
            @endforeach
        </select>
    </div>
</div>

<div class="form-group row">
    <label class="col-lg-3 col-from-label" for="num_of_use">{{translate('Number Of Times A Single User Can Use')}}</label>
    <div class="col-lg-8">
        <input type="number"  lang="en" min="1"  value="{{ $coupon->num_of_use }}" step="1.0"  id="num_of_use" name="num_of_use" class="form-control" required>
    </div>
</div>


<script type="text/javascript">
   $(document).ready(function(){
       $('.aiz-selectpicker').selectpicker();
    //    $('.aiz-date-range').daterangepicker();
   });

</script>
