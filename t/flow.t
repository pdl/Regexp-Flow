use strict;
use warnings;
use Test::More;
use Regexp::Flow 're_matches', 're_substitutions';

subtest 'matches' => sub {
my $count;
re_matches ('abcd', qr/\w/, sub{$count++});
is($count,4, 'code executes');

$count = 0;
re_matches ('abcd', qr/\w/, sub{$count++; shift->last;});
is($count,1, 'last works');

$count = 0;
re_matches ('abcd', qr/\w/, sub{
    $count++;
    my $rr = shift;
    $rr->last if $rr->match eq 'c';
}, 'pg');
is($count,3, 'flags works');
};

subtest substitutions => sub {

my $count = 0;
my $string = 'abcd';
my $modified = re_substitutions ($string, qr/\w/, sub{
    $count++;
    my $rr = shift;
    $rr->last if $rr->match eq 'c';
    'x';
}, 'pg');
is($count,3, 'flags works');
is($string, 'abcd', 'string not modified');
is($modified, 'xxxd', 'modified string');

};
done_testing;


