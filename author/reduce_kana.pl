#!/usr/bin/env perl

use strict;
use warnings;

use English;
use utf8;
binmode STDOUT, ":utf8";
use feature ':5.30';


#use File::Path qw(make_path);
use File::Spec;
#use YAML::XS;
use YAML;

# read yml
my $yaml_path = File::Spec->catfile('share', 'names1.yml');
my $names = YAML::LoadFile($yaml_path);

# cut column
say $names->{'last_name'}->[0]->[0];
my $name = $names->{'last_name'}->[0];
say @$name;
pop( @$name );
say @$name;

# store yml
YAML::DumpFile($yaml_path, $names);
