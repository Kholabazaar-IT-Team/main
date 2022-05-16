<section class="mb-n4 position-relative z-2">
    <div class="container">
        <div class="bg-white shadow-custom p-3 p-md-5">
            <div class="row justify-content-center">
               <div class="col-md-5 text-center text-md-left mb-3 mb-md-0">
                    <h6 class="text-uppercase fw-700">SUBSCRIBE</h6>
                    <span class="opacity-80">
                        Subscribe to our newsletter to get regular updates and offers directly to your email. Your information is secured ith me
                    </span>
               </div>
                <div class="col-md-6 col-xl-6">
                    <form class="form-inline" method="POST" action="{{ route('subscribers.store') }}">
                        @csrf
                        <div class="input-group flex-grow-1">
                            <input type="email" class="form-control w-lg-270px" placeholder="{{ translate('Your Email Here') }}" name="email" required>
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-primary px-4 text-uppercase fs-13">{{ translate('submit') }}</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="bg-alter-2 py-6 text-dark footer-widget">
    <div class="container">
        <div class="row">

            <div class="col-lg-4 col-xl-5 text-center text-md-left pr-0">
                <div class="mt-4">
                    <a href="{{ route('home') }}" class="d-block">
                        @if(get_setting('footer_logo') != null)
                            <img class="lazyload" src="{{ static_asset('assets/img/placeholder-rect.jpg') }}" data-src="{{ uploaded_asset(get_setting('footer_logo')) }}" alt="{{ env('APP_NAME') }}" height="44">
                        @else
                            <img class="lazyload" src="{{ static_asset('assets/img/placeholder-rect.jpg') }}" data-src="{{ static_asset('assets/img/logo.png') }}" alt="{{ env('APP_NAME') }}" height="44">
                        @endif
                    </a>
                    <div class="my-3 ">
                        <div class="opacity-60">
                            {!! get_setting('about_us_description',null,App::getLocale()) !!}
                        </div>

                    </div>
                    <br>

                    <div class="w-300px mw-100 mx-auto mx-md-0">
                        @if(get_setting('play_store_link') != null)
                            <a href="{{ get_setting('play_store_link') }}" target="_blank" class="d-inline-block mr-3 ml-0">
                                <img src="{{ static_asset('assets/img/play.png') }}" class="mx-100 h-40px">
                            </a>
                        @endif
                        @if(get_setting('app_store_link') != null)
                            <a href="{{ get_setting('app_store_link') }}" target="_blank" class="d-inline-block">
                                <img src="{{ static_asset('assets/img/app.png') }}" class="mx-100 h-40px">
                            </a>
                        @endif
                    </div>
                </div>
                <div class="">
                    <ul class="list-inline my-3 my-md-0 social colored sm">
                        @if ( get_setting('facebook_link') !=  null )
                        <li class="list-inline-item ">
                            <a href="{{ get_setting('facebook_link') }}" target="_blank" class="facebook"><i class="lab la-facebook-f"></i></a>
                        </li>
                        @endif
                        @if ( get_setting('twitter_link') !=  null )
                        <li class="list-inline-item ">
                            <a href="{{ get_setting('twitter_link') }}" target="_blank" class="twitter"><i class="lab la-twitter"></i></a>
                        </li>
                        @endif
                        @if ( get_setting('instagram_link') !=  null )
                        <li class="list-inline-item ">
                            <a href="{{ get_setting('instagram_link') }}" target="_blank" class="instagram"><i class="lab la-instagram"></i></a>
                        </li>
                        @endif
                        @if ( get_setting('youtube_link') !=  null )
                        <li class="list-inline-item ">
                            <a href="{{ get_setting('youtube_link') }}" target="_blank" class="youtube"><i class="lab la-youtube"></i></a>
                        </li>
                        @endif
                        @if ( get_setting('linkedin_link') !=  null )
                        <li class="list-inline-item ">
                            <a href="{{ get_setting('linkedin_link') }}" target="_blank" class="linkedin"><i class="lab la-linkedin-in"></i></a>
                        </li>
                        @endif
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 ml-xl-auto col-md-2 mr-0">
                <div class="text-center text-md-left mt-4">
                    <h4 class="fs-14 text-alter text-uppercase fw-600 mb-2">
                        {{ translate('Quick links') }}
                    </h4>
                    <ul class="list-unstyled">
                        @if ( get_setting('widget_one_labels',null,App::getLocale()) !=  null )
                            @foreach (json_decode( get_setting('widget_one_labels',null,App::getLocale()), true) as $key => $value)
                            <li class="mb-2">
                                <a href="{{ json_decode( get_setting('widget_one_links'), true)[$key] }}" class="opacity-70 hov-opacity-100 text-reset">
                                   - {{ $value }}
                                </a>
                            </li>
                            @endforeach
                        @endif
                    </ul>

                </div>
            </div>
             <div class="col-lg-2 ml-xl-auto col-md-2 mr-0">
                <div class="text-center text-md-left mt-4">
                    <h4 class="fs-14 text-alter text-uppercase fw-600 mb-2">
                        {{ translate('policies') }}
                    </h4>
                    <ul class="list-unstyled">
                        @if ( get_setting('widget_two_labels',null,App::getLocale()) !=  null )
                            @foreach (json_decode( get_setting('widget_two_labels',null,App::getLocale()), true) as $key => $value)
                            <li class="mb-2">
                                <a href="{{ json_decode( get_setting('widget_two_links'), true)[$key] }}" class="opacity-70 hov-opacity-100 text-reset">
                                    - {{ $value }}
                                </a>
                            </li>
                            @endforeach
                        @endif
                    </ul>

                </div>
            </div>
            <div class="col-md-3 col-lg-">
                <div class="text-center text-md-left mt-4">
                    <h4 class="fs-14 text-alter text-uppercase fw-600 mb-2">
                        {{ translate('Contact us') }}
                    </h4>
                    <ul class="list-unstyled mb-3">
                        <li class="mb-2">
                           <span class="d-block opacity-60  text-uppercas">{{ translate('Address') }}: </span>
                           <span class="d-block opacity-60 mb-2">{{ get_setting('contact_address',null,App::getLocale()) }}</span>
                        </li>
                    </ul>

                    <h6 class="fs-13 text-uppercase  opacity-60 fw-200 mb-2 mt-3">{{ translate('Contact') }}</h6>

                    <div class="mb-2">
                        <div class="rounded-pill bg-primary p-1 d-inline-block">
                            <div class="d-flex align-items-center text-white">
                                <i class="las la-phone fs-18 size-35px bg-alter rounded-circle d-flex align-items-center justify-content-center"></i>
                                <span class="mx-2 fs-15 fw-600">
                                    {{translate('Hotline')}}:
                                    {{ get_setting('contact_phone') }}
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="mb-2">
                        <div class="rounded-pill bg-primary p-1 d-inline-block">
                            <div class="d-flex align-items-center text-white">
                                <i class="las la-envelope fs-18 size-35px bg-alter rounded-circle d-flex align-items-center justify-content-center"></i>
                                <span class="mx-2 fs-15 fw-600">
                                    {{ get_setting('contact_email') }}
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                @if (get_setting('vendor_system_activation') == 1)
                    {{-- <div class="text-center text-md-left mt-4">
                        <h4 class="fs-13 text-uppercase fw-600 border-bottom border-gray-900 pb-2 mb-4">
                            {{ translate('Be a Seller') }}
                        </h4>
                        <a href="{{ route('shops.create') }}" class="btn btn-primary btn-sm shadow-md">
                            {{ translate('Apply Now') }}
                        </a>
                    </div> --}}
                @endif
            </div>
        </div>
    </div>
