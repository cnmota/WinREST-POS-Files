package POS::WinREST::Formatter::Operator;

use Moo;

extends 'POS::File::Flat::Formatter';

has record_definition => (
  is => 'ro',
  required => 1,
  default => sub {
    return [
      { name => 'code', size => 6, type => 'Numeric' },
      { name => 'name', size => 38, type => 'Str' },
      { name => 'language', size => 2, type => 'Numeric', default => 1 },
      { name => 'internal_name', size => 16, type => 'Str' },
      { name => 'address', size => 35, type => 'Str' },
      { name => 'city', size => 30, type => 'Str' },
      { name => 'postal_code', size => 25, type => 'Str' },
      { name => 'phone', size => 20, type => 'Str' },
      { name => 'tax_number', size => 20, type => 'Str' },
      { name => 'identification', size => 20, type => 'Str' },
      { name => 'hire_date', size => 10, type => 'Date' },
      { name => 'card_number', size => 10, type => 'Numeric' },
      { name => 'receive_from', size => 1, type => 'Numeric', default => 0 },
      { name => 'send_to', size => 1, type => 'Numeric', default => 0 },
      { name => 'comission_code', size => 1, type => 'Numeric' },
      { name => 'category', size => 1, type => 'Numeric', default => 1 }, #THIS IS WEIRD 10 => 'D', and so on
      { name => 'passwfo', size => 4, type => 'Numeric', default => 1111 },
      { name => 'button_color', size => 3, type => 'Numeric', default => 252 },
      { name => 'table_group', size => 32, type => 'Str', default => '1:200' },
      { name => 'locks_table', size => 1, type => 'Bool', default => 'T' },
      { name => 'purge_order', size => 1, type => 'Bool', default => 'T' },
      { name => 'purge_wsubtotal', size => 1, type => 'Bool', default => 'T' },
      { name => 'handle_order', size => 1, type => 'Bool', default => 'T' },
      { name => 'query_table', size => 1, type => 'Bool', default => 'T' },
      { name => 'close_table', size => 1, type => 'Bool', default => 'T' },
      { name => 'radio_close_table', size => 1, type => 'Bool', default => 'T' },
      { name => 'handle_invoice', size => 1, type => 'Bool', default => 'T' },
      { name => 'update_cc', size => 1, type => 'Bool', default => 'T' },
      { name => 'offer_price_code', size => 1, type => 'Numeric', default => 0 },
      { name => 'perc_price_offer', size => 6, type => 'Numeric', default => 0 },
      { name => 'base_offer', size => 9, type => 'Numeric', default => 0 },
      { name => 'consumption_price', size => 1, type => 'Numeric', default => 0 },
      { name => 'perc_consumption_price', size => 6, type => 'Numeric', default => 0 },
      { name => 'base_consumption', size => 9, type => 'Numeric', default => 0 },
      { name => 'changed', size => 1, type => 'Bool', default => 'T' },
      { name => 'deleted', size => 1, type => 'Bool', default => 'F' },
      { name => 'deleted_date', size => 10, type => 'Date', default => '24/12/2012' },
      { name => 'syncnumber', size => 9, type => 'Numeric', default => 0 },
    ]
  }
);

1;
