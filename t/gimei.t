
use 5.010;
use strict;
use warnings;

use Data::Gimei;
use Test2::V0;
use Test2::Tools::Spec;

describe "Data::Gimei random functions" => sub {

    it "sample() function" => sub {
        use List::Util qw( any );

        my @arr    = ( 1, 2, 3, 4, 5 );
        my $sample = Data::Gimei::sample( \@arr );

        ok( ( any { $_ == $sample } @arr ), 'returns a random element from the array' );
    };

    it "Deterministic random test" => sub {
        my @arr = ( 1, 2, 3, 4, 5 );

        Data::Gimei::set_random_seed(42);
        my $expected = Data::Gimei::sample( \@arr );

        Data::Gimei::set_random_seed(42);
        my $actual = Data::Gimei::sample( \@arr );

        is $expected, $actual, "same seed generates same result";
    };
};
done_testing;
