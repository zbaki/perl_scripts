#!/usr/bin/perl

#use lib '/home/baki/perl_lib';

push(@INC, "/home/baki/perl_lib");

require Module;

#use strict;
#use warnings;
 
#use My::Math qw(add);
#use Util::Module qw(get_host);
 
#print add(19, 23);
#print "\n\n";

my $host = Module::get_host();

print "\n\nThe host name is: $host \n\n";



exit;
