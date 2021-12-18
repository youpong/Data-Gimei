[![Actions Status](https://github.com/youpong/pl-gimei/workflows/test/badge.svg)](https://github.com/youpong/pl-gimei/actions)
# NAME

Data::Gimei - a Perl port of Ruby's gimei.

# SYNOPSIS

    use Data::Gimei;
    use utf8;
    binmode STDOUT, ":utf8";
    use feature ':5.10';

    my $gimei = Data::Gimei::Name->new();

                                      # an example
    say $gimei->kanji;                # "斎藤 陽菜"
    say $gimei->hiragana;             # "さいとう はるな"
    say $gimei->katakana;             # "サイトウ ハルナ"
    say $gimei->romaji;               # "Haruna Saito"

    say $gimei->last_name->kanji;     # "斎藤"
    say $gimei->last_name->hiragana;  # "さいとう"
    say $gimei->last_name->katakana;  # "サイトウ"
    say $gimei->last_name->romaji;    # "Saito"

    say $gimei->first_name->kanji;    # "陽菜"
    say $gimei->first_name->hiragana; # "はるな"
    say $gimei->first_name->katakana; # "ハルナ"
    say $gimei->first_name->romaji;   # "Haruna"

# DESCRIPTION

This module generates fake data that people's name in Japanese and
supports furigana, phonetic renderings of kanji.

The project name comes from Japanese '偽名' means a false name.

# LICENSE

Copyright (C) NAKAJIMA Yusaku.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

NAKAJIMA Yusaku < example@example.com >
