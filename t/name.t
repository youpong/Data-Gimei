use warnings;
use v5.22;
use utf8;

use Data::Gimei;
Data::Gimei::Name::load('t/names.yml');

use Test::More;

{ # to_s
    my $name = Data::Gimei::Name->new( gender => 'male' );
    is $name->to_s, 'male, 佐藤 愛斗, さとう あいと, サトウ アイト, Aito Sato';
}

{
    my $name = Data::Gimei::Name->new( gender => 'male' );
    is $name->kanji,    '佐藤 愛斗';
    is $name->hiragana, 'さとう あいと';
    is $name->katakana, 'サトウ アイト';
    is $name->romaji,   'Aito Sato';
    is $name->gender,   'male';

    is $name->given->kanji,    '愛斗';
    is $name->given->hiragana, 'あいと';
    is $name->given->katakana, 'アイト';
    is $name->given->romaji,   'Aito';

    is $name->family->kanji,    '佐藤';
    is $name->family->hiragana, 'さとう';
    is $name->family->katakana, 'サトウ';
    is $name->family->romaji,   'Sato';
}

{
    my $name = Data::Gimei::Name->new( gender => 'female' );
    is $name->gender, 'female';
}

done_testing;
