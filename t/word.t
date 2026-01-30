use 5.010;
use strict;
use warnings;
use utf8;

use Data::Gimei;
use Test2::V0;
use Test2::Tools::Spec;

describe "Data::Gimei::Word" => sub {
    my $word;

    before_all setup => sub {

        # 4th args, romaji can be lower case
        $word = Data::Gimei::Word->new( [ '佐藤', 'さとう', 'サトウ', 'sato' ] );
    };

    it "to_s method" => sub {
        is $word->to_s, '佐藤, さとう, サトウ, Sato',
          'returns comma separated string with captialized romaji';
    };

    it "Normal case" => sub {
        is $word->kanji,    '佐藤',   'kanji() returns kanji';
        is $word->hiragana, 'さとう',  'hiragana() returns hiragana';
        is $word->katakana, 'サトウ',  'katakana() returns katakana';
        is $word->romaji,   'Sato', 'romaji() returns capitalized romaji';
    };
};
done_testing;
