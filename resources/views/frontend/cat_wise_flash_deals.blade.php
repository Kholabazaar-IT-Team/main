@extends('frontend.layouts.app')

@section('content')

    @if($flash_deal->status == 1 && strtotime(date('Y-m-d H:i:s')) <= $flash_deal->end_date)
    <div style="background-color:{{ $flash_deal->background_color }}">
        <section class="text-center mb-5">
            <img
                src="{{ static_asset('assets/img/placeholder-rect.jpg') }}"
                data-src="{{ uploaded_asset($flash_deal->banner) }}"
                alt="{{ $flash_deal->title }}"
                class="img-fit w-100 lazyload"
            >
        </section>
        <section class="mb-4">
            <div class="container">
                <div class="text-center my-4 text-{{ $flash_deal->text_color }}">
                    <h1 class="h2 fw-600">{{ $flash_deal->title }}</h1>
                    <div class="aiz-count-down aiz-count-down-lg ml-3 align-items-center justify-content-center" data-date="{{ date('Y/m/d H:i:s', $flash_deal->end_date) }}"></div>
                </div>
                @foreach ($product_categories as $key=>$product_category)
                <div class="col-md-12 col-sm-12 card px-5 py-4 ">
                <div class="d-flex flex-wrap mb-3 align-items-baseline border-bottom bg-alter p-1">
                @php
                    $category= \App\Category::findOrFail($product_category->product_category);
                @endphp
                        <h6 class="h6 fw-600 mb-0 px-4 fs-14 py-1" >
                            <span class="ml-2 d-inline-block text-white text-uppercase  ">{{$category->name}}</span>
                        </h6>
                 
                        <a href="{{ route('flash-deal-details',[$flash_deal->slug,$category->id]) }}" class="ml-auto mr-0 mt-2 mt-md-0 btn btn-primary btn-sm shadow-md w-100 w-md-auto text-uppercase">{{ translate('View All') }}</a>
                    </div>
                <div class="aiz-carousel gutters-5 half-outside-arrow dot-small-black" data-items="6" data-xl-items="6" data-lg-items="6"  data-md-items="5" data-sm-items="2" data-xs-items="2" data-infinite='true' data-autoplay="false" data-dots="true">
                @php
                $flash_deal_products=\App\FlashDealProduct::where('flash_deal_id',$flash_deal->id)
                ->where('product_category',$category->id)
                ->take(8)->get();
                @endphp
                @foreach ($flash_deal_products as $flash_deal_product)
                            @php
                                $product=App\Product::where('id',$flash_deal_product->product_id)->with('stocks')->first();
                            @endphp
                        @if ($product != null && $product->published != 0)
                            <div class="carousel-box">
                                @include('frontend.partials.product_box_1',['product'=>$product])
                            </div>
                        @endif
                    @endforeach
                </div>
               </div>
               @endforeach
        </section>
    </div>
    @else
        <div style="background-color:{{ $flash_deal->background_color }}">
            <section class="text-center">
                <img src="{{ uploaded_asset($flash_deal->banner) }}" alt="{{ $flash_deal->title }}" class="img-fit w-100">
            </section>
            <section class="pb-4">
                <div class="container">
                    <div class="text-center text-{{ $flash_deal->text_color }}">
                        <h1 class="h3 my-4">{{ $flash_deal->title }}</h1>
                        <p class="h4">{{  translate('This offer has been expired.') }}</p>
                    </div>
                </div>
            </section>
        </div>
    @endif
@endsection
@section('script')
    <script>
        $(document).ready(function(){
                AIZ.plugins.slickCarousel();
        });
    </script>
@endsection