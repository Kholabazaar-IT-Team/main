@extends('backend.layouts.app')

@section('content')
    <div class="card">
        <div class="card-header">
            <h5 class="mb-0 h6">{{translate('Affiliate Logs')}}</h5>
        </div>
        <div class="card-body">
            <table class="table aiz-table mb-0">
                <thead>
                <tr>
                    <th>#</th>
                    <th data-breakpoints="lg">{{ translate('Referred By')}}</th>
                    <th>{{ translate('Referral User')}}</th>
                    <th>{{ translate('Amount')}}</th>
                    <th data-breakpoints="lg">{{ translate('Order Id')}}</th>
                    <th data-breakpoints="lg">{{ translate('Referral Type') }}</th>
                    <th data-breakpoints="lg">{{ translate('Product') }}</th>
                    <th data-breakpoints="lg">{{ translate('Date') }}</th>
                </thead>
                <tbody>
                @foreach($affiliate_logs as $key => $affiliate_log)
                    <tr>
                        <td>{{ ($key+1) + ($affiliate_logs->currentPage() - 1)*$affiliate_logs->perPage() }}</td>
                        <td>
                            @php
                                $usr=\App\User::where('id', $affiliate_log->referred_by_user)->first();
                            @endphp
                            {{ $usr?$usr->name:'Not Found' }}
                        </td>
                        <td>
                            @if($affiliate_log->user_id !== null)
                                {{ $affiliate_log->user?$affiliate_log->user->name:'Not Found' }}
                            @else
                                {{ translate('Guest').' ('. $affiliate_log->guest_id.')' }}
                            @endif
                        </td>
                        <td>{{ single_price($affiliate_log?$affiliate_log->amount:0) }}</td>
                        <td>
                            @if($affiliate_log->order_id != null)
                                {{ $affiliate_log?$affiliate_log->order?$affiliate_log->order->code:'Not Found':'Not Found'}}
                            @else
                                {{ $affiliate_log?$affiliate_log->order_detail->order->code:'Not Found' }}
                            @endif
                        </td>
                        <td> {{ ucwords(str_replace('_',' ', $affiliate_log?$affiliate_log->affiliate_type:'Not Found')) }}</td>
                        <td>
                            @if($affiliate_log->order_detail_id != null)
                                {{ $affiliate_log?$affiliate_log->order_detail?$affiliate_log->order_detail->product->name:'Not Found':'Not Found' }}
                            @endif
                        </td>
                        <td>{{ $affiliate_log?$affiliate_log->created_at->format('d, F Y'):'Not Found' }} </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
            <div class="aiz-pagination">
                {{ $affiliate_logs->links() }}
            </div>
        </div>
    </div>
@endsection
