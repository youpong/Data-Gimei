package Gimei;

our $VERSION = '0.01';

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

our $names;

has gender     => ( is => 'rw' );
has first_name => ( is => 'rw' );
has last_name  => ( is => 'rw' );

sub sample {
    my $array = shift;
    my $len = @$array;
    return $array->[rand($len)];
}

sub BUILD {
    my $self = shift;

    $names //= load();
    my $fn = sample( $names->{'first_name'}->{'male'} );
    $self->first_name( Gimei::Word->new( $fn ) );
    my $ln = sample( $names->{'last_name'} );
    $self->last_name(  Gimei::Word->new( $ln ) );
}

sub load {
    my $yaml_path = shift // 'data/names.yml';

    $names = YAML::LoadFile($yaml_path);
}

sub kanji {
    my $self = shift;
    return $self->last_name()->kanji . " " . $self->first_name()->kanji;
}

sub hiragana {
    my $self = shift;
    return $self->last_name()->hiragana . " " . $self->first_name()->hiragana;
}

sub katakana {
    my $self = shift;
    return $self->last_name()->katakana . " " . $self->first_name()->katakana;
}

package Gimei::Word;
use Moo;
#use Moose;
has kanji    => ( is => 'rw' ); # TODO: ro
has hiragana => ( is => 'rw' ); # TODO: ro
has katakana => ( is => 'rw' ); # TODO: ro

around BUILDARGS => sub {
    my $orig  = shift;
    my $class = shift;

    if ( 'ARRAY' eq ref $_[0] ) {
        return $class->$orig( kanji    => $_[0]->[0],
                              hiragana => $_[0]->[1],
                              katakana => $_[0]->[2] );
    } else {
        return $class->$orig(@_);
    }
};

1;
