use strict;
use warnings;

use English;
use utf8;
use feature ':5.30';

use Test::More;

use Data::Gimei;

Data::Gimei::set_random_seed(42);
my $gimei0 = Data::Gimei::Name->new();

Data::Gimei::set_random_seed(42);
my $gimei1 = Data::Gimei::Name->new();
rand;
is $gimei0->kanji, $gimei1->kanji;

done_testing();