</section>

<!-- FOOTER -->
<footer class="pt-3 pb-7 pb-xl-4 bg-primary ">
    <div class="container">
        <div class="row d-flex align-items-center">
            <div class="col-lg-4">
                <div class="text-center text-dark text-md-left" current-verison="{{get_setting("current_version")}}">
                    {!! get_setting('frontend_copyright_text',null,App::getLocale()) !!}
                </div>
            </div>
            <div class="col-lg-4">
                {{-- <div class="text-center text-md-left" current-verison="{{get_setting("current_version")}}">
                    {!! get_setting('frontend_copyright_text',null,App::getLocale()) !!}
                </div> --}}
            </div>
            <div class="col-lg-4">
                <div class="text-center text-md-right d-flex align-items-center">
                    <ul class="list-inline mb-0">
                        @if ( get_setting('payment_method_images') !=  null )
                            @foreach (explode(',', get_setting('payment_method_images')) as $key => $value)
                                <li class="list-inline-item">
                                    <img src="{{ uploaded_asset($value) }}" height="30" class="mw-100 h-auto">
                                </li>
                            @endforeach
                        @endif
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>


<div class="aiz-mobile-bottom-nav d-xl-none fixed-bottom bg-white shadow-lg border-top rounded-top" style="box-shadow: 0px -1px 10px rgb(0 0 0 / 15%)!important; ">
    <div class="row align-items-center gutters-5">
        <div class="col">
            <a href="{{ route('home') }}" class="text-reset d-block text-center pb-2 pt-3">
                <i class="las la-home fs-20 opacity-60 {{ areActiveRoutes(['home'],'opacity-100 text-primary')}}"></i>
                <span class="d-block fs-10 fw-600 opacity-60 {{ areActiveRoutes(['home'],'opacity-100 fw-600')}}">{{ translate('Home') }}</span>
            </a>
        </div>
        <div class="col">
            <a href="javascript:void(0)" class="text-reset d-block text-center pb-2 pt-3"  data-toggle="class-toggle" data-target=".mobile-category-sidebar">
                <i class="las la-list-ul fs-20 opacity-60 {{ areActiveRoutes(['categories.all'],'opacity-100 text-primary')}}"></i>
                <span class="d-block fs-10 fw-600 opacity-60 {{ areActiveRoutes(['categories.all'],'opacity-100 fw-600')}}">{{ translate('Categories') }}</span>
            </a>
        </div>
        @php
            if(auth()->user() != null) {
                $user_id = Auth::user()->id;
                $cart = \App\Cart::where('user_id', $user_id)->get();
            } else {
                $temp_user_id = Session()->get('temp_user_id');
                if($temp_user_id) {
                    $cart = \App\Cart::where('temp_user_id', $temp_user_id)->get();
                }
            }
        @endphp
        <div class="col-auto">
            {{-- <a href="javascript:void(0)" class="text-reset d-block text-center pb-2 pt-3  cart-toggler cart-trigger"  type="button" data-toggle="class-toggle" data-target=".cart-sidebar"  data-toggle="dropdown" data-display="static"> --}}
                <a href="{{ route('home.shop') }}" class="text-reset d-block text-center pb-2 pt-3">
                <span class="align-items-center bg-primary border border-white border-width-4 d-flex justify-content-center position-relative rounded-circle size-50px" style="margin-top: -33px;box-shadow: 0px -5px 10px rgb(0 0 0 / 15%);border-color: #fff !important;">
                    <i class="las la-shopping-bag la-2x text-white"></i>
                </span>
                {{-- <span class="d-block mt-1 fs-10 fw-600 opacity-60 {{ areActiveRoutes(['cart'],'opacity-100 fw-600')}}">
                    {{ translate('Cart') }}
                    @php
                        $count = (isset($cart) && count($cart)) ? count($cart) : 0;
                    @endphp
                    (<span class="cart-count">{{$count}}</span>)
                </span> --}}
                <span class="d-block mt-1 fs-10 fw-600 opacity-60 {{ areActiveRoutes(['home.shop'],'opacity-100 fw-600')}}">
                    {{ translate('Shop') }}
                </span>
            </a>
        </div>
        <div class="col">
            <a href="{{ route('all-notifications') }}" class="text-reset d-block text-center pb-2 pt-3">
                <span class="d-inline-block position-relative px-2">
                    <i class="las la-bell fs-20 opacity-60 {{ areActiveRoutes(['all-notifications'],'opacity-100 text-primary')}}"></i>
                    @if(Auth::check() && count(Auth::user()->unreadNotifications) > 0)
                        <span class="badge badge-sm badge-dot badge-circle badge-primary position-absolute absolute-top-right" style="right: 7px;top: -2px;"></span>
                    @endif
                </span>
                <span class="d-block fs-10 fw-600 opacity-60 {{ areActiveRoutes(['all-notifications'],'opacity-100 fw-600')}}">{{ translate('Notifications') }}</span>
            </a>
        </div>
        <div class="col">
        @if (Auth::check())
            @if(isAdmin())
                <a href="{{ route('admin.dashboard') }}" class="text-reset d-block text-center pb-2 pt-3">
                    <span class="d-block mx-auto">
                        @if(Auth::user()->photo != null)
                            <img src="{{ custom_asset(Auth::user()->avatar_original)}}" class="rounded-circle size-20px">
                        @else
                            <img src="{{ static_asset('assets/img/avatar-place.png') }}" class="rounded-circle size-20px">
                        @endif
                    </span>
                    <span class="d-block fs-10 fw-600 opacity-60">{{ translate('Account') }}</span>
                </a>
            @else
                <a href="javascript:void(0)" class="text-reset d-block text-center pb-2 pt-3 mobile-side-nav-thumb" data-toggle="class-toggle" data-backdrop="static" data-target=".aiz-mobile-side-nav">
                    <span class="d-block mx-auto">
                        @if(Auth::user()->photo != null)
                            <img src="{{ custom_asset(Auth::user()->avatar_original)}}" class="rounded-circle size-20px">
                        @else
                            <img src="{{ static_asset('assets/img/avatar-place.png') }}" class="rounded-circle size-20px">
                        @endif
                    </span>
                    <span class="d-block fs-10 fw-600 opacity-60">{{ translate('Account') }}</span>
                </a>
            @endif
        @else
            <a href="{{ route('user.login') }}" class="text-reset d-block text-center pb-2 pt-3">
                <span class="d-block mx-auto">
                    <img src="{{ static_asset('assets/img/avatar-place.png') }}" class="rounded-circle size-20px">
                </span>
                <span class="d-block fs-10 fw-600 opacity-60">{{ translate('Account') }}</span>
            </a>
        @endif
        </div>
    </div>
