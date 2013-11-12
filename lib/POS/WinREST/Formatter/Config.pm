package POS::WinREST::Formatter::Config;

use Moo;

extends 'POS::File::Flat::Formatter';

has record_definition => (
  is => 'ro',
  required => 1,
  default => sub {
    return [
      { name => 'code', size => 6, type => 'Numeric' },
      { name => 'name', size => 6, type => 'Str' },
      { name => 'value', size => 21, type => 'Str' },
      { name => 'extra', size => 1, type => 'Str' },
    ]
  }
);

1;
