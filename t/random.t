use warnings;
use v5.22;

use Test::More;

use Math::Random;
use Data::Gimei::Random;

{ # default seed
    my @results;
    my $r = Data::Gimei::Random->new;

    $r->next_int(42);    # must not throw error
}

{ # next_int
    my $expected;
    my $r = Data::Gimei::Random->new;

    $r->set_seed(42);
    $expected = $r->next_int(1024);

    $r->set_seed(42);
    is   $r->next_int(1024), $expected;
    isnt $r->next_int(1024), $expected;

    $r->set_seed(546);
    isnt $r->next_int(1024), $expected;
}

{ # calling rand(), random_uniform_integer().
    my @array = qw(a b c);
    my $r     = Data::Gimei::Random->new;

    $r->set_seed(42);
    my $expected = $r->next_sample( \@array );

    random_uniform_integer( 1, 0, 1 );
    rand(1);

    $r->set_seed(42);
    is $r->next_sample( \@array ), $expected;
}

done_testing;
