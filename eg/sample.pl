#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
binmode STDOUT, ":utf8";

use Data::Gimei;

my $gimei = Data::Gimei::Name->new();
print $gimei->kanji;              # "斎藤陽菜"
print $gimei->hiragana;           # "さいとうはるな"
print $gimei->katakana;           # "サイトウハルナ"

print $gimei->last_name->kanji;   # "斎藤"
print $gimei->first_name->kanji;  # "陽菜"
