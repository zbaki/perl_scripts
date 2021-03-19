#!/usr/bin/perl

#my $pwd = (getpwuid($<))[1];
my $pwd = "baL0hLuhz1Rb6"; 
print"\n my pwd is: $pwd and $< [1]\n";

system "stty -echo";
print "Password: ";
chomp(my $word = <STDIN>);
print("\n word is: $word \n");
print "\n";
system "stty echo";

print(crypt($word, $pwd));

if (crypt($word, $pwd) ne $pwd) {
    die "Sorry...\n";
} 
else {
    print "\nok\n";
}
