WinREST POS Files
====================

Small collection of modules to parse, read and write WinREST POS Files, both data and masters.

Usage:

READ

my $headers = POS::File::Flat->new( filename => '/home/winrest/files/export/c1301010.020', formatter => 'POS::WinREST::Formatter::SaleHeader' );

foreach my $row (@{$headers->rows()}) {
  print "DOC TYPE:".$row->{doc_type}." VALUE: ".$row->{total}."\n";
}

WRITE

my $rows = [
  { 
    code => 12,
    name => 'Coffe',
    price1 => 0.60
    ...
  },
  ...
];

my $writer = POS::File::Flat->new( rows => $rows, formatter => 'POS::WinREST::Formatter::Product' );
$writer->save('/home/winrest/files/data/wrstmart.000');

