use strict;
use warnings;

use English;
use utf8;

use feature ':5.30';

use Test::More tests => 9;

use Data::Gimei;

my $word = Data::Gimei::Word->new(kanji => '斎藤',
				  hiragana => 'さいとう',
				  katakana => 'サイトウ');
is( $word->kanji,    '斎藤');
is( $word->hiragana, 'さいとう');
is( $word->katakana, 'サイトウ');

$word = Data::Gimei::Word->new(['斎藤', 'さいとう', 'サイトウ']);
is( $word->kanji,    '斎藤');
is( $word->hiragana, 'さいとう');
is( $word->katakana, 'サイトウ');


Data::Gimei::Name::load('t/names.yml');
my $gimei = Data::Gimei::Name->new();
is( $gimei->kanji(),    '佐藤 愛斗' );
is( $gimei->hiragana(), 'さとう あいと' );
is( $gimei->katakana(), 'サトウ アイト' );
