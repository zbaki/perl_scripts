#!/usr/bin/perl


#use strict; 
#use sigtrap; 
#use Socket; # or IO::Socket 

#my $remote_host = "localhost";
#my $remote_port = "23400"


#use IO::Socket::INET;

#$socket = IO::Socket::INET->new(PeerAddr => $remote_host,
#                                PeerPort => $remote_port, 
#                                Proto    => "tcp", 
#                                Type     => SOCK_STREAM)
#          or die "Couldn't connect to $remote_host:$remote_port : $!\n";

# send something over the socket, 
#print $socket "Why don't you call me anymore?\n"; 
# read the remote answer, 
#$answer = <$socket>; 
# and terminate the connection when we're done. 
#close($socket);


use Socket        # This defines PF_INET and SOCK_STREAM

$port = 12345;    # The unique port used by the sever to listen requests
$server_ip_address = "10.12.12.168";
bind( SOCKET, pack_sockaddr_in($port, inet_aton($server_ip_address)))
   or die "Can't bind to port $port! \n";
