use strict;
use warnings;

use English;
use utf8;

use feature ':5.30';

use Test::More;
use Data::Gimei;

my $word;

# equals()
my $word_t = $word = Data::Gimei::Word->new(['田中', 'たなか', 'タナカ', 'tanaka']);
my $word_s = $word = Data::Gimei::Word->new(['鈴木', 'すずき', 'スズキ', 'suzuki']);

ok( $word_t->equals($word_t) );
ok( ! $word_t->equals($word_s) );

done_testing();
