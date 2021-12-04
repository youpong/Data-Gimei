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

has kanji => ( is => 'rw' );
#    isa => 'Str' );

sub load {
#    YAML::LoadFile('data/names.yml');
}

sub BUILD {
    my $self = shift;

    $self->kanji('斎藤 陽菜');
}

package Gimei::Word;
use Moo;
has kanji    => ( is => 'rw' );
has hiragana => ( is => 'rw' );
has katakana => ( is => 'rw' );

1;
