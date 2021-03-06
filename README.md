[![Actions Status](https://github.com/youpong/pl-gimei/workflows/test/badge.svg)](https://github.com/youpong/pl-gimei/actions)
# NAME

Data::Gimei - a Perl port of Ruby's gimei generates fake data in Japanese.

# SYNOPSIS

    use warnings;
    use v5.22;
    binmode STDOUT, ":utf8";

    use Data::Gimei;
    my $name = Data::Gimei::Name->new();
                                     # for example
    say $name->kanji;                # "斎藤 陽菜"
    say $name->hiragana;             # "さいとう はるな"
    say $name->katakana;             # "サイトウ ハルナ"
    say $name->romaji;               # "Haruna Saito"

    say $name->family->kanji;        # "斎藤"
    say $name->family->hiragana;     # "さいとう"
    say $name->family->katakana;     # "サイトウ"
    say $name->family->romaji;       # "Saito"

    say $name->given->kanji;         # "陽菜"
    say $name->given->hiragana;      # "はるな"
    say $name->given->katakana;      # "ハルナ"
    say $name->given->romaji;        # "Haruna"

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

# DESCRIPTION

This module generates fake data that people's name in Japanese and
supports furigana, phonetic renderings of kanji.

The project name comes from Japanese '偽名' means a false name.

## Deterministic Random

Data::Gimei supports seeding of its pseudo-random number generator to provide deterministic
output of repeated method calls.

    Data::Gimei::set_random_seed(42);
    my $name = Data::Gimei::Name->new();
    $name->kanji;                    # "村瀬 零"
    $address = Data::Gimei::Address->new();
    $address->kanji;                 # "沖縄県那覇市祝子町"

    Data::Gimei::set_random_seed(42);
    my $name = Data::Gimei::Name->new();
    $name->kanji;                    # "村瀬 零"
    rand;                            # Do not change result by calling rand()
    $address = Data::Gimei::Address->new();
    $address->kanji;                 # "沖縄県那覇市祝子町"

# INSTALL

This module is available on CPAN.  You can install this module
by following the step below.

    $ cpanm Data::Gimei

# DOCUMENTATION

After installing, you can find documentation for this module with the
perldoc command.

    $ perldoc Data::Gimei

You can also look for information at:

    GitHub Repository (report bugs here)
        https://github.com/youpong/Data-Gimei

    Search CPAN
        https://metacpan.org/dist/Data-Gimei

# LICENSE

MIT

Dictionary YAML file is generated from naist-jdic.

# AUTHOR

NAKAJIMA Yusaku < youpong@cpan.org >
