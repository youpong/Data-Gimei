use strict;
use warnings;

use English;
use utf8;

use feature ':5.30';

use lib '.';

use Test::More tests => 1;

use Gimei;
ok( 1 );

# TODO: read one record for testing.
my $gimei = Gimei::Name->new();
$gimei->kanji();

#  my $addr = Gimei::Address->new();

#done_testing();
