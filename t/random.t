use 5.010;
use strict;
use warnings;

use Data::Gimei::Random;

use Test2::Bundle::More;

subtest "omitted seed" => sub {
    my $r = Data::Gimei::Random->new;  # default seed: time()

    ok defined($r->seed), 'seed is initialized';
    ok defined($r->next_int(42)), 'next_int() returns a value';
};

subtest "initialized with single argument (seed)" => sub {
    my $seed = 42;
    my $r = Data::Gimei::Random->new($seed);  # set seed

    is $r->seed, $seed, 'seed is initialized';
    ok defined($r->next_int(42)), 'next_int() returns a value';
};

subtest "initialized with named argument (seed)" => sub {
    my $seed = 42;
    my $r = Data::Gimei::Random->new(seed => $seed);  # set seed

    is $r->seed, $seed, 'seed is initialized';
    ok defined($r->next_int(42)), 'next_int() returns a value';
};

subtest "set_seed() method" => sub {
    my $seed = 42;
    my $r = Data::Gimei::Random->new($seed + 1);  # different seed

    isnt $r->seed, $seed, 'initial seed is different'; 
    $r->set_seed($seed);
    is $r->seed, $seed, 'set_seed() sets seed correctly';
};

subtest "Deterministic output of next_int() method" => sub {
    my ($seed, $size) = (42, 1024);

    my $r = Data::Gimei::Random->new($seed);
    my $expected = $r->next_int($size);

    $r->set_seed($seed);
    is $r->next_int($size), $expected, 'produces deterministic output';
};

subtest "sample() method" => sub {
    use List::Util qw( any );

    my $r = Data::Gimei::Random->new(42);
    my @arr = ( 1, 2, 3, 4, 5 );

    ok( (any { $r->sample(\@arr) == $_ } @arr),
      'sample() method returns an element from the array');
};
done_testing;
