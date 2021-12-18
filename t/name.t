use strict;
use warnings;

use English;
use utf8;

use feature ':5.30';

use Test::More tests => 12;

use Data::Gimei;

my $word = Data::Gimei::Word->new(kanji => '田中',
				  hiragana => 'たなか',
				  katakana => 'タナカ',
				  romaji   => 'tanaka');
is( $word->kanji,    '田中' );
is( $word->hiragana, 'たなか' );
is( $word->katakana, 'タナカ' );
is( $word->romaji,   'Tanaka' );

$word = Data::Gimei::Word->new(['鈴木', 'すずき', 'スズキ', 'suzuki']);
is( $word->kanji,    '鈴木' );
is( $word->hiragana, 'すずき' );
is( $word->katakana, 'スズキ' );
is( $word->romaji,   'Suzuki' );

Data::Gimei::Name::load('t/names.yml');
my $gimei = Data::Gimei::Name->new(gender => 'male');
is( $gimei->kanji(),    '佐藤 愛斗' );
is( $gimei->hiragana(), 'さとう あいと' );
is( $gimei->katakana(), 'サトウ アイト' );
is( $gimei->romaji(),   'Aito Sato' );
