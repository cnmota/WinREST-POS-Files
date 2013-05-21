package POS::WinREST::Formatter::SaleFooter;

use Moo;

extends 'POS::File::Flat::Formatter';

has record_definition => (
  is => 'ro',
  required => 1,
  default => sub {
    return [
      { name => 'process', size => 9, type => 'Numeric' },
      { name => 'seq_number', size => 2, type => 'Numeric' },
      { name => 'abs_number', size => 9, type => 'Numeric' },
      { name => 'pay_value', size => 13, type => 'Numeric' },
      { name => 'pay_method', size => 2, type => 'Numeric' },
      { name => 'client_code', size => 6, type => 'Numeric' },

    ]
  }
);

1;
