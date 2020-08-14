#o,h,a 가 다 있는 out 파일과 a만 있는 out2파일 diff한 result 파일과 o,h 만 골라낸 out3 파일 내용이 같은지 비교

use Array::Diff;
use File::Compare;

$fileName="result.txt";
$fileName2="out3.txt";


open(my $FH, '<', $fileName) || die $!;
my @array = <$FH>;

open(my $FH2, '<', $fileName2) || die $!;
my @array2 = <$FH2>;


my $diff = Array::Diff->diff(\@array, \@array2);
#my $cnt = $diff->count;		#다른 요소 개수
my $del = $diff->deleted;		#@array2에 없는 @array 요소 출력

foreach(@{$del}){
#print "@{$del}";
print $_;
}


if(compare($fileName, $fileName2) == 0){
	#두 파일의 내용이 동일
	print "eq\n";
}
else{
	print "debug\n";
}
