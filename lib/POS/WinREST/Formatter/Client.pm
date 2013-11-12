package POS::WinREST::Formatter::Client;

use Moo;

extends 'POS::File::Flat::Formatter';

has record_definition => (
  is => 'ro',
  required => 1,
  default => sub {
    return [
      { name => 'code', size => 6, type => 'Numeric' },
      { name => 'associate', size => 6, type => 'Numeric' },
      { name => 'name', size => 40, type => 'Str' },
      { name => 'address', size => 35, type => 'Str' },
      { name => 'city', size => 30, type => 'Str' },
      { name => 'postal_code', size => 25, type => 'Str' },
      { name => 'phone', size => 20, type => 'Str' },
      { name => 'fax', size => 20, type => 'Str' },
      { name => 'tax_number', size => 20, type => 'Str' },
    ]
  }
);

1;
