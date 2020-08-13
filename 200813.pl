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


open FH, ">", "C:/TEST/out1.txt"
		or die "$!\n";

my @array = split ('\n', $plaintext1);   

foreach my $oneline (@array){
	$oneline=~s/^\s+|\s+$//g;			#앞뒤공백제거
	#print "$oneline\n";

	if ($oneline=~/\"ID\" : \"(?<ID>\S+)\"/){
		 $ID = $+{ID};
	}
	elsif ($oneline=~/\"cpe23Uri\" : \"(?<cpeApplication>cpe:\d\.\d:a:\S+)\"/){
		if(length($ID)){print FH "$ID\n";}
		$ID="";
		print FH "$+{cpeApplication}\n";
	}
	else{
		#print "debug\n";
	}
}

close (FH);

}

























