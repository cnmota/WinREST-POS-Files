package POS::WinREST::Formatter::Session;

use Moo;

extends 'POS::File::Flat::Formatter';

has record_definition => (
  is => 'ro',
  required => 1,
  default => sub {
    return [
      { name => 'abs_number', size => 9, type => 'Numeric' },
      { name => 'session_date', size => 10, type => 'Date' },
      { name => 'session_hour', size => 5, type => 'Str' },
      { name => 'cashier_code', size => 2, type => 'Numeric' },
      { name => 'shift_number', size => 2, type => 'Numeric' },
      { name => 'operation_type', size => 2, type => 'Numeric' },
      { name => 'employee_code', size => 6, type => 'Numeric' },
    ]
  }
);

sub sort {
  my $self = shift;
  my $rows = shift;

  #CHECK IF SESSIONS WHERE RESETED
  my $has_reset = 0;
  foreach my $row (@{$rows}) {
    if ($row->{abs_number} == 1) {
      $has_reset = 1;
      last;
    }
  }

  if ($has_reset) {
#    print STDERR "SESSION COUNTER WAS RESETED\n";
    my @before = ();
    my @after = ();
    my $ptr = \@after;

    my $previous = 0;

    foreach my $row (sort { $a->{abs_number} <=> $b->{abs_number} } @{$rows}) {
      if ($row->{abs_number} - $previous > 1) {
        $ptr = \@before;
      }

      push @$ptr, $row;
      $previous = $row->{abs_number};
    }

    my @new_rows = ( @before, @after );
    return \@new_rows;
  } else {
    return $rows;
  }
}

1;
