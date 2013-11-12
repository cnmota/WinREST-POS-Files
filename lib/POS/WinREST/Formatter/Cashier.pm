package POS::WinREST::Formatter::Cashier;

use Moo;

extends 'POS::File::Flat::Formatter';

has record_definition => (
  is => 'ro',
  required => 1,
  default => sub {
    return [
      { name => 'doc_type', size => 2, type => 'Numeric' },
      { name => 'doc_number', size => 9, type => 'Numeric' },
      { name => 'abs_number', size => 9, type => 'Numeric' },
      { name => 'cashier_date', size => 10, type => 'Date' },
      { name => 'cashier_hour', size => 5, type => 'Str' },
      { name => 'debt_entity_type', size => 2, type => 'Numeric' },
      { name => 'debt_entity_number', size => 6, type => 'Numeric' },
      { name => 'credit_entity_type', size => 2, type => 'Numeric' },
      { name => 'credit_entity_number', size => 6, type => 'Numeric' },
      { name => 'pay_method', size => 2, type => 'Numeric' },
      { name => 'cashier_value', size => 13, type => 'Numeric' },
      { name => 'description', size => 18, type => 'Str' },
      { name => 'tax_number', size => 12, type => 'Str' },
    ]
  }
);

1;
