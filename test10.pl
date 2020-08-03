use 5.010;
#!/usr/bin/perl   ##혹은 /usr/local/bin/perl

=cut
print "\nch16 #1\n";
my $who_text =`who`;
my @who_lines=`who`;
foreach (`who`){
	my($user, $tty, $date)=/(\S+)\s+(\S+)\s+(.*)/;		#한개이상의공백이 아닌문자, 한개 이상의 공백 문자, 한개이상의공백이 아닌문자, 한개이상의공백문자, 줄바꿈문자제외
	$ttys{$user} .= "$tty at $date\n";
}
print "$ttys\n";


print "\n#2\n";
open F, "find / -atime +90 -size +1000 -print|" or die "fork: $!";
while (<F>){
	chomp;
	printf "%s size %dK last accessed on %s\n",
		$_, (1023 + -s $_)/1024, -A $_;
}



print "\n#3\n";
defined(my $pid =fork) or die "Cannot fork:$!";
unless ($pid){
	#자식 프로세스
	exec "date";
	die "cannot exec date: $!";
}
#부모 프로세스
waitpid($pid, 0);



print "\n#4\n";
sub clean_up{
	unlink glob "$temp_directory/*";
	redir $temp_directory;
}
sub my_int_hendler {
	&clean_up;
	die "interrupted, exiting...\n";
}

my $temp_directory ="/tmp/myprog.$$";		#이 위치에 파일 생성
mkdir $temp_directory, 0700 or die "Cannot create $temp_directory: $1";
$SIG{'INT'}='my_int_handler';
#프로그램 실행 후
#임시 디렉터리에 몇 개의 임시 파일을 만듦
#누군가 컨트롤-C를 누를지도 모름
#평범하게 실행했을 경우 마지막 부분은 아래와 같다.
&clean_up;



print "\n#5\n";
my $int_count;
sub my_int_handler1 {
	$int_count++
}
$SIG{'INT'}='my_int_handler1';
#...
$int_count=0;
while (<SOMEFILE>){
	#...수 초가 걸리는 몇몇 처리 작업...
	if ($int_count){
		print "[processing interruped...\n";
		last;
	}
}
#시그널 핸들러 안에서 처리할 작업을 최소한으로 줄이기, 그렇지 않으면 예상치 못하게 프로그램이 폭발하며 종료될 수 있음



print "\n#6:eval\n";
foreach my $person (qw/fred wilma betty barney dino pebbles/){
	eval {
		open FILE, "<$person"
		or die "Can't open file '$person: $!";
		my($total, $count);
		while(<FILE>){
			$total += $_;
			$count++;
		}
		my $average = $total/$count;
		print "Average for file $person was $average\n";
		
		&do_something($person, $average);
	};
	if($@){
		print "An error occurred ($@), continuing\n";
	}
}




print "\n#7:gerp\n";
my @odd_numbers = grep{$_%2} 1..45;
print "@odd_numbers\n";



print "\n#7-1:gerp\n";
my @odd_numbers1;
foreach(1..37){
	push @odd_numbers1, $_ if $_%2;
}
print "@odd_numbers1\n";



print "\n#7-2\n";
my @matching_lines = grep{/\bfred\b/i}<FILE>;




print "\n#8:map\n";
sub big_money{
	my $number = sprintf "%.2f", shift @_;
	1 while $number =~ s/^(-?\d+)(\d\d\d)/$1,$2/;
	$number =~ s/^(-?)/$1\$/;
	$number;
}
my @data = {4.75, 1.5, 2, 1234, 6.9456, 12345678.9, 29.95};
my @formatted_data= map{&big_money($_)} @data;
print "formatted_data: @formatted_data\ndata: @data";



print "\n#8-1:map\n";
sub big_money1{
	my $number1 = sprintf "%.2f", shift @_;
	1 while $number1 =~ s/^(-?\d+)(\d\d\d)/$1,$2/;
	$number1 =~ s/^(-?)/$1\$/;
	$number1;
}
my @data1 = {4.75, 1.5, 2, 1234, 6.9456, 12345678.9, 29.95};
my @formatted_data1;
foreach $result (@data1){
	push @formatted_data1, &big_money1($result);
}
print "formatted_data1: @formatted_data1\ndata1: @data1";




print "\n#8-2:map\n";
sub big_money2{
	my $number2 = sprintf "%.2f", shift @_;
	1 while $number2 =~ s/^(-?\d+)(\d\d\d)/$1,$2/;
	$number2 =~ s/^(-?)/$1\$/;
	$number2;
}
my @data2 = {4.75, 1.5, 2, 1234, 6.9456, 12345678.9, 29.95};
print "The money numbers are:\n", map{sprintf("%25s\n", &big_money2($_))} @data;


print "\n#8-3\n";
print "Some powers of two are:\n",
	map "\t" . (2**$_) . "\n", 0..15;




print"\n#9:따옴표 없는 해시 키\n";
my %score=(		#볼링점수 해시
barney =>195,
fred => 205,
dino =>30,
);
print "$score{fred}\n";



print"\n#10:슬라이스\n";
my ($card_num, $count)=(split /:/)[1,5];
my ($first, $last)=(split /:/)[0,-1];

#슬라이스의 첨자를 원하는 순서대로 사용하거나 첨자의 값을 반복하는 것 가능
my @names =qw{ zero one two three four five six seven eight nine };
my @numbers = (@names)[9, 0, 2, 1, 0];
print "Bedrock @numbers\n";		#Bedrock nine zero two one zero




print "\n#11:배열 슬라이스\n";
my @names1 =qw{ zero one two three four five six seven eight nine };
#my @numbers1 = @names1[9, 0, 2, 1, 0];		#배열의 원소를 접근하는 다른 표기법
											#@는 '모든 원소', 요소의 목록이 있음을 의미	#$는 무언가 하나가 있다는 의미
##@names[2,5]는 ($names[2], $names[5])와 같다	##슬라이스는 항상 목록이므로 배열 슬라이스 표기시 @사용
print "Besdrock @names1[9,0,2,1,0]\n";




print "\n#12:배열슬라이스\n";
my $new_home_phone="555-6099";
my $new_address = "99380 Red Rock West";
 @items[2, 3]=($new_address, $new_home_phone);
print "@itmes\n";
=cut



print "\n#13:해시슬라이드\n";













