package POS::File::Slurp;

use Moo::Role;

use File::MMagic;
use IO::Uncompress::Gunzip;

requires 'filename';

has flm => ( 
  is => 'ro', 
  default => sub { return File::MMagic->new() }
);

sub slurp {
  my $self = shift;

  if ( $self->flm()->checktype_filename( $self->filename() )  =~ /application\/x\-gzip/ ) {
    $self->is_gziped(1);
  }

  my $fh;
  my $tmp = [];

  if (-e $self->filename()) {
    if ($self->is_gziped(1)) {
      $fh = IO::Uncompress::Gunzip->new($self->filename());
    } else {
      open($fh,"<".$self->filename()); 
    }

    while(<$fh>) {
      push @{$tmp}, $_;
    }

    close $fh;
  } else {
    print STDERR "Could not find ".$self->filename()."\n";
  }

  return $tmp;
}

1;
