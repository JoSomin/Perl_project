
print"\n#1:반지름12.5 원주?\n";
$pi=3.141592;
$result=2*$pi*12.5;
print $result;

print"\n\n#2:반지름값 입력받고 원주?\n";
print"반지름 입력하시오 :";
chomp($radius=<STDIN>);
$result1=2*$pi*$radius;
print $result1;

print"\n\n#3:반지름값 입력받고 원주? 사용자가 0이하 값 입력 시 원주 값을 음수 아닌 0이 되도록\n";
print"반지름 입력하시오 :";
chomp($radius=<STDIN>);
$result2=2*$pi*$radius;
if($radius<=0){
	$result2=0;
}
print $result2;

print"\n#4:숫자 두 개 별도 의 줄에서 입력, 두 숫자 곱한 값?\n";
print"첫번째 숫자:";
chomp($number1=<STDIN>);
print"두번째 숫자:";
chomp($number2=<STDIN>);
$result3=$number1 *$number2;
print $result3;

print"\n#5:문자열과 숫자 별도 의 줄에서 입력, 숫자의 수만큼 문자열을 다른 행에 출력\n";
print"문자열 입력:";
#chomp($line=<STDIN>);
$line=<STDIN>;
print"숫자 입력:";
chomp($number3=<STDIN>);
$result4=$line x $number3;
print $result4;

print"\n#5-1:문자열과 숫자 별도 의 줄에서 입력, 숫자의 수만큼 문자열을 다른 행에 출력\n";
print"문자열 입력:";
chomp($line=<STDIN>);
#$line=<STDIN>;
print"숫자 입력:";
chomp($number3=<STDIN>);
$result4=$line x $number3;
print "\n" . $result4;


