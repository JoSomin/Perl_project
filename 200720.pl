
print"\n#1:������12.5 ����?\n";
$pi=3.141592;
$result=2*$pi*12.5;
print $result;

print"\n\n#2:�������� �Է¹ް� ����?\n";
print"������ �Է��Ͻÿ� :";
chomp($radius=<STDIN>);
$result1=2*$pi*$radius;
print $result1;

print"\n\n#3:�������� �Է¹ް� ����? ����ڰ� 0���� �� �Է� �� ���� ���� ���� �ƴ� 0�� �ǵ���\n";
print"������ �Է��Ͻÿ� :";
chomp($radius=<STDIN>);
$result2=2*$pi*$radius;
if($radius<=0){
	$result2=0;
}
print $result2;

print"\n#4:���� �� �� ���� �� �ٿ��� �Է�, �� ���� ���� ��?\n";
print"ù��° ����:";
chomp($number1=<STDIN>);
print"�ι�° ����:";
chomp($number2=<STDIN>);
$result3=$number1 *$number2;
print $result3;

print"\n#5:���ڿ��� ���� ���� �� �ٿ��� �Է�, ������ ����ŭ ���ڿ��� �ٸ� �࿡ ���\n";
print"���ڿ� �Է�:";
#chomp($line=<STDIN>);
$line=<STDIN>;
print"���� �Է�:";
chomp($number3=<STDIN>);
$result4=$line x $number3;
print $result4;

print"\n#5-1:���ڿ��� ���� ���� �� �ٿ��� �Է�, ������ ����ŭ ���ڿ��� �ٸ� �࿡ ���\n";
print"���ڿ� �Է�:";
chomp($line=<STDIN>);
#$line=<STDIN>;
print"���� �Է�:";
chomp($number3=<STDIN>);
$result4=$line x $number3;
print "\n" . $result4;


