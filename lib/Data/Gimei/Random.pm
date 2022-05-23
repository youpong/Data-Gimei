package Data::Gimei::Random;

use strict;
use warnings;
use v5.22;

use Math::Random;

use Class::Tiny qw(
   seed
);

sub set_random_seed {
    my ($self, $seed) = @_;

    random_set_seed_from_phrase($seed);
    my @seed = random_get_seed();

    $self->seed( \@seed );
}

sub random {
    my ($self, $size) = @_;

    if (!$self->seed) {
        $self->set_random_seed(time);
    }

    random_set_seed(@{$self->seed});

    my $ret = random_uniform_integer(1, 0, $size);

    my @seed = random_get_seed();
    $self->seed( \@seed );

    return $ret;
}

sub sample {
    my ($self, $array_ref) = @_;

    my $len = @$array_ref;
    my $index = $self->random( $len );

    return $array_ref->[ $index ];
}

1;
