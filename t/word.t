use strict;
use warnings;
use utf8;
use feature ':5.30';
use Test::More tests => 8;

use Data::Gimei;

# call by using named args.
my $word = Data::Gimei::Word->new(kanji    => '田中',
                                  hiragana => 'たなか',
                                  katakana => 'タナカ',
                                  romaji   => 'tanaka'); # lower case
is $word->kanji,    '田中';
is $word->hiragana, 'たなか';
is $word->katakana, 'タナカ';
is $word->romaji,   'Tanaka'; # romaji capitalizes initial char.

# like call by using positional args.
$word = Data::Gimei::Word->new(['鈴木',
                                'すずき',
                                'スズキ',
                                'suzuki']); # lower case
is $word->kanji,    '鈴木';
is $word->hiragana, 'すずき';
is $word->katakana, 'スズキ';
is $word->romaji,   'Suzuki'; # romaji capitalize initial char.
