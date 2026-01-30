use 5.010;
use strict;
use warnings;
use utf8;

use Data::Gimei;
Data::Gimei::Address::load('t/addresses.yml');

use Test2::V0;
use Test2::Tools::Spec;

describe "Data::Gimei::Address" => sub {
    my ($addr);
    before_all setup => sub {
        $addr = Data::Gimei::Address->new();
    };

    it "to_s" => sub {
        is $addr->to_s,
            '北海道 札幌市中央区 モエレ沼公園, '
          . 'ほっかいどう さっぽろしちゅうおうく もえれぬまこうえん, '
          . 'ホッカイドウ サッポロシチュウオウク モエレヌマコウエン';
    };

    it "getter" => sub {
        is $addr->kanji,    '北海道札幌市中央区モエレ沼公園';
        is $addr->hiragana, 'ほっかいどうさっぽろしちゅうおうくもえれぬまこうえん';
        is $addr->katakana, 'ホッカイドウサッポロシチュウオウクモエレヌマコウエン';
        ok !$addr->can('romaji'), 'Address doesn\'t define method romaji().';

        is $addr->prefecture->to_s,   '北海道, ほっかいどう, ホッカイドウ, ', 'prefecture';
        is $addr->prefecture->romaji, undef;
        is $addr->city->to_s,         '札幌市中央区, さっぽろしちゅうおうく, サッポロシチュウオウク, ', 'city';
        is $addr->city->romaji,       undef;
        is $addr->town->to_s,         'モエレ沼公園, もえれぬまこうえん, モエレヌマコウエン, ', 'town';
        is $addr->town->romaji,       undef;
    };

    it "getter with separator" => sub {
        is $addr->kanji('/'),    '北海道/札幌市中央区/モエレ沼公園';
        is $addr->hiragana('/'), 'ほっかいどう/さっぽろしちゅうおうく/もえれぬまこうえん';
        is $addr->katakana('/'), 'ホッカイドウ/サッポロシチュウオウク/モエレヌマコウエン';
    };
};
done_testing;
