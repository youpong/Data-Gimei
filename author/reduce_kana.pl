#!/usr/bin/env perl

# cut katakana from yaml

use strict;
use warnings;

use English;
use utf8;
use open IO => ":utf8";
binmode STDOUT, ":utf8";
use feature ':5.30';

use File::Spec;

# read yml
my $yaml_path = File::Spec->catfile('share', 'names.yml');
open FH, "<", $yaml_path
    or die "Can't open < $yaml_path: $!";

# cut last column
while (<FH>) {
    chomp;
    if (/:$/) {
	print $_ . "\n";
	next;
    }

    s/,[^,]+$/]/;
    print $_ . "\n";
}
