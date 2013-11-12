package POS::File::Flat;

use Moo;

use Encode qw( decode encode );

has formatter => ( 
  is => 'ro', 
  required => 1, 
);

has filename  => ( 
  is => 'ro', 
  required => 0 
);

has is_gziped => ( 
  is => 'rw', 
  required => 0, 
  default => sub { return 0 } 
);

has rows => (
  is => 'rw',
  required => 0,
  default => sub { [] }
);

with 'POS::File::Slurp';

sub BUILDARGS {
  my ( $class, %args ) = @_;

  my $formatter_class = $args{formatter};

  eval "require $formatter_class";
  $args{formatter} = $formatter_class->new();

  return \%args;
}

sub BUILD {
  my $self = shift;

  if ($self->filename()) {
    $self->load( $self->slurp() );
  }
}

sub load {
  my ($self, $raw_rows) = @_;

  foreach my $row (@{$raw_rows || []}) {
    # WE NEED TO GUESS ENCODING AND CONVERT IT TO UNICODE
    $row =~ s/\r|\n//g;

    push @{ $self->{rows} }, $self->formatter()->unparse( $row );
  }

  $self->{rows} = $self->formatter()->sort( $self->{rows} );
}

sub save {
  my ($self, $filename) = @_;

  open my $fh, ">$filename";

  foreach my $row (@{$self->rows() || []}) {
    my $new_row = $self->formatter->parse( $row );
    $new_row = encode( "cp850", $self->formatter->parse( $row ) );
    
    print $fh $new_row;
  }

  close $fh;
}

sub find {
  my ($self, %params) = @_;

  #PREBUILD INDEX
  unless (defined $self->{__cache__} && $self->{__cache__}->{key} eq join("#", keys %params)) {
    $self->{__cache__}->{key} = join("#", keys %params);
    $self->{__cache__}->{rows} = {};

    foreach my $row ( @{ $self->{rows} || [] } ) {
      eval {
        my @values = ();
        foreach my $key (keys %params) {
          push @values, $row->{$key};
        }

        my $find_key = join("%%",@values);

        $self->{__cache__}->{rows}->{ $find_key} = [] unless defined $self->{__cache__}->{rows}->{ $find_key};
        push @{ $self->{__cache__}->{rows}->{ $find_key}  }, $row;
      };
    }
  }

  return defined $self->{__cache__}->{rows}->{join("%%",values %params)} ? $self->{__cache__}->{rows}->{join("%%",values %params)} : [];
}

1;
