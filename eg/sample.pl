#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
binmode STDOUT, ":utf8";
use feature ':5.30';

use Data::Gimei;

my $gimei = Data::Gimei::Name->new();
say $gimei->kanji;                # "斎藤陽菜"
say $gimei->hiragana;             # "さいとうはるな"
say $gimei->katakana;             # "サイトウハルナ"
say $gimei->romaji;               # "Haruna Saito"

say $gimei->last_name->kanji;     # "斎藤"
say $gimei->last_name->hiragana;  # "さいとう"
say $gimei->last_name->katakana;  # "サイトウ"
say $gimei->last_name->romaji;    # "Saito"

say $gimei->first_name->kanji;    # "陽菜"
say $gimei->first_name->hiragana; # "はるな"
say $gimei->first_name->katakana; # "ハルナ"
say $gimei->first_name->romaji;   # "Haruna"
