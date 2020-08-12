$vulmsg="6000229";
$vulid="600060";

eval{
	
	
$fileName="nvdcve-1.1-2020.json";

open( fileHandle, $fileName ) || print "Cannot open $fileName.\n";
while(<fileHandle>) {
	$plaintext1 .= $_;
}; 
close( fileHandle ); 


# TODO : Add code here ------------------------------------------------------------------------------
$vulmsg=$vulid."0";

my $vulflag=0;
my @vulresult;
my $safeflag=0;
my @saferesult;


open FH, ">>", "C:/TEST/out.txt"
		or die "$!\n";

my @array = split ('\n', $plaintext1);   

foreach my $oneline (@array){
	$oneline=~s/^\s+|\s+$//g;
	#print "$oneline\n";

	if ($oneline=~/\"ID\" : \"(\S+)\"/)
	{
		#print "$oneline\n";
		print FH "$1\n";
	}
	elsif ($oneline=~/\"cpe23Uri\" : \"(\S+)\"/){
		#print "$oneline\n";
		print FH "$1\n";
	}
	else{
		#print "no\n";
	}
}

close (FH);

}

























