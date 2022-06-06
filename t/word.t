use warnings;
use v5.22;
use utf8;

use Data::Gimei;
use Test::More;

{    # to_s
    my $w = Data::Gimei::Word->new( [ '佐藤', 'さとう', 'サトウ', 'sato' ] );
    is $w->to_s, '佐藤, さとう, サトウ, Sato';
}

{    # call by using named args.
    my $w = Data::Gimei::Word->new(
        kanji    => '田中',
        hiragana => 'たなか',
        katakana => 'タナカ',
        romaji   => 'tanaka'
    );    # args romaji can be lower case
    is $w->kanji,    '田中';
    is $w->hiragana, 'たなか';
    is $w->katakana, 'タナカ';
    is $w->romaji,   'Tanaka';    # romaji capitalizes initial char.
}

{    # like call by using positional args.

    # 4th args, romaji can be lower case
    my $w = Data::Gimei::Word->new( [ '鈴木', 'すずき', 'スズキ', 'suzuki' ] );

    is $w->kanji,    '鈴木';
    is $w->hiragana, 'すずき';
    is $w->katakana, 'スズキ';
    is $w->romaji,   'Suzuki';    # romaji capitalize initial char.
}

done_testing;
