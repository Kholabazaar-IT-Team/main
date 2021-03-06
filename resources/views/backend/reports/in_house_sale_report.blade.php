@extends('backend.layouts.app')

@section('content')

<div class="aiz-titlebar text-left mt-2 mb-3">
	<div class=" align-items-center">
       <h1 class="h3">{{translate('Inhouse Product sale report')}}</h1>
	</div>
</div>

<div class="row">
    <div class="col-md-10 mx-auto">
        <div class="card">
            <div class="card-body">
                <form action="{{ route('in_house_sale_report.index') }}" method="GET">
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">{{translate('Sort by Category')}} :</label>
                        <div class="col-md-5">
                            <select id="demo-ease" class="aiz-selectpicker" data-live-search="true" name="category_id" >
                                  <option value="">All</option>
                                @foreach (\App\Category::all() as $key => $category)
                                    <option value="{{ $category->id }}" @if($category->id == $sort_by) selected @endif >{{ $category->getTranslation('name') }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-primary" type="submit">{{ translate('Filter') }}</button>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-light" type="submit" value="export" name="button">{{ translate('Export') }}</button>
                        </div>
                    </div>
                </form>

                <table class="table table-bordered aiz-table mb-0">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>{{ translate('Product Name') }}</th>
                            <th>{{ translate('Variation-Quantity') }}</th>
                            <th>{{ translate('Num of Sale') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($products as $key => $product)
                            <tr>
                                <td>{{ ($key+1) + ($products->currentPage() - 1)*$products->perPage() }}</td>
                                <td>{{ $product->getTranslation('name') }}</td>
                                <td>
                                    @foreach ($product->stocks as $key => $stock )
                                        <span>@if($stock->variant ) {{ $stock->variant }} - @endif {{ $stock->qty_sold }} @if($key!=count($product->stocks)-1) , @endif<br></span>
                                    @endforeach
                                </td>
                                <td>{{ $product->num_of_sale }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="aiz-pagination mt-4">
                    {{ $products->links() }}
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
