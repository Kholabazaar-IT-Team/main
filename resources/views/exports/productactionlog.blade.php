<table >
    <thead>
        <tr>
            <th>{{ translate('Product') }}</th>
            <th >{{ translate('Action') }}</th>
            <th >{{ translate('User') }}</th>
            <td>{{  translate('Contact')  }}</td>
            <th>{{ translate('Date') }}</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($logs as $key => $log)
            <tr>
                @if($log->product)
                <td>{{ $log->product->name }}</td>
                @else
                <td>Product Not Found</td>
                @endif

                <td>{{ $log->action }}</td>

                @if( $log->user)
                 <td>{{ $log->user->name }}</td>
                  @if($log->user->email)
                    <td>{{ $log->user->email }}</td>
                  @else
                      <td>{{ $log->user->phone }}</td>
                  @endif
                @else
                    <td> Not Found</td>
                     <td> Not Found</td>
                @endif

                <td>{{Carbon\Carbon::parse($log->created_at)->format('d-m-Y') }}</td>
            </tr>
        @endforeach
    </tbody>
</table>