</div>
@if (Auth::check() && !isAdmin())
    <div class="aiz-mobile-side-nav collapse-sidebar-wrap sidebar-xl d-xl-none z-1035">
        <div class="overlay dark c-pointer overlay-fixed" data-toggle="class-toggle" data-backdrop="static" data-target=".aiz-mobile-side-nav" data-same=".mobile-side-nav-thumb"></div>
        <div class="collapse-sidebar bg-white">
            @include('frontend.inc.user_side_nav')
        </div>
    </div>
@endif


<div class="mobile-category-sidebar collapse-sidebar-wrap sidebar-all z-1035">
    <div class="overlay dark c-pointer overlay-fixed" data-toggle="class-toggle" data-target=".mobile-category-sidebar" data-same=".mobile-category-trigger"></div>
    <div class="collapse-sidebar bg-white overflow-hidden">
        <div class="position-relative z-1 shadow-sm">
            <div class="sticky-top z-1 p-3 border-bottom">
                <a class="d-block mr-3 ml-0" href="{{ route('home') }}">
                    @php
                        $header_logo = get_setting('header_logo');
                    @endphp
                    @if($header_logo != null)
                        <img src="{{ uploaded_asset($header_logo) }}" alt="{{ env('APP_NAME') }}" class="mw-100 h-30px" height="30">
                    @else
                        <img src="{{ static_asset('assets/img/logo.png') }}" alt="{{ env('APP_NAME') }}" class="mw-100 h-30px" height="30">
                    @endif
                </a>
                <div class="absolute-top-right mt-2">
                    <button class="btn btn-sm p-2 " data-toggle="class-toggle" data-target=".mobile-category-sidebar" data-same=".mobile-category-trigger">
                        <i class="las la-times la-2x"></i>
                    </button>
                </div>
            </div>
            <div class="side-menu">
    <div class="side-menu-main c-scrollbar-light">
        <div class="p-3 fs-16 fw-700 d-flex justify-content-between align-items-center border-bottom">
            <span>Categories</span>
            <a href="{{ route('categories.all') }}" class="text-reset fs-11">See All</a>
        </div>
        <div class="p-3">
            @foreach (\App\Category::where('level', 0)->orderBy('name', 'asc')->get() as $key => $category)
            @php
                $childs = \App\Utility\CategoryUtility::get_immediate_children_ids($category)
            @endphp
            @if(count($childs) > 0)
               <div class="d-flex align-items-center" data-id="{{ $category->id }}"> 
                    <a class="text-reset py-2 fw-600 fs-13 d-block opacity-70 d-flex mb-2 justify-content-between" href="{{ route('products.category', $category->slug) }}">
                        {{  $category->name }}
                    </a>
                    <i class="las la-angle-right ml-auto"  ></i>
               </div>

            @else
                <a class="text-reset py-2 fw-600 fs-13 d-block opacity-70 d-flex mb-2 justify-content-between" href="{{ route('products.category', $category->slug) }}">
                    {{  $category->name }}
                    <i class="las la-angle-right"></i>
                </a>
            @endif
        @endforeach
        </div>
    </div>
    <div class="sub-menu-wrap">
        @foreach (\App\Category::where('level', 0)->orderBy('name', 'asc')->get() as $key => $category)
            <div class="sub-menu c-scrollbar-light" id="cat-menu-{{ $category->id }}">
                <a href="javascript:void(0)" class="back-to-menu border-bottom d-block fs-16 fw-600 p-3 text-reset">
                    <i class="las la-angle-left"></i>
                    <span>Back to menu</span>
                </a>
                @foreach (\App\Utility\CategoryUtility::get_immediate_children_ids($category->id) as $key => $first_level_id)
                    <div class="mb-2">
                        @php
                            $cat_1=\App\Category::find($first_level_id);

                        @endphp
                        <a href="{{ route('products.category', $cat_1->slug) }}" class="text-reset d-block px-4 pt-3 pb-1 fw-800">{{ $cat_1->name }}</a>
                        @php
                            $childs = \App\Utility\CategoryUtility::get_immediate_children_ids($first_level_id)
                        @endphp
                        @if(count($childs) > 0)
                            <ul class="list-unstyled ">
                                @foreach ($childs as $key => $second_level_id)
                                @php
                                    $cat_2=\App\Category::find($second_level_id);
                                @endphp
                                <li class="mb-2">
                                    <a class="text-reset d-block px-4 py-1 mt-2 fw-600 opacity-70" href="{{ route('products.category', $cat_2->slug) }}" >{{ $cat_2->name}}</a>
                                </li>
                                @endforeach
                            </ul>
                        @endif
                    </div>
                @endforeach
            </div>
        @endforeach
    </div>
