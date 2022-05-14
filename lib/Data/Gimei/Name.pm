package Data::Gimei::Name;

use strict; use warnings;
use v5.22;
use Carp;
use File::Share qw( dist_file );
use YAML::XS;

use Class::Tiny qw(
    gender
    first_name
    last_name
);

our $names;

sub BUILDARGS {
    my $class = shift;
    my %args  = @_;

    $names //= load();

    $args{'gender'} //= Data::Gimei::sample( [ 'male', 'female' ] );
    $args{'first_name'} = Data::Gimei::Word->new(
        Data::Gimei::sample( $names->{'first_name'}->{ $args{'gender'} } ) );
    $args{'last_name'} =
        Data::Gimei::Word->new( Data::Gimei::sample( $names->{'last_name'} ) );

    return \%args;
};

sub load {
    my $yaml_path = shift // dist_file( 'Data-Gimei', 'names.yml' );
    -r $yaml_path or Carp::croak("failed to load name data: $yaml_path");

    $names = YAML::XS::LoadFile($yaml_path);
}

sub kanji {
    my $self = shift;
    return $self->last_name->kanji . " " . $self->first_name->kanji;
}

sub hiragana {
    my $self = shift;
    return $self->last_name->hiragana . " " . $self->first_name->hiragana;
}

sub katakana {
    my $self = shift;
    return $self->last_name->katakana . " " . $self->first_name->katakana;
}

sub romaji {
    my $self = shift;
    return $self->first_name->romaji . " " . $self->last_name->romaji;
}

1;
