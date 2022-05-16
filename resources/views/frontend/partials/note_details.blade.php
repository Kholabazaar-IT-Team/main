
<div class="d-flex justofy-content-center align-items-center" >
    <table class="table ">
        <thead>
            <th>Note</th>
            <th>By</th>
            <th>Date</th>
        </thead>
        <tbody>
            @foreach ($notes as $note )

            <tr>
                <td>{{ $note->note }}</td>
                <td>{{ $note->user->name }}</td>
                <td>{{ Carbon\Carbon::parse($note->created_at)->format('d-m-Y') }}</td>
            </tr>

            @endforeach

        </tbody>
    </table>
</div>




