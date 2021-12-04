use strict;
use warnings;

use English;
use utf8;

use feature ':5.30';

use YAML;

package Gimei::Name;

# cannot use BUILD
# use Class::Accessor 'antlers';
use Moo;
#use Moose;

has gender     => ( is => 'rw' );
has first_name => ( is => 'rw' );
has last_name  => ( is => 'rw' );

sub BUILD {
    my $self = shift;

    my $fn = Gimei::Word->new(kanji => '陽菜', hiragana => 'はるな',   katakana => 'ハルナ');
    my $ln = Gimei::Word->new(kanji => '斎藤', hiragana => 'さいとう', katakana => 'サイトウ');
    $self->first_name($fn);
    $self->last_name($ln);
}

sub load {
#    YAML::LoadFile('data/names.yml');
}

sub kanji {
    my $self = shift;
    return $self->last_name()->kanji . " " . $self->first_name()->kanji;
}

package Gimei::Word;
use Moo;
has kanji    => ( is => 'rw' ); # TODO: ro
has hiragana => ( is => 'rw' ); # TODO: ro
has katakana => ( is => 'rw' ); # TODO: ro

1;
