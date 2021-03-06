@extends('backend.layouts.app')

@section('content')
@php
    $refund_request_addon = \App\Addon::where('unique_identifier', 'refund_request')->first();
@endphp
<div class="card">
    <form class="" action="" id="sort_orders" method="GET">
        <div class="row">
            <div class="col">  <h5 class="mb-md-0 h4 text-center p-2">All Orders ({{App\Order::count()}})</h5></div>
          </div>
        <div class="card-header row gutters-5">
            <div class="dropdown mb-2 mb-md-0">
                <button class="btn border dropdown-toggle" type="button" data-toggle="dropdown">
                    {{translate('Bulk Action')}}
                </button>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="#" onclick="bulk_delete()"> {{translate('Delete selection')}}</a>
                   
                    <a class="dropdown-item" href="#" onclick="bulk_print()"> {{translate('Print Details')}}</a>
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#exampleModal">{{translate('Change Order Status')}}</a>
<!--                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#exampleModal">
                        <i class="las la-sync-alt"></i>
                        {{translate('Change Order Status')}}
                    </a>-->
                </div>
            </div>

            <!-- Change Status Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">
                                {{translate('Choose an order status')}}
                            </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <select class="form-control aiz-selectpicker" onchange="change_status()" data-minimum-results-for-search="Infinity" id="update_delivery_status">
                                <option value="pending">{{translate('Pending')}}</option>
                                <option value="hold">{{translate('Hold')}}</option>
                                <option value="confirmed">{{translate('Confirmed')}}</option>
                                <option value="picked_up">{{translate('Picked Up')}}</option>
                                <option value="on_the_way">{{translate('On The Way')}}</option>
                                <option value="delivered">{{translate('Delivered')}}</option>
                                <option value="cancelled">{{translate('Cancel')}}</option>
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-2 ml-auto">
                <select class="form-control aiz-selectpicker" name="delivery_status" id="delivery_status">
                    <option value="">---selecte---</option>
                    <option value="pending" @if ($delivery_status == 'pending') selected @endif>{{translate('Pending')}}</option>
                    <option value="hold" @if ($delivery_status == 'hold') selected @endif>{{translate('Hold')}}</option>
                    <option value="confirmed" @if ($delivery_status == 'confirmed') selected @endif>{{translate('Confirmed')}}</option>
                    <option value="picked_up" @if ($delivery_status == 'picked_up') selected @endif>{{translate('Picked Up')}}</option>
                    <option value="on_the_way" @if ($delivery_status == 'on_the_way') selected @endif>{{translate('On The Way')}}</option>
                    <option value="delivered" @if ($delivery_status == 'delivered') selected @endif>{{translate('Delivered')}}</option>
                    <option value="cancelled" @if ($delivery_status == 'cancelled') selected @endif>{{translate('Cancel')}}</option>
                </select>
            </div>
            <div class="col-lg-2">
                <div class="form-group mb-0">
                    <input type="text" class="aiz-date-range form-control" value="{{ $date }}" name="date" placeholder="{{ translate('Filter by date') }}" data-format="DD-MM-Y" data-separator=" to " data-advanced-range="true" autocomplete="off">
                </div>
            </div>
            <div class="col-lg-2">
                <div class="form-group mb-0">
                    <input type="text" class="form-control" id="search" name="search"@isset($sort_search) value="{{ $sort_search }}" @endisset placeholder="{{ translate('Type Order code & hit Enter') }}">
                </div>
            </div>
            <div class="col-lg-2">
                <div class="form-group mb-0">
                    <input type="text" class="form-control" id="sku" name="sku"@isset($sku) value="{{ $sku }}" @endisset placeholder="{{ translate('Type SkU & Enter') }}">
                </div>
            </div>
            <div class="col-auto">
                <div class="form-group mb-0">
                    <button type="submit" class="btn btn-primary">{{ translate('Filter') }}</button>
                </div>
            </div>
            <div class="col-auto">
                <div class="form-group mb-0">
                    <button   class="btn btn-secondary"  type="submit" name="button" value="export">{{ translate('Export') }}</button>
                </div>
            </div>
        </div>

        <div class="card-body">
            <table class="table aiz-table mb-0">
                <thead>
                    <tr>
                        <!--<th>#</th>-->
                        <th>
                            <div class="form-group">
                                <div class="aiz-checkbox-inline">
                                    <label class="aiz-checkbox">
                                        <input type="checkbox" class="check-all">
                                        <span class="aiz-square-check"></span>
                                    </label>
                                </div>
                            </div>
                        </th>
                        <th>{{ translate('Order Code') }}</th>
                        <th>{{ translate('Order Date') }}</th>
                        <th data-breakpoints="md">{{ translate('Num. of Products') }}</th>
                        <th data-breakpoints="md">{{ translate('Customer') }}</th>
                        <th data-breakpoints="md">{{ translate('Amount') }}</th>
                        <th data-breakpoints="md">{{ translate('Delivery Status') }}</th>
                        <th data-breakpoints="md">{{ translate('Payment Status') }}</th>
                        @if ($refund_request_addon != null && $refund_request_addon->activated == 1)
                        <th>{{ translate('Refund') }}</th>
                        @endif
                        <th class="text-right" width="15%">{{translate('options')}}</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($orders as $key => $order)
                   
                    <tr>
    <!--                    <td>
                            {{ ($key+1) + ($orders->currentPage() - 1)*$orders->perPage() }}
                        </td>-->
                        <td>
                            <div class="form-group">
                                <div class="aiz-checkbox-inline">
                                    <label class="aiz-checkbox">
                                        <input type="checkbox" class="check-one" name="id[]" value="{{$order->id}}">
                                        <span class="aiz-square-check"></span>
                                    </label>
                                </div>
                            </div>
                        </td>
                        <td>
                            {{ $order->code }}@if($order->viewed == 0) <span class="badge badge-inline badge-info">{{translate('New')}}</span>@endif
                          
                        </td>
                        <td>
                            {{ date("d-M-Y h:i:s a",$order->date) }}
                        </td>
                        <td>
                            {{ count($order->orderDetails) }}
                        </td>
                        <td>
                            @if ($order->user != null)
                            {{ $order->user->name }}
                            @else
                            Guest ({{ $order->guest_id }})
                            @endif
                        </td>
                        <td>
                            {{ single_price($order->grand_total) }}
                        </td>
                        <td>
                            @php
                                $status = $order->delivery_status;
                                if($order->delivery_status == 'cancelled') {
                                    $status = '<span class="badge badge-inline badge-danger">'.translate('Cancel').'</span>';
                                }

                            @endphp
                            {!! $status !!}
                        </td>
                        <td>
                            @if ($order->payment_status == 'paid')
                            <span class="badge badge-inline badge-success">{{translate('Paid')}}</span>
                            @else
                            <span class="badge badge-inline badge-danger">{{translate('Unpaid')}}</span>
                            @endif
                        </td>
                        @if ($refund_request_addon != null && $refund_request_addon->activated == 1)
                        <td>
                            @if (count($order->refund_requests) > 0)
                                {{ count($order->refund_requests) }} {{ translate('Refund') }}
                            @else
                                {{ translate('No Refund') }}
                            @endif
                        </td>
                        @endif
                        <td class="text-right">
                            <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{route('orders.edit', $order->id)}}" title="{{ translate('Edit') }}">
                                <i class="las la-pen"></i>
                            </a>
                            <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{route('all_orders.show', encrypt($order->id))}}" title="{{ translate('View') }}">
                                <i class="las la-eye"></i>
                            </a>
                            <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{ route('invoice.download', $order->id) }}" title="{{ translate('Download Invoice') }}">
                                <i class="las la-download"></i>
                            </a>
                            <a href="javascript:void(0)" class="btn btn-soft-success btn-icon btn-circle btn-sm "  type="button" data-toggle="class-toggle" data-target=".event-sidebar" title="{{ translate('Evernt Logs') }}" onclick="populate({{ $order->id }})">
                                <i class="las la-file-alt"></i>
                            </a>
                            <a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete" data-href="{{route('orders.destroy', $order->id)}}" title="{{ translate('Delete') }}">
                                <i class="las la-trash"></i>
                            </a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>

            <div class="aiz-pagination">
                {{ $orders->appends(request()->input())->links() }}
            </div>

        </div>
    </form>
