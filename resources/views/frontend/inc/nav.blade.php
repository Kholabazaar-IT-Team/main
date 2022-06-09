@if(get_setting('topbar_banner') != null)
{{-- <div class="position-relative top-banner removable-session z-1035 d-none" data-key="top-banner" data-value="removed">
    <a href="{{ get_setting('topbar_banner_link') }}" class="d-block text-reset">
        <img src="{{ uploaded_asset(get_setting('topbar_banner')) }}" class="w-100 mw-100 h-50px h-lg-auto img-fit">
    </a>
    <button class="btn text-white absolute-top-right set-session" data-key="top-banner" data-value="removed" data-toggle="remove-parent" data-parent=".top-banner">
        <i class="la la-close la-2x"></i>
    </button>
</div> --}}
@endif
{{-- top bar menue  --}}
<div class="container z-1022 bg-white border-bottom shadow-sm d-none d-lg-block">
    <div class="row d-flex align-items-center">
        {{-- logo --}}
        <div class="col-md-2  pl-0 pr-2 d-flex align-items-center pr-xl-3 t-logo">
            <a class="d-block py-10px mr-3 ml-0" href="{{ route('home') }}">
                @php
                    $header_logo = get_setting('header_logo');
                @endphp
                @if($header_logo != null)
                    <img src="{{ uploaded_asset($header_logo) }}" alt="{{ env('APP_NAME') }}" class="mw-100 t-img" style="height: 3.5rem;">
                @else
                    <img src="{{ static_asset('assets/img/logo.png') }}" alt="{{ env('APP_NAME') }}" class="mw-100 h-15px" height="15">
                @endif
            </a>
        </div>

        {{-- offer button  --}}

             <div class="col-md-2 d-none d-lg-block d-flex align-items-center justify-content-center  p-0 m-0" >
                  @if(get_setting('topbar_banner')!=null)
              <a href="{{ get_setting('topbar_banner_link')}}" >
                   <div style="margin-top: -1rem;">
                   <div>
                    <img src="{{ uploaded_asset(get_setting('topbar_banner')) }}" class="d-inline-block"  style="position: relative;" alt="" >
                   </div>

                        <div class="border border-width-2 border-primary d-flex justify-content-center align-items-center roboto" style="border-radius: 1rem;width:120px;display:inline-block;margin-left:3.6rem;margin-top:-2.5rem;"><span class="text-uppercase py-2 fs-10 fw-700 text-dark ">view offers</span></div>

                   </div>
               </a>
                @endif
        </div>

        {{-- offer button end  --}}
        {{-- search --}}
       <div class="col-md-5 d-none d-lg-block">
            <div class="flex-grow-1 front-header-search d-flex align-items-center bg-white " style="max-width: 500px;">
                <div class="position-relative flex-grow-1">
                    <form action="{{ route('search') }}" method="GET" class="stop-propagation">
                        <div class="d-flex position-relative align-items-center">
                            <div class="d-lg-none" data-toggle="class-toggle" data-target=".front-header-search">
                                <button class="btn px-3" type="button"><i class="la la-2x la-long-arrow-left"></i></button>
                            </div>
                            <div class="d-flex flex-grow-1 border overflow-hidden src-br align-items-center" style="border-radius: 5px;height:2.4rem;">
                                <input type="text" class="border-0 border-gray-800 form-control src-input px-1" id="search" name="q" placeholder="{{translate('        Search Your Products')}}" autocomplete="off">
                                <div class="d-none d-lg-block">
                                    <button class="btn btn-icon btn-primary text-white" type="submit">
                                        <i class="la la-search la-flip-horizontal fs-21 fw-900 "></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="typed-search-box stop-propagation document-click-d-none d-none bg-white rounded shadow-lg position-absolute left-0 top-100 w-100" style="min-height: 100px">
                        <div class="search-preloader absolute-top-center">
                            <div class="dot-loader"><div></div><div></div><div></div></div>
                        </div>
                        <div class="search-nothing d-none p-3 text-center text-dark fs-16">

                        </div>
                        <div id="search-content" class="text-left text-dark bg-white search-box-scroll" style="z-index:1500!important;">

                        </div>
                    </div>
                </div>
            </div>
       </div>

        {{-- <div class="d-none d-lg-none ml-3 mr-0">
            <div class="nav-search-box">
                <a href="#" class="nav-box-link">
                    <i class="la la-search la-flip-horizontal d-inline-block nav-box-icon"></i>
                </a>
            </div>
        </div> --}}


        {{-- call us text  --}}
        @if(get_setting('topbar_call_icon') || get_setting('topbar_call_text') || get_setting('topbar_call_number'))
           <div class="col-md-3 col icon-pd d-none d-lg-block">
                <div class="d-flex justify-content-end">
                    <div class="d-flex pl-0 align-items-center">

                    <img src="{{ uploaded_asset(get_setting('topbar_call_icon')) }}" class="pb-1" >

                    <div class="ml-2 lh-1">
                        <div class="text-alter fs-14 fw-600 pb-1 text-uppercase roboto">{{ get_setting('topbar_call_text') }}</div>
                        <div class="text-dark  opacity-70  fw-600 fs-14 roboto">{{ get_setting('topbar_call_number') }}</div>
                    </div>
                </div>
                </div>
           </div>
        @endif
    </div>
