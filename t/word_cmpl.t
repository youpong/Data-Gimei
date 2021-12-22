use strict;
use warnings;

use English;
use utf8;

use feature ':5.30';

use Test::More;
use Data::Gimei;

my $word;

# romaji omitted
my $word_s = $word = Data::Gimei::Word->new(['鈴木', 'すずき', 'スズキ', 'suzuki']);

# keyword params case NULL string
$word = Data::Gimei::Word->new(kanji    => '鈴木',
                               hiragana => 'すずき',
                               katakana => 'スズキ',
                               romaji   => '');
ok( $word_s->equals($word) );

# keywword params case param omitted
$word = Data::Gimei::Word->new(kanji    => '鈴木',
                               hiragana => 'すずき',
                               katakana => 'スズキ');
ok( $word_s->equals($word) );

# aref params case NULL string
$word = Data::Gimei::Word->new(['鈴木', 'すずき', 'スズキ', '']);
ok( $word_s->equals($word) );

# aref params case param omitted
$word = Data::Gimei::Word->new(['鈴木', 'すずき', 'スズキ']);
ok( $word_s->equals($word) );


#
done_testing();
