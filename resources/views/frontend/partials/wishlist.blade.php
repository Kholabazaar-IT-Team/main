<a href="{{ route('wishlists.index') }}" class="position-relative text-reset btn bg-sm btn-circle btn-icon">
    <i class="la la-heart-o opacity-100 fs-24"></i>
    <span class="absolute-top-right" style="top: 3px;right: -5px;">
        @if(Auth::check())
            <span class="badge badge-inline badge-pill text-dark shadow-md" style="width: 16px;height: 16px;font-size: 10px;background-color:white;">{{ count(Auth::user()->wishlists)}}</span>
        @else
            <span class="badge badge-inline badge-pill text-dark shadow-md" style="width: 16px;height: 16px;font-size: 10px;background-color:white;">0</span>
        @endif
    </span>
</a>
