<div class="card-body">
    <table class="table aiz-table mb-0">
        <thead>
            <tr>
                <th>Name</th>
               
                <th data-breakpoints="sm">Info</th>
               
                <th data-breakpoints="lg">Todays Deal</th>
                <th data-breakpoints="lg">Published</th>
                <th data-breakpoints="lg">Featured</th>
            </tr>
        </thead>
        <tbody>
            @foreach($products as $key => $product)
            <tr>
                <td>
                    <div class="row gutters-5 w-200px w-md-300px mw-100">
                        <div class="col">
                            <span class="text-muted text-truncate-2">{{ $product->name }}</span>
                        </div>
                    </div>
                </td>
                 
                <td>
                    <strong>Num of Sale</strong> {{ $product->num_of_sale }} times</br>
                    <strong>Base Price</strong> {{ $product->unit_price }} </br>
                    <strong>Rating</strong> {{ $product->rating }} </br>
                </td>
                
                <td>
                    {{$product->todays_deal}}
                </td>
                <td>
                    {{$product->published}}
                </td>

                <td>
                   {{$product->featured}}
                </td>

            </tr>
            @endforeach
        </tbody>
    </table>

</div>
