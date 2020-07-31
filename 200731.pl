use 5.010;
#!/usr/bin/perl

=cut
print "\nch.14 #1:숫자 목록 읽은 후 숫자 정렬, 오른쪽 정렬 출력 (17 1000 04 1.50 3.141592 ?10 1.5 4 2001 90210 666)\n";
my @numbers;
push @numbers, split while <>;
foreach (sort {$a <=> $b} @numbers) {
	printf "%20g\n", $_;
}


print "\nch.14 #1-1:숫자 목록 읽은 후 숫자 정렬, 오른쪽 정렬 출력 (17 1000 04 1.50 3.141592 ?10 1.5 4 2001 90210 666)\n";
my @numbers1;
while (<>) {
	push @numbers1, split;
	printf "%20g\n", @numbers1;
}


print "\n#2:해시자료 대소문자 구분 없이 성을 알파벳 순서로 정렬해 출력, 성이 같을 시 이름 정렬\n";
# This is the hash of first and last names to be used in the
# case-insensitive sorting exercise at the end of Chapter 15, Strings
# and Sorting. Copy this text into your program, or edit this file and
# save it under a new name.

my %last_name = qw{ 
	fred flintstone Wilma Flintstone Barney Rubble
	betty rubble Bamm-Bamm Rubble PEBBLES FLINTSTONE
};
my @keys =sort {
	"\L$last_name{$a}" cmp "\L$last_name{$b}"			#by last name
	or
	"\L$a" cmp "\L$b"									#by first name
} keys %last_name;

foreach (@keys) {
	print "$last_name{$_}, $_\n"						#Rubble, Bamm-Bamm
}


print "\n#3:문자열 조사하여 부분 문자열이 나타나는 모든 곳을 찾아 해당 위치 출력, this is a test일때 is의 위치는 2와5\n";
print "Please enter a string: ";
chomp(my $string =<STDIN>);
print "Please enter a substing: ";
chomp(my $sub=<STDIN>);

my @places;
for (my $pos =-1; ;){
	$pos = index($string, $sub, $pos+1);
	last if $pos ==-1;
	push @places, $pos;
}
print "Locations of '$sub' in '$string' were: @places\n";


print "\n#3-1:문자열 조사하여 부분 문자열이 나타나는 모든 곳을 찾아 해당 위치 출력, this is a test일때 is의 위치는 2와5\n";
print "Please enter a string: ";
chomp(my $string1 =<STDIN>);
print "Please enter a substing: ";
chomp(my $sub1=<STDIN>);

my @places1;
{
	my $pos1=-1;
	while(1){
		$pos1 = index($string1, $sub1, $pos1+1);
		last if $pos1 ==-1;
		push @places1, $pos1;
	}
}
print "Locations of '$sub1' in '$string1' were: @places1\n";




print "\nch.15 #4:숫자 추측 프로그램을 given을 사용해 작성, 똑똑한 일치 사용 필요X\n";		#200729 #4참고
my $Verbose = $ENV{VERBOSE}//1;
my $secret = int(1+rand 100);
print "Don't tell anyone, but the secret number is $secret.\n"
	if $Verbose;
LOOP: {
	print "Please enter a guess form 1 to 100 : ";
	chomp (my $guess=<STDIN>);
	my $found_it=0;
	given($guess){
		when (!/^\d+$/)	{say "Not a number"}
		when ($_>$secret)	{say "Too high"}
		when ($_<$secret)	{say "Too low"}
		default				{say "Just right"; $found_it++}
	}
	last LOOP if $found_it;
	redo LOOP;
}


print "\n#5:숫자를 입력받아 3으로 나누어지면 Fizz, 5는 Bin, 7은 Sausage, given-when 구문 사용\n";
for(1..105){
	my $what='';
	given($_){
		when (not $_%3){$what .=' Fizz'; continue}
		when (not $_%5){$what .=' Bin'; continue}
		when (not $_%7){$what .=' Sausage'; continue}
	}
	say "$_$what";
}


print "\n#6:명령줄에서 파일 목록을 입력받아 각각의 파일이 읽기, 쓰기, 실행 가능 여부 출력, for-when구문 사용\n";
for (@ARGV){
	say "Processing $_";
	#for 블록에서when을 직접 사용이 가능하므로 given 필요X
	when(! -e) {say "\tFile does not exist!"}		#첫 번째 when블록 실행 시 파일 없음을 보고하고 해당 플록의 수행 멈추고 나머지when테스트 실행
	when(-r _) {say "\tReadable"; continue}			#파일 읽기 권한 테스트, 특수가상파일핸들러 _ , 마지막 파일에 대한 캐시된 stat을 사용, continue로 다음 when 시도
	when(-w _) {say "\tWritable"; continue}
	when(-x _) {say "\tExcutable"; continue}
}
=cut

=cut
open(TEXT, "fred03.dat.txt");
while(<TEXT>){
	$line =$_;
	@result=split/;/,$line;
	foreach(@result){
		print $_."\n";
	}
}
=cut

=cut
print "\n#7:명령줄에서 지정한 숫자의 모든 약수(1과자신제외)출력, given과 똑똑한 일치 사용, 소수라면 숫자가 소수임을 알리기, 숫자가 아니면 오류 출력하고 나누기 연산X\n";
sub divisors{
	my $number=shift;
	my @divisors =();
	foreach my $divisor (2...$number/2){
		push @divisors, $divisor unless $number % $divisor;
	}
	return @divisors;
}
say "Checking the number <$ARGV[0]>";
given($ARGV[0]){
	when(!/^\d+$/){say "Not a number"}
	my @divisors = divisors($_);
	my @empty;
	when (@divisors ~~ @empty){say "Number is prime"}
	default {say "$_is divisible by @divisors"}
}
=cut


print "\n#8:#7수정, 홀수?짝수?소수?다른 숫자로 나누어지는지?, 똑똑한일치 사용\n";
sub divisors {
	my $number = shift;		#사용자가 파일 이름 하나를 명령행에 적을 것을 예상하는 경우 => my $filename = shift or die "Usage: $0 FILENAME\n""
	my @divisors=();
	foreach my $divisor (2..($ARGV[0]/2+1)){
		push @divisors, $divisor unless $number % $divisor;
	}
	return @divisors;
}

say "Checking the number <$ARGV[0]>";
my $favorite =42;
given($ARGV[0]){
	when(!/^\d+$/) {say "Not a number"}
	my @divisors = divisors($ARGV[0]);
	
	when (@divisors ~~ 2){		#2 is in @divisors
		say "$_ is even";
		continue;
	}
	when (!(@divisors ~~2)){	#2 isn't in @divisors
		say "$_ is odd";
		continue;
	}
	when (@divisors ~~ $favorite){
		say "$_ is divisible by my favorite number";
		continue;
	}
	when ($favorite){
		say "$_ is my favorite number";
		continue;
	}
	
	my @empty;
	when (@divisors ~~ @empty){
		say "Number is prime"
	}
	default {
		say "$_ is divisible by @divisors"
	}
}
































