use strict;
use warnings;

use English;
use utf8;

use feature ':5.30';

use lib '.';

use Test::More tests => 3;

use Gimei;

my $word = Gimei::Word->new(kanji => '斎藤', hiragana => 'さいとう', katakana => 'サイトウ');
is( $word->kanji,    '斎藤');
is( $word->hiragana, 'さいとう');
is( $word->katakana, 'サイトウ');

# TODO: read one record for testing.
my $gimei = Gimei::Name->new();
$gimei->kanji();

#  my $addr = Gimei::Address->new();

#done_testing();
