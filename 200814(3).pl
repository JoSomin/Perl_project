#o,h,a �� �� �ִ� out ���ϰ� a�� �ִ� out2���� diff�� result ���ϰ� o,h �� ��� out3 ���� ������ ������ ��

use Array::Diff;
use File::Compare;

$fileName="result.txt";
$fileName2="out3.txt";


open(my $FH, '<', $fileName) || die $!;
my @array = <$FH>;

open(my $FH2, '<', $fileName2) || die $!;
my @array2 = <$FH2>;


my $diff = Array::Diff->diff(\@array, \@array2);
#my $cnt = $diff->count;		#�ٸ� ��� ����
my $del = $diff->deleted;		#@array2�� ���� @array ��� ���

foreach(@{$del}){
#print "@{$del}";
print $_;
}


if(compare($fileName, $fileName2) == 0){
	#�� ������ ������ ����
	print "eq\n";
}
else{
	print "debug\n";
}
