#!/usr/bin/perl -w
###TCP SERVER:################################################################
#Description: This is the Server that will listen on a given Port to the  
#             Client to proccess any tasks.
#Run:
#    tcp_server.pl 1337   #Port number can be any open port.
#
# Created by: Khal Baki
# Date: 02/23/2019
##################
# Modification:
# 02/23/2019 - Baki Intial setup.
#
##############################################################################


use strict;
use IO::Socket::INET;


my $port = shift || die "No port given...\n";
my $socket = IO::Socket::INET->new(
             LocalPort => $port,
             Proto     => 'tcp',
             Listen    => SOMAXCONN) || die "Can not connect \n";

print "Listening for connections on $port \n";

while (my $client = $socket->accept) {
       my $addr = gethostbyaddr($client->peeraddr, AF_INET);
       my $port = $client->peerport;
       while (<$client>) {
             print "[Client: $port] $_";
             print $client "$.: $_";
       }
       close $client || die "Unable to close connection \n";
       die "Can not connect !$ \n";
}









