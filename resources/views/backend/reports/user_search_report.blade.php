@extends('backend.layouts.app')

@section('content')

<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card">
    		<div class="card-header">
    			<h1 class="h6">{{translate('User Search Report')}}</h1>
    		</div>
            <div class="card-body">
                  <form action="" method="GET">
                    <div class="row my-3">
                       <div class="col-md-8">
                        <input type="text" class="form-control" name="qury" value="{{ $q }}">
                       </div>
                        <button class="btn btn-primary">Filter</button>
                    </div>
                </form>
                <table class="table table-bordered aiz-table mb-0">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>{{ translate('Search By') }}</th>
                            <th>{{ translate('Number searches') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($searches as $key => $searche)
                            <tr>
                                <td>{{ ($key+1) + ($searches->currentPage() - 1)*$searches->perPage() }}</td>
                                <td>{{ $searche->qury }}</td>
                                <td>{{ $searche->count }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="aiz-pagination mt-4">
                       {{ $searches->appends(request()->query())->links() }}
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
