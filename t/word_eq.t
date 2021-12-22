use strict;
use warnings;

use English;
use utf8;

use feature ':5.30';

use Test::More;
use Data::Gimei;

my $word;

# test Word->equals()
my $word_t = Data::Gimei::Word->new(['田中', 'たなか', 'タナカ', 'tanaka']);

ok  $word_t->equals(Data::Gimei::Word->new(['田中', 'たなか', 'タナカ', 'tanaka']));
ok !$word_t->equals(Data::Gimei::Word->new(['鈴木', 'すずき', 'スズキ', 'suzuki']));

done_testing();
