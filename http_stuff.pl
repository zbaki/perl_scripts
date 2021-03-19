#!perl




use strict;
use HTTP::Status;
use HTTP::Response;
use LWP::UserAgent;
use URI::URL;
use vars qw($opt_h $opt_r $opt_H $opt_d $opt_p);
use Getopt::Std;
 
my $url;
my $goterr;

getopts('hrHdp:');
my $all = !($opt_r || $opt_H || $opt_d);    # all=1 when -r -H -d not set
 
if ($opt_h || $#ARGV==-1) {  # print help text when -h or no args
  print_help( );
  exit(0);
}

my $goterr = 0;  # make sure we clear the error flag
 
while ($url = shift @ARGV) {
 
  my ($code, $desc, $headers, $body)=simple_get('GET', $url, $opt_p);
  if ($opt_r || $all) { print "HTTP/1.0 $code $desc\n"; }
  if ($opt_H || $all) { print "$headers\n";             }
  if ($opt_d || $all) { print $body;                    }
 
  $goterr |= HTTP::Status::is_error($code);
}
 
exit($goterr);



sub print_help {
  print <<"HELP";
usage: $0 [-hrmbp] [proxy URL] URLs
 
 -h help
 -r response line only
 -H HTTP header data only
 -d data from entity body
 -p use this proxy server
 
Example:  $0 -p http://proxy:8080/ http://www.ora.com
 
HELP
}

sub simple_get( ) {
 
  my ($method, $path, $proxy) = @_;
 
# Create a User Agent object
  my $ua = new LWP::UserAgent;
  $ua->agent("hcat/1.0");
 
# If proxy server specified, define it in the User Agent object
  if (defined $proxy) {
    my $url = new URI::URL $path;
    my $scheme = $url->scheme;
    $ua->proxy($scheme, $proxy);
  }
 
# Ask the User Agent object to request a URL.
# Results go into the response object (HTTP::Reponse).
 
  my $request = new HTTP::Request($method, $path);
  my $response = $ua->request($request);
 
# Parse/convert the response object for "easier reading"
 
  my $code=$response->code;
  my $desc = HTTP::Status::status_message($code);
  my $headers=$response->headers_as_string;
 
  my $body =  $response->content;
  $body =  $response->error_as_HTML if ($response->is_error);
 
  return ($code, $desc, $headers, $body);
}

