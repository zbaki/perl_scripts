#!/usr/bin/perl -w
###TCP CLIENT:################################################################
#Description: Establishing a Client to communicate with the Server.
#             This can be handy to assine tasks to the Server to 
#             be procced.
#Run:
#    tcp_client.pl localhost 1337
#                  localhost is the client.
#                  1337 is the port number the server is listening on. 
#
# Created by: Khal Baki
# Date: 02/23/2019
##################
# Modification:
# 02/23/2019 - Baki Intial setup.
#
#############################################################################
										
use strict;
use IO::Socket::INET;

my $server = shift;
my $port = shift;

my $socket = IO::Socket::INET->new(
            PeerAddr => $server,
            PeerPort => $port,
            Proto    => 'tcp') || die "Can not connect to $server server \n";

print "Establishing connection to $server:$port\n";

while (<STDIN>) {
      print $socket $_;
      print scalar <$socket>;
}

close $socket || die "Can not connect to server $server \n"; 
