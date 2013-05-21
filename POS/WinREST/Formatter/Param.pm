package POS::WinREST::Formatter::Param;

use Moo;

extends 'POS::File::Flat::Formatter';

has record_definition => (
  is => 'ro',
  required => 1,
  default => sub {
    return [
      { name => 'param_type', size => 4, type => 'Str' },
      { name => 'code', size => 10, type => 'Str' },
      { name => 'description', size => 20, type => 'Str' },
      { name => 'param_value', size => 13, type => 'Numeric' },
      { name => 'text', size => 4, type => 'Str' },
      { name => 'changed', size => 1, type => 'Bool', default => 'T' },
      { name => 'deleted', size => 1, type => 'Bool', default => 'F' },
      { name => 'deleted_date', size => 10, type => 'Date', default => '24/12/2012' },
      { name => 'syncnumber', size => 9, type => 'Numeric', default => 0 },
    ]
  }
);

1;
