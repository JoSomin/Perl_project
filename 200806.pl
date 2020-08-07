$vulmsg="6000229";
$vulid="600060";

eval{
	
	
$fileName="uname_a";

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
my @oneline;



#foreach ($plaintext1){		
#		s/^\s+//;          # 앞 공백
#    	s/\s+$//;          # 뒤 공백 제거		#s/^\s+|\s+$//g;
#}
#$plaintext1 =~ s/^\s+|\s+$//g;
#print "$plaintext1\n";


#1.array 배열에 한줄씩 넣기 -> split????		
my @array = split ('\n', $plaintext1);   #개행문자는 배열에 저장되지 않음!


#2.array 배열 요소에 접근해서 모두 공백인지 아닌지 판단 후 출력 
foreach my $oneline (@array){
	#$oneline =~ s/^\s+|\s+$//g;				#없어도 똑같이 동작함

	if ($oneline =~ s/^\s*$//g){ next; }
	if ($oneline=~/^linux\s+.+ (\d+\.\d+\.\d+)/i)
	{
		$ver = $1;
	}
	#$verson .= $oneline;				#계속 $oneline을 가져다 씀..
	#print "$oneline\n";
}
print $ver."\n";



#3.펄 내장변수 사용해서 4.4.0 출력하기

#if ($verson =~/(\d+)\.(\d+)\.(\d+)/) { #defined($oneline) && ($oneline =~ m/(\d+)\.(\d+)\.(\d+)/)){
#	
#	print "version is $1.$2.$3\n";
#} else {
#	print "no\n";
#}






#------test line----------------------------------------------

=cut

if ($verson =~ m/(?<version>(\d+)\.(\d+)\.(\d+))/) { 	#이름 지정
	
	print "version is $+{version}\n";
} else {
	print "no\n";
}


foreach (@array){
	$_ =~ s/^\s+|\s+$//g;
	$count ++;
	print "$count)$_\n";
}





#정규표현식 사용			한 줄이 공백임을 어찌알수있는가??????
#\n 기준	->1번에서 해결	

foreach $result (@array){
	
	next if /\B/;		 #전부 공백문자일 때
	$count1 ++;
	print "$count1)$result\n";
}


foreach (@array){
	$_ =~ s/^\s+|\s+$//g;
	if (/\S+/){
				$count1 ++;
		print "$count1)$_|\n";
	} else {

		print "blank\n";
	}
}
=cut



#uname_a의 3번째줄만 출력 / 스페이스는 출력X / foreach continue break



	
	
#------------------------------------------------------------------------------------------------

if($vulflag)
{
    $vulmsg = $vulid."1";
    foreach $result (@vulresult)
    {
        $vulmsg = $vulmsg."\n".$result;
    }
}
else
{
	
	$vulmsg = $vulid."0";
	
	foreach $result (@saferesult)
    {
        $vulmsg = $vulmsg."\n".$result;
    }
}
};
if($@)
{
           $vulmsg=$vulid."9";
           Log($vulmsg);
           Log("$@\n");
}print $vulmsg;