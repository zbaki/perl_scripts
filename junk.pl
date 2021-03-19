#!/usr/bin/perl

#Reading a Matrix from a File.
##############################

sub matrix_read_file {
my $filename = shift;
print "Filename: $filename \n";
#my ($filename) = @_;
open (F, $filename) || die "Could not open $filename: $!";
while ($line = <F>) {
chomp($line);
print "line: $line \n";
next if $line =~ /^\s*$/; # skip blank lines
if ($line =~ /^([A-Za-z]\w*)/) {
$matrix_name = $1;
} else {
my (@row) = split (/\s+/, $line);
push (@{$matrix_name}, \@row); # insert the row-array into
# the outer matrix array
}
}
}

matrix_read_file("/home/baki/perl_scripts/get_opt.pl");

close(F);

##############################################################
#$rarray = \@array;
#
#push (@array , "a", 1, 3); 
#push (@$rarray, "a", 1, 2);
#
#$i = 2;
#print $array[$i] ; # Accessing single elements
#print "\n\n";
#print $$rarray[1]; # Indexing indirectly through a
                   # reference: array replaced by $rarray
#############################################################

# Initialising some hexadecimal values and 
# Calling the hex function 
#$A = hex D; 
#$B = hex af;

# Getting the equivalent decimal number 
# of the given hexadecimal number 
#print "$A\n"; 
#print "$B\n"; 
#############################################

print "################################# \n";
$num = "065";
$char = sprintf("%c", $num);                # slower than chr($num)
#printf("Number %d is character %c\n", $num, $num); #Another way of printing the content.
print "The Number $num is Character $char in ASCII Code.\n";

#print "Lets try to convert a whole string ... \n";
#@ascii_character_numbers = unpack("C*", "Hello");
@ascii_character_numbers = unpack("C*", "SAMPLE");
#@ascii_character_numbers = unpack("C*", "ABCD");
print "@ascii_character_numbers\n";
#######################################################
$word = pack("C*", @ascii_character_numbers);
$word = pack("C*", 115, 97, 109, 112, 108, 101);   # same
print "Got: $word\n";
#######################################################

print "################################# \n";

use Data::Dump;

my @accts_split;
my @accts  = (23 .. 257);
my $start  =  0;
my $length =  @accts / 10;
print "The Length: $length \n";

for my $i (0 .. 9)
{
    my $end = ($i == 9) ? $#accts : $start + $length - 1;
print "The end is: $end \n";
    @{$accts_split[$i]} = @accts[$start .. $end];
    $start += $length;
}

dd @accts_split;





exit;
