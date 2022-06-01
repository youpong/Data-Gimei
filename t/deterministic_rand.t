# Deterministic random test

use warnings;
use v5.22;

use Test::More;
use Data::Gimei;

my @expected;
Data::Gimei::set_random_seed(42);
push @expected, Data::Gimei::Name->new();
push @expected, Data::Gimei::Address->new();

# Deteministic random returns same result
{
    my @actual;
    Data::Gimei::set_random_seed(42);
    push @actual, Data::Gimei::Name->new();
    push @actual, Data::Gimei::Address->new();

    is_deeply [map {$_->kanji} @expected],[map {$_->kanji} @actual];
}

# Deteministic random SHOULD NOT depend on calling rand()
{
    my @actual;
    Data::Gimei::set_random_seed(42);
    rand;
    push @actual, Data::Gimei::Name->new();
    rand;
    push @actual, Data::Gimei::Address->new();

    is_deeply [map {$_->kanji} @expected],[map {$_->kanji} @actual];
}

done_testing();
