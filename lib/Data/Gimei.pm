package Data::Gimei;

use version 0.77; our $VERSION = version->declare("v0.0.3");

use Data::Gimei::Name;
use Data::Gimei::Address;
use Data::Gimei::Word;

sub set_random {
    # to be implmented.
}

sub sample {
    my $array = shift;
    my $len = @$array;
    return $array->[rand($len)];
}
1;

=encoding utf-8

=head1 NAME

Data::Gimei - a Perl port of Ruby's gimei.

=head1 SYNOPSIS

  use utf8;
  binmode STDOUT, ":utf8";
  use feature ':5.30';

  use Data::Gimei;
  my $name = Data::Gimei::Name->new();
                                   # for example
  say $name->kanji;                # "斎藤 陽菜"
  say $name->hiragana;             # "さいとう はるな"
  say $name->katakana;             # "サイトウ ハルナ"
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

  my $addr = Data::Gimei::Address->new();
  say $addr->kanji;                # "北海道札幌市中央区モエレ沼公園"
  say $addr->hiragana;             # "ほっかいどうさっぽろしちゅうおうくもえれぬまこうえん"
  say $addr->katakana;             # "ホッカイドウサッポロシチュウオウクモエレヌマコウエン"

  say $addr->prefecture->kanji;    # "北海道"
  say $addr->prefecture->hiragana; # "ほっかいどう"
  say $addr->prefecture->katakana; # "ホッカイドウ"

  say $addr->city->kanji;          # "札幌市中央区"
  say $addr->city->hiragana;       # "さっぽろしちゅうおうく"
  say $addr->city->katakana;       # "サッポロシチュウオウク"

  say $addr->town->kanji;          # "モエレ沼公園"
  say $addr->town->hiragana;       # "もえれぬまこうえん"
  say $addr->town->katakana;       # "モエレヌマコウエン"

=head1 DESCRIPTION

This module generates fake data that people's name in Japanese and
supports furigana, phonetic renderings of kanji.

The project name comes from Japanese '偽名' means a false name.

=head1 INSTALL

This module is not available at CPAN yet.  You can install this module
by following the step below.

  $ cpanm Data-Gimei-v0.0.2.tar.gz

=head1 LICENSE

Copyright (C) NAKAJIMA Yusaku.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

NAKAJIMA Yusaku E<lt> example@example.com E<gt>

=cut
