use 5.010;
use strict;
use warnings;
use utf8;

use Data::Gimei;

use Test2::V0;
use Test2::Tools::Spec;

describe "Data::Gimei::Name" => sub {
    my ( $male, $female );
    before_all setup => sub {
        Data::Gimei::Name::load('t/names.yml');
        $male   = Data::Gimei::Name->new( gender => 'male' );
        $female = Data::Gimei::Name->new( gender => 'female' );
    };

    it "to_s" => sub {
        is $male->to_s,   'male, 佐藤 愛斗, さとう あいと, サトウ アイト, Aito Sato', 'male';
        is $female->to_s, 'female, 佐藤 和柚, さとう わゆ, サトウ ワユ, Wayu Sato', 'female';
    };

    it "getter" => sub {
        is $male->gender,         'male';
        is $male->kanji,          '佐藤 愛斗';
        is $male->hiragana,       'さとう あいと';
        is $male->katakana,       'サトウ アイト';
        is $male->romaji,         'Aito Sato', "romaji() returns capitalized romaji";
        is $male->forename->to_s, '愛斗, あいと, アイト, Aito';
        is $male->surname->to_s,  '佐藤, さとう, サトウ, Sato';
        is $female->gender,       'female';
    };

    it "getter with separator" => sub {
        is $male->kanji('/'),    '佐藤/愛斗';
        is $male->hiragana('/'), 'さとう/あいと';
        is $male->katakana('/'), 'サトウ/アイト';
        is $male->romaji('/'),   'Aito/Sato';
    };
};

done_testing;
