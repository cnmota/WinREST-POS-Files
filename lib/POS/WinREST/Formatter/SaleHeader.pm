package POS::WinREST::Formatter::SaleHeader;

use Moo;

extends 'POS::File::Flat::Formatter';

has record_definition => ( 
  is => 'ro', 
  required => 1, 
  default => sub {
    return [
      { name => 'process', size => 9, type => 'Numeric' },
      { name => 'doc_date', size => 10, type => 'Date' },
      { name => 'shift', size => 1, type => 'Numeric' },
      { name => 'abs_number', size => 9, type => 'Numeric' },
      { name => 'opening_hour', size => 5, type => 'Str' },
      { name => 'local', size => 2, type => 'Numeric' },
      { name => 'table_id', size => 4, type => 'Numeric' },
      { name => 'opening_emp', size => 6, type => 'Numeric' },
      { name => 'closing_hour', size => 5, type => 'Str' },
      { name => 'closing_emp', size => 6, type => 'Numeric' },
      { name => 'doc_type', size => 1, type => 'Numeric' },
      { name => 'doc_number', size => 8, type => 'Numeric' },
      { name => 'total', size => 13, type => 'Numeric' },
      { name => 'persons', size => 3, type => 'Numeric' },
      { name => 'client_code', size => 6, type => 'Numeric' },
      { name => 'atr1', size => 2, type => 'Numeric' },
      { name => 'atr2', size => 1, type => 'Numeric' },
      { name => 'atr3', size => 1, type => 'Numeric' },
      { name => 'reserved', size => 2, type => 'Numeric' },
      { name => 'canceled', size => 1, type => 'Bool', default => 'T' },
    ] 
  }
);

1;
