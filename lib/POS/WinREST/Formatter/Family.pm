package POS::WinREST::Formatter::Family;

use Moo;

extends 'POS::File::Flat::Formatter';

has record_definition => (
  is => 'ro',
  required => 1,
  default => sub {
    return [
      { name => 'code', size => 4, type => 'Numeric' },
      { name => 'name', size => 40, type => 'Str' },
      { name => 'short_name', size => 13, type => 'Str' },
      { name => 'button_name', size => 34, type => 'Str' },
      { name => 'auto_addon', size => 1, type => 'Bool', default => 'F' },
      { name => 'family_size', size => 1, type => 'Numeric', default => 0 },
      { name => 'accounting_type', size => 1, type => 'Numeric' },
      { name => 'unit', size => 2, type => 'Str', default => 'Un' },
      { name => 'radio_convertion', size => 7, type => 'Numeric', default => '1.00' },
      { name => 'discount_group', size => 1, type => 'Numeric', default => 0 },
      { name => 'commission_group', size => 1, type => 'Numeric', default => 0 },
      { name => 'print_sort_order', size => 1, type => 'Numeric', default => 1 },
      { name => 'print_sort_doc', size => 1, type => 'Numeric', default => 1 },
      { name => 'print_zone', size => 2, type => 'Numeric', default => 1 },
      { name => 'table_tax', size => 1, type => 'Numeric', default => 0 },  
      { name => 'direct_tax', size => 1, type => 'Numeric', default => 0 }, 
      { name => 'price1', size => 12, type => 'Numeric', default => '0.00' }, 
      { name => 'price2', size => 12, type => 'Numeric', default => '0.00' },
      { name => 'price3', size => 12, type => 'Numeric', default => '0.00' },
      { name => 'price4', size => 12, type => 'Numeric', default => '0.00' },
      { name => 'price5', size => 12, type => 'Numeric', default => '0.00' },
      { name => 'change_sale_price', size => 1, type => 'Bool', default => 'F' },
      { name => 'grant_offer', size => 1, type => 'Bool', default => 'T' },
      { name => 'product_type', size => 1, type => 'Numeric', default => 0 },
      { name => 'class', size => 1, type => 'Numeric', default => 0 },
      { name => 'button_color', size => 3, type => 'Numeric', default => 255 },
      { name => 'net_weight', size => 8, type => 'Numeric', default => 0, default => '0.000' },
      { name => 'unit_weight', size => 11, type => 'Numeric', default => 0, default => '0.000000' }, 
      { name => 'changed', size => 1, type => 'Bool', default => 'T' },
      { name => 'deleted', size => 1, type => 'Bool', default => 'F' },
      { name => 'deleted_date', size => 10, type => 'Date', default => '24/12/2012' },
      { name => 'syncnumber', size => 9, type => 'Numeric', default => 0 },
    ]
  }
);

1;
