#!/usr/bin/perl

push(@INC, "/home/baki/perl_lib");

require "prime_module.pm";

use strict;
use warnings;

# Display the contents of @INC
warn "\@INC is: ", join(' ', @INC), "\n";

#use My::Math qw(add);
#use Util::Module qw(get_host);

#print add(19, 23);
#print "\n\n";

my $host = &get_host;

print "\n\nThe host name is: $host \n\n";

my $rstr = &get_SBServer('123_test_456');
#my $rstr = &get_SBServer('564_prod');

print "\n Random String is: $rstr \n";

my $rint = &genRandomInt(6);

print "\n random int(6) is: $rint \n";


exit;

