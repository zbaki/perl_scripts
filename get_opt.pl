#!/usr/bin/perl


use Getopt::Std;

getopts('dn:a:');

if($opt_d)
{
  print "Debugging mode\n";
}

print "\n\n Hello World ... \n" if($opt_d);

if(!$opt_n && !$opt_a)
{
  print "USAGE:\n\texample6 [-d] -n name -a age\n";
  exit;
}

else
{
  if($opt_d)
  {
    print "Forming string\n";
  }

  $output = "$opt_n is $opt_a years old\n";
  print $output;
}


exit;
