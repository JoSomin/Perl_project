#o,h,a 가 다 있는 out 파일과 a만 있는 out2파일 diff

use File::Compare;
use Array::Diff;

$fileName="out.txt";
$fileName2="out2.txt";


open(my $FH, '<', $fileName) || die $!;
my @array = <$FH>;

open(my $FH2, '<', $fileName2) || die $!;
my @array2 = <$FH2>;

open FH3, ">", "C:/TEST/project/result.txt"
		or die "$!\n";

#my @array = split ('\n', $plaintext1);
#my @array2 = split ('\n', $plaintext2);  

#Array::Diff
my $diff = Array::Diff->diff(\@array, \@array2);
print "$diff\n---------\n";
#my $cnt = $diff->count;		#다른 요소 개수
my $del = $diff->deleted;		#@array2에 없는 @array 요소 출력

foreach(@{$del}){
#print "@{$del}";
print FH3 $_;
}
close (FH3);

























