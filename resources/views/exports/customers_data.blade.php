<table>
   <thead>
       <tr>
        <th>Customer</th>
        <th>Phone</th>
        <th>Email</th>
       </tr>
   </thead>
   <tbody>
        @foreach ($customers as $key=>$customer)
            @php
                $user=$customer->user;
            @endphp
            @if($user && $user->email_verified_at != null)
            <tr>
                <td>{{ $user->name }}</td>
                <td>{{ $user->phone? trim($user->phone,"+88"): "NO Data"}}</td>
                <td>{{ $user->email?$user->email: "No Data"}}</td>
            </tr>
            @endif
        @endforeach
   </tbody>
</table>
