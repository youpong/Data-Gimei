use strict;
use warnings;

use English;
use utf8;
use feature ':5.30';

use Test::More;

use Data::Gimei;

TODO: {
    local $TODO = "Data::Gimei::set_random() not implemented.";

    Data::Gimei::set_random(42);
    my $gimei0 = Data::Gimei::Name->new();


    Data::Gimei::set_random(42);
    my $gimei1 = Data::Gimei::Name->new();
    rand;
    is $gimei0->kanji, $gimei1->kanji;
}

done_testing();
