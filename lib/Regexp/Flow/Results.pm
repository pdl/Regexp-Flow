package Regexp::Flow::Results;
use strict;
use warnings;
use Moo;

use overload
	'0+' => \&count,
	'@{}' => sub {shift->contents}, #~ not sure why, but \&contents dies
	nomethod => \&count
	;

has contents => (
	is => 'rw',
	default => sub {[]},
);

sub count {
	return scalar @{shift->contents};
}

sub success {
	return shift->count ? 1 : 0;
}

1;

