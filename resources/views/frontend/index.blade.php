@extends('frontend.layouts.app')

@section('content')
    {{-- Categories , Sliders . Today's deal --}}
    <div class="home-banner-area text-white">
        <div class="container my-md-3 " >
            <div class="row position-relative">
                <div class="col-md-3 position-static d-none d-lg-block px-0">
                    @include('frontend.partials.category_menu')
                </div>
               <div class="col-md-9 main-bnr">
                <div class="aiz-carousel mobile-img-auto-height dot-small-black dots-inside-bottom " data-dots="true" data-autoplay="true" data-arrows="false">
                    @php $slider_images = json_decode(get_setting('home_slider_images'), true);  @endphp
                    @foreach ($slider_images as $key => $value)
                        <div class="carousel-box">
                            <a href="{{ json_decode(get_setting('home_slider_links'), true)[$key] }}" class="text-reset d-block">
                                <img src="{{ uploaded_asset($value) }}" class=" img-fit"  >
                            </a>
                        </div>
                    @endforeach
                </div>
               </div>
            </div>

        </div>
    </div>
   {{-- banner under section  --}}
   <div class="container my-4">
       <div class="row">
            <div class="col-md-8 col-sm-12 card px-5 py-4 ">
                <div class="row">
                <div class="col d-flex justify-content-between">
                    <h6 class="text-uppercase text-left text-alter fw-700">Featured </h6>
                    <a href="{{ route('categories.all') }}"><span class="text-uppercase ml-auto fw-600 fs-12 text-uppercase">view all</span></a>
                </div>
               </div>
                {{-- featured categories --}}
                @php
                $featured_categories = \App\Category::where('featured', 1)->take(12)->get();
                @endphp

                @if (count($featured_categories) > 0)

                        <div class="row  row-cols-lg-6 row-cols-md-6 row-cols-2 ">
                            @foreach ($featured_categories as $key => $category)
                                <div class="col " style="padding: 5px;" >
                                    <div class="border hov-shadow-md">
                                        <a href="{{ route('products.category', $category->slug) }}" class="d-block text-reset  py-3 px-1 bg-white rounded text-center">
                                            <div class="d-flex align-items-center justify-content-center h-60px">
                                                <img
                                                src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                                data-src="{{ uploaded_asset($category->icon) }}"
                                                alt="{{ $category->name }}"
                                                class="lazyload mw-100 mx-auto mb-3"
                                                style="max-height: 60px;"
                                                onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder-rect.jpg') }}';"
                                            >
                                            </div>
                                            <span class="text-truncate fs-12 fw-500 d-block">{{ $category->name }}</span>
                                        </a>
                                    </div>
                                </div>
                            @endforeach
                        </div>

                @endif

            </div>
            <div class="col-md-4 col-sm-12 ">
                <div class="d-flex flex-column justify-content-between align-items-center">
                    @php $banner_1_imags = json_decode(get_setting('home_banner1_images')); @endphp
                    @foreach ($banner_1_imags as $key => $value)
                        <div class="col px-0">
                            <div class="@if($key==0) mb-3 @endif shadow-md">
                                <a href="{{ json_decode(get_setting('home_banner1_links'), true)[$key] }}" class="d-block text-reset">
                                    <img src="{{ static_asset('assets/img/placeholder-rect.jpg') }}" data-src="{{ uploaded_asset($banner_1_imags[$key]) }}" alt="{{ env('APP_NAME') }} promo" class="img-fluid lazyload w-100" class="img-fit">
                                </a>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
       </div>
    </div>
    {{-- end banner under section  --}}
    {{-- Banner Section  --}}
    @if (get_setting('home_banner2_images') != null)
    <div class="mb-4">
        <div class="container" >
            <div class="row">
                @php $banner_2_imags = json_decode(get_setting('home_banner2_images')); @endphp
                @foreach ($banner_2_imags as $key => $value)
                    <div class="col-xl col-md-6 ">
                        <div class="py-1">
                            <a href="{{ json_decode(get_setting('home_banner2_links'), true)[$key] }}" class="d-block text-reset">
                                <img src="{{ static_asset('assets/img/placeholder-rect.jpg') }}" data-src="{{ uploaded_asset($banner_2_imags[$key]) }}" alt="{{ env('APP_NAME') }} promo" class="img-fluid lazyload w-100">
                            </a>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
    @endif

 
     {{-- flash deals  --}}
    {{-- Flash Deal --}}
    @php
        $flash_deal = \App\FlashDeal::where('status', 1)->where('featured', 1)->first();
    @endphp
    @if($flash_deal != null && strtotime(date('Y-m-d H:i:s')) >= $flash_deal->start_date && strtotime(date('Y-m-d H:i:s')) <= $flash_deal->end_date)

    @if(\App\Product::where('published', 1)->where('todays_deal','1')->count()>0)
        <section class="mb-5">
            <div class="container">
                <div class=" d-flex flex-wrap mb-3 align-items-baseline border-bottom bg-alter p-1">

                       <h6 class="fw-600 h6  fs-14 py-1 text-center text-white text-uppercase d-lg-none" style="margin-left: 35%;" >Flash sale</h6>

                    <div class="h6 fw-600 h6 mb-0 px-4 fs-14 py-1 text-center d-none d-lg-block" >
                        <span class="d-inline-block text-white text-uppercase  ">Flash sale</span>
                    </div>
                    <div></div>
                    <div class="d-flex align-items-center  ">
                        <span class="text-white pl-3 pr-1 ml-3"> Offer Valid till:</span>
                        <div class="aiz-count-down  align-items-center" data-date="{{ date('Y/m/d H:i:s', $flash_deal->end_date) }}">
                        </div>
                    </div>
                    <a href="{{ route('flash-deal-details', $flash_deal->slug) }}" class="ml-auto mr-0 mt-2 mt-md-0 btn btn-primary btn-sm shadow-md w-100 w-md-auto text-uppercase">View All</a>
                </div>

                <div class="aiz-carousel gutters-5 half-outside-arrow dot-small-black" data-items="6" data-xl-items="6" data-lg-items="6"  data-md-items="5" data-sm-items="2" data-xs-items="2" data-infinite='true' data-autoplay="false" data-dots="true">
                    @foreach ($flash_deal->flash_deal_products as $key => $flash_deal_product)
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
    </section>

    @endif
    @endif
   

        @if(\App\Product::where('published', 1)->where('todays_deal','1')->count()>0)
            <section class="mb-5">
                <div class="container">
                    <div class="d-flex flex-wrap mb-3 align-items-baseline border-bottom bg-alter p-1">
                        <h6 class="h6 fw-600 mb-0 px-4 fs-14 py-1" >
                            <span class="ml-2 d-inline-block text-white text-uppercase  ">Today's Deals</span>
                        </h6>
                 
                        <a href="{{ route('today.deals') }}" class="ml-auto mr-0 mt-2 mt-md-0 btn btn-primary btn-sm shadow-md w-100 w-md-auto text-uppercase">{{ translate('View All') }}</a>
                    </div>
    
                    <div class="aiz-carousel gutters-5 half-outside-arrow dot-small-black" data-items="6" data-xl-items="6" data-lg-items="6"  data-md-items="5" data-sm-items="2" data-xs-items="2" data-infinite='true' data-autoplay="false" data-dots="true">
                        @foreach (filter_products(\App\Product::where('published', 1)->where('todays_deal','1')->orderBy('num_of_sale', 'desc'))->limit(12)->with('stocks')->get() as $key => $product)
    
                            @if ($product != null && $product->published != 0)
                                <div class="carousel-box">
                                    @include('frontend.partials.product_box_1',['product'=>$product])
                                </div>
                            @endif
                        @endforeach
                    </div>
                </div>
            </section>
    
        @endif
  

    {{-- featuired shops --}}
    {{-- {{ dd(get_setting('featured_shops') ) }} --}}
    @if (get_setting('vendor_system_activation') == 1 && get_setting('featured_shops') != null)
        <section class="pb-5 pt-4" style="background: rgb(127,174,105);
        background: linear-gradient(90deg, rgba(127,174,105,1) 0%, rgba(127,174,105,1) 44%, rgba(27,134,105,1) 100%);">
            <div class="container">
                <div class="d-flex mb-3 align-items-baseline">
                    <h3 class="h6 fw-600 mb-0 fs-16">
                        <span class="tt-sec-title text-white text-uppercase">Featured Shops</span>
                    </h3>
                    <a href="{{ route('sellers') }}" class="ml-auto mr-0 btn btn-primary rounded-0 btn-sm text-uppercase fw-600">View All</a>
                </div>
                <div class="aiz-carousel gutters-5 dots-inside-bottom " data-items="4" data-lg-items="4"  data-md-items="4" data-sm-items="2" data-xs-items="1" data-rows="2" data-autoplay="true" data-dots="true">
                    @foreach (json_decode(get_setting('featured_shops')) as $key => $value)
                    @php
                        $shop = \App\Shop::find($value);
                        $total = 0;
                        $rating = 0;
                        if(count($shop->user->products)>0){
                            if(property_exists($shop->user->products,'reviews')){
                                $rating += $shop->user->products->sum('rating');
                                $total += $shop->user->products->count();
                            }
                        }
                    @endphp
                    @if ($shop != null)
                        <div class="carousel-box">
                            <div class="row no-gutters box-3 align-items-center bg-white my-1 has-transition p-2">
                                <div class="col-auto">
                                    <a href="{{ route('shop.visit', $shop->slug) }}" class="d-block p-1 size-110px bg-white">
                                        <img
                                            src="{{ static_asset('assets/img/placeholder.jpg') }}"
                                            data-src="@if ($shop->logo !== null) {{ uploaded_asset($shop->logo) }} @else {{ static_asset('assets/img/placeholder.jpg') }} @endif"
                                            alt="{{ $shop->name }}"
                                            class="img-fluid lazyload"
                                            onerror="this.onerror=null;this.src='{{ static_asset('assets/img/placeholder.jpg') }}';"
                                        >
                                    </a>
                                </div>
                                <div class="col">
                                    <div class="px-3 text-left">
                                        <h2 class="h6 fw-600 text-truncate">
                                            <a href="{{ route('shop.visit', $shop->slug) }}" class="text-reset">{{ $shop->name }}</a>
                                        </h2>
                                        <div class="rating rating-sm mb-2">
                                            @if ($total > 0)
                                                {{ renderStarRating($rating/$total) }}
                                            @else
                                                {{ renderStarRating(0) }}
                                            @endif
                                        </div>
                                        <a href="{{ route('shop.visit', $shop->slug) }}" class="btn bg-dark text-white btn-sm rounded-0 text-uppercase fs-12">
                                            Visit shop
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endif
                    @endforeach
                </div>
            </div>
        </section>
    @endif

    <div id="section_featured">

    </div>



    {{-- brand slider  --}}
    <section class="py-5 bg-white">

            @php $top10_brands = get_setting('top10_brands'); @endphp
            @if ($top10_brands != null)
            <div class="mb-5">
                <div class="container">
                      <div class="row my-3  d-lg-block d-none"> <div class="d-flex justify-content-end"><a href="{{ route('brands.all') }}" class="ml-auto mr-md-3 mt-md-0 btn btn-primary btn-sm shadow-md  text-uppercase">View All</a></div></div>
                    <div class="row my-3  d-lg-none"> <div class="col d-flex justify-content-end"><a href="{{ route('brands.all') }}" class="ml-md-auto mr-md-3 mt-md-0 btn btn-primary btn-sm shadow-md  text-uppercase">View All</a></div></div>


                    <div class="bg-white shadow-custom p-lg-5 px-3 py-4">
                        <div class="aiz-carousel gutters-10 outside-arrow" data-items="8" data-xl-items="7" data-lg-items="5"  data-md-items="4" data-sm-items="3" data-xs-items="2" data-dots='false' data-arrows="true" data-infinite='true'>
                            @foreach ( \App\Brand::whereIn('id',json_decode($top10_brands))->get() as $key => $brand)

                                @if ($brand != null)
                                <div class="carousel-box border-right border-gray-300">
                                    <a href="{{ route('products.brand', $brand->slug) }}" class="d-block text-reset px-3 py-2">
                                        <img src="{{ uploaded_asset($brand->logo) }}" class="mw-100 h-50px mx-auto">
                                    </a>
                                </div>
                                @endif
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
            @endif


    </section>


    {{-- home category section  --}}
    <div id="section_home_categories">

    </div>
      {{-- static bottom icon banner --}}
    <section class="bg-white mb-4">

        @if(get_setting('authentic_images') != null)
        <div class="my-4">
            <div class="container">
                <div class="border p-4  border-width-1">
                    <div class="row no-gutters row-cols-lg-4 row-cols-2">
                        @foreach (json_decode(get_setting('authentic_images'), true) as $key => $value)
                        <div class="col text-center py-3">
                            <img src="{{ uploaded_asset($value) }}" class="mb-3 mx-auto h-40px" >
                            <span class="text-uppercase text-center fs-12  d-block fw-600">{{ json_decode(get_setting('authetic_names'), true)[$key] }}</span>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
        @endif
    </section>

@endsection

@section('script')
    <script>
        $(document).ready(function(){
            $.post('{{ route('home.section.featured') }}', {_token:'{{ csrf_token() }}'}, function(data){
                $('#section_featured').html(data);
                AIZ.plugins.slickCarousel();
            });

            $.post('{{ route('home.section.home_categories') }}', {_token:'{{ csrf_token() }}'}, function(data){
                $('#section_home_categories').html(data);
                AIZ.plugins.slickCarousel();
            });

            @if (get_setting('vendor_system_activation') == 1)
            $.post('{{ route('home.section.best_sellers') }}', {_token:'{{ csrf_token() }}'}, function(data){
                $('#section_best_sellers').html(data);
                AIZ.plugins.slickCarousel();
            });
            @endif
        });
    </script>
@endsection
