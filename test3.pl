use 5.010;

=cut
print "\n#1\n";
while(defined($line=<STDIN>)){
	print "i saw $line";
}


print "\n#1-1\n";
while (<STDIN>){
	print "i saw $_";
}


print "\n#1-2:비효율적\n";
foreach(<STDIN>){
	print "i saw $_";
}


print "\n#2\n";
@ARGV=qw/ larry moe curly /;
while (<>){
	chomp;
	print "it was $_ that i saw n some stooge-like file\n";
}
=cut

print "\n#3\n";
@array=qw/ red blue green yellow pink /;
print @array;
print "\n";
print "@array";


print "\n#4\n";
print ("hello world\n");
print "hello world\n";


print "\n#5\n";
print (2+3);	print"\n";
print (2+3)*4;


print "\n#6\n";