</div>

@endsection

@section('modal')
    @include('modals.delete_modal')
    <!-- Change Status Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">
                        {{translate('Choose an order status')}}
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <select class="form-control aiz-selectpicker" data-minimum-results-for-search="Infinity" id="update_delivery_status" data-container="body">
                        <option value="pending">{{translate('Pending')}}</option>
                        <option value="confirmed">{{translate('Confirmed')}}</option>
                        <option value="picked_up">{{translate('Picked Up')}}</option>
                        <option value="on_the_way">{{translate('On The Way')}}</option>
                        <option value="delivered">{{translate('Delivered')}}</option>
                        <option value="cancelled">{{translate('Cancel')}}</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="change_status()">Save changes</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script type="text/javascript">
        $(document).on("change", ".check-all", function() {
            if(this.checked) {
                // Iterate each checkbox
                $('.check-one:checkbox').each(function() {
                    this.checked = true;
                });
            } else {
                $('.check-one:checkbox').each(function() {
                    this.checked = false;
                });
            }

        });

        function change_status() {
           // var data = new FormData($('#order_form')[0]);
           var values = $("[name='id[]']:checked").map(function(){return $(this).val();}).get();
           var type = $("#update_delivery_status").val();
           $.ajax({
               headers: {
                   'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
               },
               url: "{{route('bulk-order-status')}}",
               type: 'POST',
               data: {ids:values,status:type},
               success: function (response) {
                   if(response == 1) {
                       location.reload();
                   }
               }
           });
       }

        function bulk_delete() {
            var data = new FormData($('#sort_orders')[0]);
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url: "{{route('bulk-order-delete')}}",
                type: 'POST',
                data: data,
                cache: false,
                contentType: false,
                processData: false,
                success: function (response) {
                    if(response == 1) {
                        location.reload();
                    }
                }
            });
        }
        

        function bulk_print() {
            var h = $(window).height();
            var w = $(window).width();
            var values = $("[name='id[]']:checked").map(function(){return $(this).val();}).get();
            if(values.length > 0){
                window.open( '{{ URL('admin/bulk-order-print/') }}/'+values, '_blank', 'height='+h+',width='+w+',scrollbars=yes,status=no' );
            }
        }

        function populate(id){

            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url: "{{route('orderlog.show')}}",
                type: 'POST',
                data: {
                    order_id:id
                },


                success: function (res) {
                    console.log(res.modal_view);
                    if(res.modal_view!=''){
                        $('#event-log').html(res.modal_view);
                    }else{
                        $('#event-log').html('<h4 class="text text-danger text-center">No Events Yet...</h4>');

                    }
                }
            });
        }
    </script>

{{-- sidebar section  --}}
   <section>

      <div class="collapse-sidebar-wrap sidebar-all sidebar-right z-1035 event-sidebar">

        <div class="overlay overlay-fixed dark c-pointer" data-toggle="class-toggle" data-target=".event-sidebar" data-same=".event-trigger"></div>
        <div class="bg-white d-flex flex-column shadow-lg event-sidebar collapse-sidebar c-scrollbar-light new-side" id="sidebar-cart" >
            <div class="d-flex align-items-center justify-content-between border-bottom px-3 py-2 bg-white sticky-top position-sticky">
                <h4 class="text text-center">Event Log</h4>
                <button class="btn btn-icon" data-toggle="class-toggle" data-target=".event-sidebar"><i class="la la-times fs-24"></i></button>
            </div>

            <div class="bg-white border-top px-3 py-2 sticky-bottom position-sticky">

            <div id="event-log">

            </div>


        </div>
    </div>
   </section>
@endsection
