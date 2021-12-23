#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
binmode STDOUT, ":utf8";
use feature ':5.30';

use Data::Gimei;
my $name = Data::Gimei::Name->new();
                                 # for example
say $name->kanji;                # "斎藤陽菜"
say $name->hiragana;             # "さいとうはるな"
say $name->katakana;             # "サイトウハルナ"
say $name->romaji;               # "Haruna Saito"

say $name->last_name->kanji;     # "斎藤"
say $name->last_name->hiragana;  # "さいとう"
say $name->last_name->katakana;  # "サイトウ"
say $name->last_name->romaji;    # "Saito"

say $name->first_name->kanji;    # "陽菜"
say $name->first_name->hiragana; # "はるな"
say $name->first_name->katakana; # "ハルナ"
say $name->first_name->romaji;   # "Haruna"

say $name->gender;               # "female"
