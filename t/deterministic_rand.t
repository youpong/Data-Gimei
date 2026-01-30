# Deterministic random test

use 5.010;
use strict;
use warnings;

use Data::Gimei;
use Test2::V0;
use Test2::Tools::Spec;

describe "Data::Gimei deterministic random test" => sub {
    my @expected;
    my $seed = 42;

    before_each setup => sub {
        Data::Gimei::set_random_seed($seed);
        @expected = ();
        push @expected, Data::Gimei::Name->new();       # Name 1
        push @expected, Data::Gimei::Name->new();       # Name 2
        push @expected, Data::Gimei::Address->new();    # Address 1
    };

    it "same seed generates same result" => sub {
        Data::Gimei::set_random_seed($seed);            # same seed
        is( Data::Gimei::Name->new()->to_s,    shift(@expected)->to_s, "Name 1" );
        is( Data::Gimei::Name->new()->to_s,    shift(@expected)->to_s, "Name 2" );
        is( Data::Gimei::Address->new()->to_s, shift(@expected)->to_s, "Address 1" );
    };

    it "different seed generates different result" => sub {
        Data::Gimei::set_random_seed( $seed + 1 );      # different seed
        isnt( Data::Gimei::Name->new()->to_s,    shift(@expected)->to_s, "Name 1" );
        isnt( Data::Gimei::Name->new()->to_s,    shift(@expected)->to_s, "Name 2" );
        isnt( Data::Gimei::Address->new()->to_s, shift(@expected)->to_s, "Address 1" );
    };

    it "SHOULD NOT depend on calling rand()" => sub {
        Data::Gimei::set_random_seed($seed);
        rand;    # call rand() to change internal state
        is(
            Data::Gimei::Name->new()->to_s,
            shift(@expected)->to_s,
            "Not depending on rand()"
        );
    };
};

done_testing();
