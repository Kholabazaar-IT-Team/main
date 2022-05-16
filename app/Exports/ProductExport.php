<?php
namespace App\Exports;


use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class ProductExport implements FromView
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct($products)
    {
        $this->products = $products;
    }

    public function view(): View
    {
        return view('exports.product_export', [
            'products' => $this->products
        ]);
    }
}
