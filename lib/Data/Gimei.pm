package Data::Gimei;

use version 0.77; our $VERSION = version->declare("v0.0.2");

=encoding utf-8

=head1 NAME

Data::Gimei - a Perl port of Ruby's gimei.

=head1 SYNOPSIS

  use Data::Gimei;
  use utf8;
  binmode STDOUT, ":utf8";
  use feature ':5.10';

  my $gimei = Data::Gimei::Name->new();

                                    # an example
  say $gimei->kanji;                # "斎藤 陽菜"
  say $gimei->hiragana;             # "さいとう はるな"
  say $gimei->katakana;             # "サイトウ ハルナ"
  say $gimei->romaji;               # "Haruna Saito"

  say $gimei->last_name->kanji;     # "斎藤"
  say $gimei->last_name->hiragana;  # "さいとう"
  say $gimei->last_name->katakana;  # "サイトウ"
  say $gimei->last_name->romaji;    # "Saito"

  say $gimei->first_name->kanji;    # "陽菜"
  say $gimei->first_name->hiragana; # "はるな"
  say $gimei->first_name->katakana; # "ハルナ"
  say $gimei->first_name->romaji;   # "Haruna"

=head1 DESCRIPTION

This module generates fake data that people's name in Japanese and
supports furigana, phonetic renderings of kanji.

The project name comes from Japanese '偽名' means a false name.

=head1 INSTALL

This module is not available at CPAN yet.  You can install this module
by following the step below.

$ cpanm Data-Gimei-v0.0.2.tar.gz

=head1 LICENSE

Copyright (C) NAKAJIMA Yusaku.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

NAKAJIMA Yusaku E<lt> example@example.com E<gt>

=cut

use strict;
use warnings;
use English;
use utf8;

use feature ':5.30';

package Data::Gimei::Name;

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

package Data::Gimei::Word;
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
