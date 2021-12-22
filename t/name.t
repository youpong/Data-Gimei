use strict;
use warnings;

use English;
use utf8;

use feature ':5.30';

use Test::More tests => 5;

use Data::Gimei;
Data::Gimei::Name::load('t/names.yml');

my $gimei = Data::Gimei::Name->new(gender => 'male');
is $gimei->kanji,    '佐藤 愛斗';
is $gimei->hiragana, 'さとう あいと';
is $gimei->katakana, 'ヤマダ タロウ';  # direct value from yaml(not conv).
is $gimei->romaji,   'John Smith';     # direct value from yaml(not conv).
is $gimei->gender,   'male';
