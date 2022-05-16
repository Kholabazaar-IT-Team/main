<thead>
    <tr>

        <th>{{translate('Email')}}</th>
        <th data-breakpoints="lg">{{translate('Date')}}</th>

    </tr>
</thead>
<tbody>
    @foreach($subscribers as $key => $subscriber)
      <tr>

                  <td><div class="text-truncate">{{ $subscriber->email }}</div></td>
          <td>{{ date('d-m-Y', strtotime($subscriber->created_at)) }}</td>

      </tr>
    @endforeach
</tbody>
