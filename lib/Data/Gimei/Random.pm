package Data::Gimei::Random;

use strict;
use warnings;
use v5.22;

use Math::Random;

use Class::Tiny qw(
   seed
);

sub set_seed {
    my ($self, $seed) = @_;

    random_set_seed_from_phrase($seed);
    my @seed = random_get_seed();

    $self->seed( \@seed );
}

# todo: rewrite with permuted_index
sub next_int {
    my ($self, $size) = @_;

    if (!$self->seed) {
        $self->set_seed(13 * (time % 2 ** 26));
    }

    random_set_seed(@{$self->seed});

    my $ret = random_uniform_integer(1, 0, $size);

    my @seed = random_get_seed();
    $self->seed( \@seed );

    return $ret;
}

sub next_sample {
    my ($self, $array_ref) = @_;

    my $len = @$array_ref;
    my $index = $self->next_int( $len );

    return $array_ref->[ $index ];
}

1;
