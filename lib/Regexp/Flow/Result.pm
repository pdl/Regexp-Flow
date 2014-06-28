package Regexp::Flow::Result;
use strict;
use warnings;

use Moo;

extends 'Regexp::Result';

use overload
	'0+'=>sub{shift->success}; #~ for some reason \&success does not work here

has success => (
	is => 'rw',
	default => sub{ undef },
);

has continue_action => (
	is => 'rw',
	default => sub{'next'},
);

sub last {
	my $self = shift;
	$self->continue_action('last');
	return $self;
}

has string => (
	is => 'rw',
	default => sub{ undef },
);

has re => (
	is => 'rw',
	default => sub{ undef },
);

1;
