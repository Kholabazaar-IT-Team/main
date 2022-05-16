<div class="aiz-card-box has-transition hov-shadow-md mb-2 mt-1 rounded">
        @php
        $discount_applicable = false;
        $lowest_price = $product->stocks->min('price');
        if($lowest_price == 0){
        $lowest_price=1;
        }
      
        $discount_percent = 0;

        if ($product->discount_start_date == null) {
            $discount_applicable = true;
        }
        elseif (strtotime(date('d-m-Y H:i:s')) >= $product->discount_start_date &&
            strtotime(date('d-m-Y H:i:s')) <= $product->discount_end_date) {
            $discount_applicable = true;
        }
        
        if ($discount_applicable) {
            if($product->discount_type == 'percent'){
                $discount_percent = round($product->discount);
            }
            elseif($product->discount_type == 'amount'){
              
                 $discount_percent = round($product->discount*100/$lowest_price);
            }
        }
        $stock = App\ProductStock::where('product_id',$product->id)->first();
                        
    @endphp
    
    <div class="position-relative p-1">
         @if($discount_percent > 0)
        <span class="badge badge-inline badge-danger absolute-top-right z-1 fs-12 text-uppercase px-2 py-1 d-inline-block h-auto" style="background:#f00">{{ $discount_percent }}% OFF</span>
        @endif
        <a href="{{ route('product', $product->slug) }}" class="d-block">
            <img
                class="img-fit lazyload mx-auto"
                src="{{ static_asset('assets/img/placeholder.jpg') }}"
                data-src="{{ uploaded_asset($product->thumbnail_img) }}"
                alt="{{  $product->getTranslation('name')  }}"
                class=""
                onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
            >
        </a>
    </div>
    <div class="px-md-3 px-2 pt-3 text-center pb-0">
        <div class="fw-600 fs-12 lh-1-4 mb-1">
            <a href="{{ route('product', $product->slug) }}" class="d-block text-reset text-truncate-2" style="height:35px;">{{  $product->getTranslation('name')  }}</a>
        </div>
        <div class="fs-13 fw-700 pb-1" style="height:40px;">
           
            @if(home_base_price($product) != home_discounted_base_price($product))
                <del class=" opacity-60 mr-1">{{ home_base_price($product) }}</del>
            @endif
            <span class="fs-14 fw-700 pb-1">{{ home_discounted_base_price($product) }}</span>
        </div>
    </div>
    <div class="d-flex justify-content-center align-items-center border-top border-gray-100">
    @if($stock->qty < 1)

<button type="button" class="btn text-danger fw-600 fs-13" disable>{{ translate('STOCK OUT') }}</button>
@else
    @if($product->variant_product == 1)

        <button type="button" class="btn text-alter fw-600 fs-13" onclick="showAddToCartModal({{ $product->id }})">{{ translate('Add To Cart') }}</button>

    @else

        <button type="button" class="btn text-alter fw-600 fs-13" onclick="addToCart(this)" data-id="{{ $product->id }}">{{ translate('Add To Cart') }}</button>

    @endif
@endif
    </div>
</div>
