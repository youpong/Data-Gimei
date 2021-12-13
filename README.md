[![Actions Status](https://github.com/youpong/pl-gimei/workflows/test/badge.svg)](https://github.com/youpong/pl-gimei/actions)
# NAME

Data::Gimei - a Perl port of Ruby's gimei.

# SYNOPSIS

    use Data::Gimei;

    my $gimei = Data::Gimei::Name->new();

                                      # an example
    print $gimei->kanji;              # "斎藤陽菜"
    print $gimei->hiragana;           # "さいとうはるな"
    print $gimei->katakana;           # "サイトウハルナ"

    print $gimei->last_name->kanji;   # "斎藤"
    print $gimei->first_name->kanji;  # "陽菜"

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
