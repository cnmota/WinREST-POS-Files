package POS::WinREST::Formatter::SaleHash;

use Moo;

extends 'POS::File::Flat::Formatter';

has record_definition => ( 
  is => 'ro', 
  required => 1, 
  default => sub {
    return [
      { name => 'unknow', size => 2, type => 'Numeric' },
      { name => 'process', size => 9, type => 'Numeric' },
      { name => 'doc_date', size => 10, type => 'Date' },
      { name => 'filler', size => 66, type => 'Str' },
      { name => 'hash', size => 182, type => 'Str' },
    ] 
  }
);

1;