</div>
{{-- topbar end  --}}



{{-- topbar mobnile  --}}
<div class="container z-1 bg-white border-bottom shadow-sm d-lg-none pt-1">
    <div class="row d-flex align-items-center justify-content-between">
        {{-- logo --}}
        <div class="col  d-flex align-items-center t-logo">
            <a class="d-block py-10px mr-0 ml-0" href="{{ route('home') }}">
                @php
                    $header_logo = get_setting('header_logo');
                @endphp
                @if($header_logo != null)
                    <img src="{{ uploaded_asset($header_logo) }}" alt="{{ env('APP_NAME') }}" class="mw-100 t-img" style="height: 3rem;">
                @else
                    <img src="{{ static_asset('assets/img/logo.png') }}" alt="{{ env('APP_NAME') }}" class="mw-100 h-15px" height="15">
                @endif
            </a>
        </div>

        {{-- offer button  --}}
        <div>
           @if(get_setting('topbar_banner')!=null)
             <div class="col d-none d-lg-block d-flex align-items-center justify-content-center  p-0 m-0 mr-1" >
                <a href="{{ get_setting('topbar_banner_link')}}" >
                   <div style="margin-top: -1rem;">
                       <div>
                        <img src="{{ uploaded_asset(get_setting('topbar_banner')) }}" class="d-inline-block"  style="position: relative;" alt="" >
                       </div>

                        <div class="border border-width-2 border-primary d-flex justify-content-center align-items-center roboto" style="border-radius: 1rem;width:110px;display:inline-block;margin-left:3.8rem;margin-top:-2.5rem;"><span class="text-uppercase py-2 fs-10 fw-700 text-dark ">view offers</span></div>

                    </div>
               </a>
            </div>
           @elseif(get_setting('topbar_call_icon') || get_setting('topbar_call_text') || get_setting('topbar_call_number'))
           <div class="icon-pd  d-lg-none  mr-1">
                <div class="d-flex pl-0 align-items-center">

                    <img src="{{ uploaded_asset(get_setting('topbar_call_icon')) }}" class="pb-1" >

                    <div class="ml-2 lh-1">
                        <div class="text-alter fs-16 fw-600 pb-1 text-uppercase roboto">{{ get_setting('topbar_call_text') }}</div>
                        <div class="text-dark  opacity-70  fw-600 fs-11 roboto">{{ get_setting('topbar_call_number') }}</div>
                    </div>
                </div>
           </div>
           @endif
        </div>
        {{-- offer button end  --}}

    </div>
</div>

{{-- topbar mobnile  end  --}}



