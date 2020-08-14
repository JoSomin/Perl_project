# o,h 만 골라낸 즉, a 삭제한

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


my $ID;
my $o;

open FH, ">", "C:/TEST/project/out3.txt"
		or die "$!\n";

my @array = split ('\n', $plaintext1);   

foreach my $oneline (@array){
	$oneline=~s/^\s+|\s+$//g;			#앞뒤공백제거

	if ($oneline=~/\"ID\" : \"(?<ID>\S+)\"/){
		 $ID = $+{ID};
	}
	elsif ($oneline=~/\"cpe23Uri\" : \"(?<cpeApplication_o>cpe:\d\.\d:o:\S+)\"/){
		if(length($ID)){print FH "$ID\n";}
		$ID="";
		$o = $+{cpeApplication_o};
		print FH "$o\n";
	}
	elsif ($oneline=~/\"cpe23Uri\" : \"(?<cpeApplication_h>cpe:\d\.\d:h:\S+)\"/){
		if(length($ID)){print FH "$ID\n";}
		$ID="";
		#if(length($o)){print "$o\n";}
		#$o="";
		print FH "$+{cpeApplication_h}\n";
	}
	else{
		#print "debug\n";
	}
}

close (FH);

}

























