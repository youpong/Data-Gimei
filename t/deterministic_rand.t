# Deterministic random test

use strict; use warnings;
use v5.22;

use Test::More;
use Data::Gimei;

sub compare {
    my ($aref1, $aref2) = @_;

    for (my $i = 0; $i < @$aref1; $i++) {
        is $aref1->[$i]->kanji, $aref2->[$i]->kanji;
    }
}

my ( @expected, @actual );

Data::Gimei::set_random_seed(42);
push @expected, Data::Gimei::Name->new();
push @expected, Data::Gimei::Address->new();

# Deteministic random returns same result
Data::Gimei::set_random_seed(42);
push @actual, Data::Gimei::Name->new();
push @actual, Data::Gimei::Address->new();

#is_deeply \@expected, \@actual;
compare( \@expected, \@actual );

# Deteministic random DOES NOT depend on calling rand()
@actual = ();
Data::Gimei::set_random_seed(42);
rand;
push @actual, Data::Gimei::Name->new();
rand;
push @actual, Data::Gimei::Address->new();

compare( \@expected, \@actual );

done_testing();