</div>
        </div>
    </div>
</div>
<div class="sidebar-cart">
    @php
        $total = 0;
        if(auth()->user() != null) {
            $user_id = Auth::user()->id;
            $cart = \App\Cart::where('user_id', $user_id)->get();
        } else {
            $temp_user_id = Session()->get('temp_user_id');
            if($temp_user_id) {
                $cart = \App\Cart::where('temp_user_id', $temp_user_id)->get();
            }
        }
        if(isset($cart) && count($cart) > 0){
            foreach($cart as $key => $cartItem){
                $product = \App\Product::find($cartItem['product_id']);
                $total = $total + $cartItem['price'] * $cartItem['quantity'];
            }
        }
    @endphp

    <div class="collapse-sidebar-wrap sidebar-all sidebar-right z-1035 cart-sidebar">
        <div class="overlay overlay-fixed dark c-pointer" data-toggle="class-toggle" data-target=".cart-sidebar" data-same=".cart-trigger"></div>
        <div class="bg-white d-flex flex-column shadow-lg cart-sidebar collapse-sidebar c-scrollbar-light" id="sidebar-cart">
            @include('frontend.partials.sidebar_cart')
        </div>
    </div>
</div>
<div class="">
    <div class="collapse-sidebar-wrap sidebar-all sidebar-top z-1035 topbar-search">
        <div class="overlay-fixed dark c-pointer" data-toggle="class-toggle" data-target=".topbar-search" data-backdrop="static"></div>
        <div class="bg-white d-flex flex-column shadow-lg   c-scrollbar-light py-4">
            <div class="container">
                <div class="position-relative">
                    <form action="{{ route('search') }}" method="GET" class="stop-propagation">
                        <div class="d-flex position-relative align-items-center">
                            <div class="input-group">
                                <input type="text" class="border-0 form-control form-control-lg" id="search_two" name="q" placeholder="{{translate('I am shopping for...')}}" autocomplete="off">
                                <div class="input-group-append">
                                    <button class="btn btn-icon" type="button" data-toggle="class-toggle" data-target=".topbar-search" data-backdrop="static">
                                        <i class="la la-times fs-20"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="container container position-relative z-1020" style="top: 5px;">
            <div class="position-relative">
                <div class="typed-search-box-two stop-propagation document-click-d-none d-none bg-white rounded shadow-lg position-absolute left-0 top-100 w-100" style="min-height: 200px">
                    <div class="search-preloader absolute-top-center">
                        <div class="dot-loader"><div></div><div></div><div></div></div>
                    </div>
                    <div class="search-nothing d-none p-3 text-center fs-16">

                    </div>
                    <div id="search-content-two" class="text-left">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
