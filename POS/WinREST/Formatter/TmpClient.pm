package POS::WinREST::Formatter::TmpClient;

use Moo;

extends 'POS::File::Flat::Formatter';

has record_definition => (
  is => 'ro',
  required => 1,
  default => sub {
    return [
      { name => 'tax_number', size => 12, type => 'Str' },
      { name => 'name', size => 40, type => 'Str' },
      { name => 'city', size => 40, type => 'Str' },
    ]
  }
);

1;
