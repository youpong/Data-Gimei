# Deterministic random test

use strict;
use warnings;
use feature ':5.30';
use Test::More;
use Data::Gimei;

my (@results, @results2, @results3);

Data::Gimei::set_random_seed(42);
my $name = Data::Gimei::Name->new();
push @results, $name->kanji;
my $address = Data::Gimei::Address->new();
push @results, $address->kanji;

# Deteministic random returns same result
Data::Gimei::set_random_seed(42);
$name = Data::Gimei::Name->new();
push @results2, $name->kanji;
$address = Data::Gimei::Address->new();
push @results2, $address->kanji;
ok Test::More::eq_array(\@results, \@results2);

# Deteministic random DOES NOT depend on calling rand()
Data::Gimei::set_random_seed(42);
rand;
$name = Data::Gimei::Name->new();
push @results3, $name->kanji;
rand;
$address = Data::Gimei::Address->new();
push @results3, $address->kanji;
ok Test::More::eq_array(\@results, \@results3);

done_testing();
