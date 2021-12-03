use strict;
use warnings;

use English;
use utf8;

use feature ':5.30';

# use YAML;

package Gimei::Name;

# cannot use BUILD
# use Class::Accessor 'antlers';
use Moo;
#use Moose;

has kanji => ( is => 'rw' );
#    isa => 'Str' );

sub load {
}

sub BUILD {
    my $self = shift;

    $self->kanji('斎藤 陽菜');
}

1;
