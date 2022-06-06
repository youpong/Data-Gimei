package Data::Gimei::Name;

use warnings;
use v5.22;
use Carp;
use File::Share qw( dist_file );
use YAML::XS;

use Class::Tiny qw(
  gender
  given
  family
);

our $names;

sub load {
    my $yaml_path = shift // dist_file( 'Data-Gimei', 'names.yml' );
    Carp::croak("failed to load name data: $yaml_path") unless -r $yaml_path;

    $names = YAML::XS::LoadFile($yaml_path);
}

sub BUILDARGS {
    my $class = shift;
    my %args  = @_;

    $names //= load();

    $args{'gender'} //= Data::Gimei::sample( [ 'male', 'female' ] );
    $args{'given'} = Data::Gimei::Word->new(
        Data::Gimei::sample( $names->{'first_name'}->{ $args{'gender'} } ) );
    $args{'family'} =
      Data::Gimei::Word->new( Data::Gimei::sample( $names->{'last_name'} ) );

    return \%args;
}

sub to_s {
    my $self = shift;

    return sprintf( "%s, %s, %s, %s, %s",
        $self->gender, $self->kanji, $self->hiragana, $self->katakana, $self->romaji );
}

sub kanji {
    my $self = shift;
    return join ' ', map {$_->kanji} ( $self->family, $self->given );
}

sub hiragana {
    my $self = shift;
    return join ' ', map {$_->hiragana} ( $self->family, $self->given );
}

sub katakana {
    my $self = shift;
    return join ' ', map {$_->katakana} ( $self->family, $self->given );
}

sub romaji {
    my $self = shift;
    return join ' ', map {$_->romaji} ( $self->given, $self->family );
}

1;
