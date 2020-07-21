=cut
print "\n#1:입력의 끝까지 줄로 구분된 문자열 목록을 읽어, 그 목록을 역순으로 출력(입력끝신호는 컨트롤-z)\n";
chomp(@text=<STDIN>);
@reverse_text=reverse @text;
print @reverse_text;

print "\n#1-1:입력의 끝까지 줄로 구분된 문자열 목록을 읽어, 그 목록을 역순으로 출력(입력끝신호는 컨트롤-z)\n";
@text=<STDIN>;
print reverse @text;

print "\n#1-2:입력의 끝까지 줄로 구분된 문자열 목록을 읽어, 그 목록을 역순으로 출력(입력끝신호는 컨트롤-z)\n";
print reverse <STDIN>;

print "\n#2:입력의 끝까지 줄로 구분된 숫자 목록을 읽고 주어진 목록으로 부터 각 숫자에 대응하는 사람의 이름을 출력(입력끝신호는 컨트롤-z)\n";
@list =qw/ fred betty barney dino wilma pebbles bamm-bamm /;
chomp($number=<STDIN>);
while($number!=0){
	print $list[$number-1];
}


print "\n#2-1:입력의 끝까지 줄로 구분된 숫자 목록을 읽고 주어진 목록으로 부터 각 숫자에 대응하는 사람의 이름을 출력(입력끝신호는 컨트롤-z)\n";
@list =qw/ fred betty barney dino wilma pebbles bamm-bamm /;
chomp(@number=<STDIN>);
foreach (@number){
	print "$list[$_-1]\n";
}


print "\n#3:입력의 끝까지 줄로 구분된 문자열 목록을 읽고 아스키문자 순서로 출력, 하나의 줄로\n";
chomp(@line=<STDIN>);
@sorted_line = sort @line;
print "@sorted_line\n";

print "\n#3-1:입력의 끝까지 줄로 구분된 문자열 목록을 읽고 아스키문자 순서로 출력, 여러 줄로\n";
print sort <STDIN>;



print "\n#4:숫자목록 총합 반환 total 작성\n";
sub total{
	my $sum;
	foreach (@_){
		$sum += $_;
	}
	return $sum;
}
my @fred = qw{1 3 5 7 9};
my $fred_total = total(@fred);
print "the total of \@fred is $fred_total\n";
print "enter some numbers on separate lines: ";
my $user_total = total(1..100);
print "the total of those numbers is $user_total\n";
=cut


print "\n#5:숫자목록을 인자로 받아 평균 값보다 큰 값들을 반환하는 &above_average 함수 작성\n";
use 5.010;
sub total1{
	my $sum;
	foreach (@_){
		$sum += $_;
	}
	return $sum;
}
sub average{
	&total1/(@_);
}
sub above_average{
	foreach (@_){
		if($_ > &average){
			push @list, $_;
		}
	}
	print "result : @list\n";
}
above_average(1..10);


print "\n#5-1:숫자목록을 인자로 받아 평균 값보다 큰 값들을 반환하는 &above_average 함수 작성\n";
sub total2{
	my $sum;
	foreach (@_){
		$sum += $_;
	}
	$sum;
}
sub average1{
	if(@_==0) {return}
	my $count=@_;
	my $sum=total2(@_);
	$sum/$count;
}
sub above_average1{
	my $average = average1(@_);
	my @list;
	foreach my $element(@_){
		if($element > $average){
			push @list, $element;
		}
	}
	@list;
}

my @fred = above_average1(1..10);
print "\@fred is @fred\n";
print "(should be 6 7 8 9 10)\n";
my @barney = above_average1(100, 1..10);
print "\@barney is @barney\n";
print "(should be just 100)\n";


print "\n#6:인자로 입력한 이름의 사람에게 환영 인사를 하되 마지막에 인사한 사람의 이름도 같이 나와야함\n";
use 5.010;

sub greet{
	state $last_person;
	my $name=shift;
	print "Hi $name! ";
	if(defined $last_person){
		print "$last_person is also here!\n";
	} else {
		print "you are the first one here\n";
	}
	$last_person=$name;
}

greet('Fred');
greet('Barney');


print "\n#7\n";
use 5.010;

sub greet1{
	state @names;
	my $name = shift;
	print "hi $name! ";
	if(@names){
		print "I've seen: @names\n";
	} else {
		print "you are the first on here!\n";
	}
	push @names, $name;
}

greet1('Fred');
greet1('Barney');
greet1('Wilma');
greet1('Betty');