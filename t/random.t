use strict; use warnings;
use v5.22;

use Test::More;

use Math::Random;
use Data::Gimei::Random;

{
    my $r = Data::Gimei::Random->new;

    $r->set_random_seed(42);
    my $previous = $r->random(1024);

    $r->set_random_seed(42);
    is $r->random(1024), $previous;
}

{
    my @array = qw(a b c);
    my $r = Data::Gimei::Random->new;

    $r->set_random_seed(42);
    my $previous = $r->sample( \@array );

    random_uniform_integer(1, 0, @array);
    rand(@array);

    $r->set_random_seed(42);
    is $r->sample( \@array ), $previous;
}

done_testing;
