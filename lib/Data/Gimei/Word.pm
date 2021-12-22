package Data::Gimei::Word;

use English;
use utf8;
use feature ':5.30';

use Lingua::JA::Moji 'kana2romaji';

use Moo;
use namespace::clean;

has kanji    => ( is => 'ro' );
has hiragana => ( is => 'ro' );
has katakana => ( is => 'ro' );
has romaji   => ( is => 'ro' );

around BUILDARGS => sub {
    my $orig  = shift;
    my $class = shift;

    my %args;
    if ( 'ARRAY' eq ref $_[0] ) {
        %args = ( kanji    => $_[0]->[0],
                  hiragana => $_[0]->[1],
                  katakana => $_[0]->[2],
                  romaji   => $_[0]->[3] );
    } else {
        %args = @_;
    }

    if (!$args{'romaji'}) {
        $args{'romaji'} = kana2romaji($args{'hiragana'}, {style => 'common', ve_type=>'none'});
    }
    $args{'romaji'} = ucfirst( $args{'romaji'} );
    return $class->$orig(%args);
};

sub equals {
    my $self   = shift;
    my $target = shift;

    return $self->kanji    eq $target->kanji    &&
           $self->hiragana eq $target->hiragana &&
           $self->katakana eq $target->katakana &&
           $self->romaji   eq $target->romaji;
}
1;
