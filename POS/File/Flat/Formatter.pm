package POS::File::Flat::Formatter;

use Moo;
use POSIX qw(sprintf);

has record_definition => ( is => 'ro', required => 1, default => sub { die 'Override me please' } );

sub BUILD {
  my $self = shift;

  $self->{__fast_fnames__} = [];
  $self->{__fields_by_name__} = {};
  $self->{__unpackstr__} = "";

  foreach my $field (@{ $self->record_definition() || []}) {
    push @{ $self->{__fast_fnames__} }, $field->{name};
    $self->{__unpackstr__} .= 'A'.$field->{size};

    $self->{__fields_by_name__}->{$field->{name}} = $field;
  }

  $self->{__fast_fnames__}
}

sub row_length {
  my $self = shift;

  if (defined $self->{__row_size__} && $self->{__row_size__}) {
    return $self->{__row_size__};
  } else {
    $self->{__row_size__} = 0;

    foreach my $field (@{ $self->record_definition() || []}) {
      $self->{__row_size__} += $field->{size};
    }
  }

  return $self->{__row_size__};
}

sub parse {
  my ($self, $ref) = @_;

  my @values = ();

  foreach my $field (@{ $self->record_definition() || []}) {
    my $val = $ref->{ $field->{name} };

    unless (defined $val) {
      if (defined $field->{default}) {
        $val = $field->{default};
      } else {
        $val = 0 if ($field->{type} eq 'Numeric');
        $val = '' if ($field->{type} eq 'Str');
        $val = '01/01/2012' if ($field->{type} eq 'Date');
        $val = 'F' if ($field->{type} eq 'Bool');  
      }
    }
    if ($field->{type} eq 'Numeric') {
      $val = sprintf("%".$field->{size}."s", $val );
    }

    push @values, $val;
  }

  return pack( $self->{__unpackstr__}, @values)."\n";
}

sub unparse {
  my ($self, $str) = @_;

  my $ref = {};

  my @values = unpack($self->{__unpackstr__},$str);

  if (scalar @values == scalar(@{$self->{__fast_fnames__}})) {
    while( my( $index, $value ) = each @{$self->{__fast_fnames__} || []} ) {
      $values[$index] =~ s/\s+//g;
      
      my $val = $values[$index];

      if ($self->{__fields_by_name__}->{$value}->{type} eq 'Date') {
        #NORMALIZE DATES
        if ($val =~ /^\d\d\-\d\d\-\d\d\d\d$/) {
          my( $d, $m, $y ) = $val =~ /^(\d\d)\-(\d\d)\-(\d\d\d\d)$/;
          $val = "$y-$m-$d";
        } elsif ($val =~ /^(\d\d)\/(\d\d)\/(\d\d\d\d)$/) {
          $val =~ /^(\d\d)\/(\d\d)\/(\d\d\d\d)$/;
          $val = "$3-$1-$2";
        }

        $val  =~ s/\//-/g;
      }
    
      $ref->{$value} = $val;
    }
  } else {
    die "ERROR INVALID NUMBER OF FIELDS\n";
  }

  return $ref;
}

sub sort {
  my $self = shift;
  my $rows = shift;

  return $rows;
}

=pod
sub _decode_str {
  my $w = shift;
  return encode("iso-8859-1", decode("cp850", $w));
}

sub _encode_str {
  my $w = shift;
  return encode("cp850", $w);
}
=cut

1;
