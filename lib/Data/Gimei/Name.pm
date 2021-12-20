package Data::Gimei::Name;

use English;
use utf8;

use feature ':5.30';

our $names;

use File::Share ':all';
use YAML::XS;

use Moo;
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

    $self->gender( sample(['male', 'female']) ) unless $self->gender;

    my $fn = sample( $names->{'first_name'}->{$self->gender} );
    $self->first_name( Data::Gimei::Word->new( $fn ) );

    my $ln = sample( $names->{'last_name'} );
    $self->last_name(  Data::Gimei::Word->new( $ln ) );
}

sub load {
    my $yaml_path = shift // dist_file('Data-Gimei', 'names.yml');

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