<header class="@if(get_setting('header_stikcy') == 'on') sticky-top @endif z-1021 bg-white border-bottom shadow-sm" >
    <div class="position-relative logo-bar-area z-1">

         {{-- 2nd header row --}}
        <div class="bg-alter-3 py-2 text-white web-topbar blu-nv">
            <div class="container">
               <div class="row">
                        @if ( get_setting('header_menu_labels') !=  null )
                            <div class="col-md-9 d-none d-lg-block pl-0 ">
                                <ul class="list-inline mb-0 pl-0  pt-1 mobile-hor-swipe text-center d-flex justify-content-start align-items-center">
                                    <li class="list-inline-item mr-0 ml-0">
                                        <a href="{{route('search')}}" class="fs-13 pr-4 py-2 d-inline-block fw-500 hov-opacity-100 text-reset  text-uppercase ">
                                          all products
                                        </a>
                                    </li>
                                    @foreach (json_decode( get_setting('header_menu_labels', null, App::getLocale()), true) as $key => $value)

                                    <li class="list-inline-item mr-0 ml-0">
                                            <a href="{{ json_decode( get_setting('header_menu_links'), true)[$key] }}" class="fs-13 px-4 py-2 d-inline-block fw-500 hov-opacity-100 text-reset  text-uppercase ">
                                                {{ $value }}
                                            </a>
                                    </li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                    <div class="col-md-3 col-sm-6 d-flex justify-content-end align-items-center">
                        <div type="button" class="mr-auto mobile-category-trigger d-flex align-items-center d-lg-none" data-toggle="class-toggle" data-target=".mobile-category-sidebar">
                            <button class="aiz-mobile-toggler">
                                <span></span>
                            </button>
                            {{-- <span class="text-uppercase ml-0 d-none d-xl-block d-lg-block  text-uppercase fs-13 px-3 py-2 fw-600 hov-opacity-100 d-inline-block  hov-opacity-100 text-reset  allcat">{{ translate(' Categories') }}</span> --}}
                        </div>
                          <a class="text-reset fs-14 text-uppercase text-center d-lg-none  mr-2" href="{{ route('flash-deals') }}">
                           <div class="d-flex align-items-center">
                                <i class="las la-percentage la-2x text-primary"></i>
                                <span>{{ translate('Offers') }}</span>
                           </div>
                        </a>
                        <a class="p-1 d-lg-none  text-primary   mt-2 mr-2" href="javascript:void(0);" data-toggle="class-toggle" data-target=".topbar-search" style="margin-right:-.5rem;">
                            <i class="las la-search la-flip-horizontal la-2x"></i>
                        </a>

                        <div class="mx-3 d-none d-lg-block">
                            @auth
                                @if(isAdmin())
                                    <a href="{{ route('admin.dashboard') }}" class="text-reset fs-11 d-inline-block">{{ translate('My Panel')}}</a>
                                @else
                                    <a href="{{ route('dashboard') }}" class="text-reset fs-11 d-inline-block">{{ translate('My Panel')}}</a>
                                @endif
                                    / <a href="{{ route('logout') }}" class="text-reset fs-11 d-inline-block">{{ translate('Logout')}}</a>
                            @else
                                <a href="{{ route('user.login') }}" class="text-reset fs-11 d-inline-block">{{ translate('Login')}}</a>
                                / <a href="{{ route('user.registration') }}" class="text-reset fs-11 d-inline-block">{{ translate('Registration')}}</a>
                            @endauth
                        </div>
                        <div class="h-100 d-flex align-items-center ml-md-1 ml-sm-0" id="wishlist">
                                @include('frontend.partials.wishlist')
                        </div>
                        <div class="px-1">
                            <a href="javascript:void(0)" class="d-flex align-items-center text-reset h-100 cart-toggler cart-trigger bg-base-1 rounded-left text-center z-1021"  type="button" data-toggle="class-toggle" data-target=".cart-sidebar"  data-toggle="dropdown" data-display="static" style="margin-top: -2px;">
                                <span class="position-relative text-reset mt-2 bg-sm ">
                                    <i class="la la-shopping-cart  opacity-100" style="font-size: 30px;"></i>
                                    <span class="absolute-top-right" style="top: -3px;right: -5px;">
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
                                        @php
                                            $count = (isset($cart) && count($cart)) ? count($cart) : 0;
                                        @endphp

                                        @if($count>0)
                                            <span class="badge badge-inline badge-pill text-dark cart-count shadow-md " style="width: 16px;height: 16px;font-size: 8px;background-color:white;">{{ $count}}</span>
                                        @else
                                            <span class="badge badge-inline badge-pill text-dark cart-count shadow-md " style="width: 16px;height: 16px;font-size: 8px;background-color:white;">0</span>
                                        @endif
                                    </span>
                                </span>
                            </a>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</header>



<!--white nav bar-->

<style>
    /* Dropdown Button */
.dropbtn {

}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {

  display: none;
  position: absolute;
  background-color: white;
  border: 1px white!important;
  border-radius: 3px;
  min-width: 200px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1030!important;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #123798;color: white;}
.dropdown-content a:hover .dropdown-content{display: block;}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {display: block;}

/* Change the background color of the dropdown button when the dropdown content is shown */

</style>

