
    {{-- home category section  --}}
    @if(get_setting('filter_categories') != null)
        @foreach (App\Category::whereIn('id',json_decode(get_setting('filter_categories'),true))->get() as $category)
      
            @if($category!=null)
                <section class="mb-5">
                    <div class="container">
                        <div class="d-flex flex-wrap mb-3 align-items-baseline  bg-alter p-1">
                            <h6 class="h6 fw-600 mb-0 px-4 fs-14 py-1 text-center hm-cat" >
                                <span class="ml-2 d-inline-block text-white text-uppercase  ">{{ $category->name }}</span>
                            </h6>
                            <a href="{{ route('products.category', $category->slug) }}" class="ml-auto mr-0 mt-md-0 btn btn-primary btn-sm shadow-md  text-uppercase">View All</a>
                        </div>

                        <div class="aiz-carousel gutters-5 half-outside-arrow dot-small-black" data-items="6" data-xl-items="6" data-lg-items="6"  data-md-items="5" data-sm-items="2" data-xs-items="2" data-infinite='true' data-arrows="true" data-autoplay="true" data-dots="false">
                            @foreach (get_cached_products($category->id) as $key => $product)
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

        @endforeach
    @endif
