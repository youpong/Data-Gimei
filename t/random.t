use warnings;
use v5.22;

use Test::More;

use Math::Random;
use Data::Gimei::Random;

{
    my @results;
    my $r = Data::Gimei::Random->new;

    $r->next_int(42);    # must not throw error
}

{
    my @results;
    my $r = Data::Gimei::Random->new;

    $r->set_seed(42);
    push @results, $r->next_int(1024);

    $r->set_seed(42);
    push @results, $r->next_int(1024);
    push @results, $r->next_int(1024);

    is   $results[0], $results[1];
    isnt $results[0], $results[2];
}

{
    my @results;
    my @array = qw(a b c);
    my $r     = Data::Gimei::Random->new;

    $r->set_seed(42);
    push @results, $r->next_sample( \@array );

    random_uniform_integer( 1, 0, 1 );
    rand(1);

    $r->set_seed(42);
    push @results, $r->next_sample( \@array );

    is $results[0], $results[1];
}

done_testing;
