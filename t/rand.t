use strict;
use warnings;

use English;
use utf8;
use feature ':5.30';

use Test::More;

use Data::Gimei;

my @results;
Data::Gimei::set_random_seed(42);
my $name = Data::Gimei::Name->new();
$results[0] = $name->kanji;
my $address = Data::Gimei::Address->new();
$results[1] = $address->kanji;

Data::Gimei::set_random_seed(42);
rand; # should not change result by calling rand()
$name = Data::Gimei::Name->new();
is $results[0], $name->kanji;
rand; # should not change result by calling rand()
$address = Data::Gimei::Address->new();
is $results[1], $address->kanji;

done_testing();
