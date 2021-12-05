use strict;
use warnings;

use English;
use utf8;

use feature ':5.30';

use lib '.';

use Test::More tests => 4;

use Gimei;

my $word = Gimei::Word->new(kanji => '斎藤', hiragana => 'さいとう', katakana => 'サイトウ');
is( $word->kanji,    '斎藤');
is( $word->hiragana, 'さいとう');
is( $word->katakana, 'サイトウ');

Gimei::Name::load('t/names.yml');
my $gimei = Gimei::Name->new();
is( $gimei->kanji(), '佐藤 愛斗' );

#  my $addr = Gimei::Address->new();

#done_testing();
