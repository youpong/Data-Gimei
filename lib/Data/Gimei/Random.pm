package Data::Gimei::Random;

# Park & Miller comp.lang.c FAQ list Question 13.15

use warnings;
use v5.22;

# use version; our $VERSION = version->declare("0.0.1");

use Class::Tiny qw (
  seed
);

# TODO: check seed yet?
# new
sub BUILDARGS {
    #my $class = shift;
    #my %args = @_;
    my ( $class, %args ) = @_;

    $args{'seed'} //= time();

    return \%args;
}

# set_seed
sub set_seed {
    my ( $self, $seed ) = @_;
    $self->seed( $seed );
}

# next
sub next {
    my ( $self, $size ) = @_;

    my $next = (48_271 * $self->seed) % (2 << 31 -1);
    $self->seed( $next );

    return $next;
}

# next_int
sub next_int {
    my ( $self, $size ) = @_;

    return $self->next() % $size;
}

# sample
sub sample {
    my ( $self, $aref ) = @_;

    my $index = $self->next_int($#$aref + 1);

    return $aref->[$index];
}
1;
