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
#		s/^\s+//;          # �� ����
#    	s/\s+$//;          # �� ���� ����		#s/^\s+|\s+$//g;
#}
#$plaintext1 =~ s/^\s+|\s+$//g;
#print "$plaintext1\n";


#1.array �迭�� ���پ� �ֱ� -> split????		
my @array = split ('\n', $plaintext1);   #���๮�ڴ� �迭�� ������� ����!


#2.array �迭 ��ҿ� �����ؼ� ��� �������� �ƴ��� �Ǵ� �� ��� 
foreach my $oneline (@array){
	#$oneline =~ s/^\s+|\s+$//g;				#��� �Ȱ��� ������

	if ($oneline =~ s/^\s*$//g){ next; }
	if ($oneline=~/^linux\s+.+ (\d+\.\d+\.\d+)/i)
	{
		$ver = $1;
	}
	#$verson .= $oneline;				#��� $oneline�� ������ ��..
	#print "$oneline\n";
}
print $ver."\n";



#3.�� ���庯�� ����ؼ� 4.4.0 ����ϱ�

#if ($verson =~/(\d+)\.(\d+)\.(\d+)/) { #defined($oneline) && ($oneline =~ m/(\d+)\.(\d+)\.(\d+)/)){
#	
#	print "version is $1.$2.$3\n";
#} else {
#	print "no\n";
#}






#------test line----------------------------------------------

=cut

if ($verson =~ m/(?<version>(\d+)\.(\d+)\.(\d+))/) { 	#�̸� ����
	
	print "version is $+{version}\n";
} else {
	print "no\n";
}


foreach (@array){
	$_ =~ s/^\s+|\s+$//g;
	$count ++;
	print "$count)$_\n";
}





#����ǥ���� ���			�� ���� �������� ����˼��ִ°�??????
#\n ����	->1������ �ذ�	

foreach $result (@array){
	
	next if /\B/;		 #���� ���鹮���� ��
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



#uname_a�� 3��°�ٸ� ��� / �����̽��� ���X / foreach continue break



	
	
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