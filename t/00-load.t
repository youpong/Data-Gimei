#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Data::Gimei' ) || print "Bail out!\n";
}

diag( "Testing Data::Gimei $Data::Gimei::VERSION, Perl $], $^X" );
