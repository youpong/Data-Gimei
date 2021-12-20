package Data::Gimei::Word;

use English;
use utf8;
use feature ':5.30';

use Moo;
has kanji    => ( is => 'rw' ); # TODO: ro
has hiragana => ( is => 'rw' ); # TODO: ro
has katakana => ( is => 'rw' ); # TODO: ro
has romaji   => ( is => 'rw' ); # TODO: ro

around BUILDARGS => sub {
    my $orig  = shift;
    my $class = shift;

    if ( 'ARRAY' eq ref $_[0] ) {
        return $class->$orig( kanji    => $_[0]->[0],
                              hiragana => $_[0]->[1],
                              katakana => $_[0]->[2],
                              romaji   => ucfirst $_[0]->[3] );
    } else {
        my %args = @_;
        $args{'romaji'} = ucfirst( $args{'romaji'} );
        return $class->$orig(%args);
    }
};

1;
