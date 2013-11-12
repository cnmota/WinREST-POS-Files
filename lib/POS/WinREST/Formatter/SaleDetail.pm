package POS::WinREST::Formatter::SaleDetail;

use Moo;

extends 'POS::File::Flat::Formatter';

has record_definition => (
  is => 'ro',
  required => 1,
  default => sub {
    return [
      { name => 'process', size => 9, type => 'Numeric' },
      { name => 'seq_number', size => 4, type => 'Numeric' },
      { name => 'operation_type', size => 1, type => 'Numeric' },
      { name => 'abs_number', size => 9, type => 'Numeric' },
      { name => 'product_code', size => 6, type => 'Numeric' },
      { name => 'request_code', size => 5, type => 'Numeric' },
      { name => 'description', size => 13, type => 'Str' },
      { name => 'qnt', size => 8, type => 'Numeric' },
      { name => 'base_price', size => 12, type => 'Numeric' },
      { name => 'discount', size => 12, type => 'Numeric' },
      { name => 'offer', size => 12, type => 'Numeric' },
      { name => 'tax', size => 6, type => 'Numeric' },
      { name => 'operation_time', size => 5, type => 'Str' },
      { name => 'employee_code', size => 6, type => 'Numeric' },
      { name => 'relation_time', size => 5, type => 'Str' },
      { name => 'relation_seq_number', size => 4, type => 'Numeric' },
      { name => 'source', size => 2, type => 'Numeric' },
      { name => 'promotion', size => 1, type => 'Numeric', default => '0' },
      { name => 'wharehouse_code', size => 3, type => 'Str' },

    ]
  }
);

1;
