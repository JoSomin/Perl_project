use 5.010;
#!/usr/bin/perl

=cut
print"\nch.12 #1\n";
foreach my $file (glob "*.old"){
	my $newfile = $file;
	$newfile =~ s/\.old$/.new/;		#$는 문자의 끝부분!!
	if(-e $newfile){		#rename은 이미 존재하는 파일을 덮어쓰므로 존재의 유무확인 필요
		warn "can't rename $file to $newfile: $newfile exists\n";
	} elsif (rename $file, $newfile){
		say "success";
	} else {
		warn "rename $file to $newfile failed: $!\n";
	}
}




print "ch.14 #2:index\n";
my $stuff ="Howdy world";
my $where = index($stuff, "wor");
my $where1 = index($stuff, "w");				#2
my $where2 = index($stuff, "w", $where1+1);		#6
my $where3 = index($stuff, "w", $where2+1);		#문자열 일부가 지정한 위치 이후에서 발견되지 않으면 -1 반환
my $last_w = rindex($stuff, "w");		#문자열의 일부가 마지막으로 나타난 곳의 위치 rindex

my $last_slash = rindex("/etc/passwd", "/");	#값은 4
my $fred = "Yabba dabba doo!";					
my $where4 = rindex($fred, "abba");				#7
my $where5 = rindex($fred, "abba", $where4-1);	#1
my $where6 = rindex($fred, "abba",$where5-1);	#-1
print "$where\n$where1\n$where2\n$where3\n$where4\n$where5\n$where6\n";


print "\n#3:substr\n";
#$part = substr($string, $initial_position, $length)	#문자열 값, 0에서 시작하는 최초 위치(index가 반환하는 값과 같음), 부분 문자열 길이
my $mineral = substr("Fred J. Flintstone", 8, 5);		#Flint
my $rock = substr "Fred J. Flintstone", 13, 1000;		#stone	#문자열이 길든 짧든 그보다 짧은 문자열을 얻음
my $pebble = substr "Fred J. Flintstone", 13;			#stone	#문자열 끝까지 얻기를 우너한다면 세 번째 매개변수 생락
my $out = substr("some very long string", -3, 2);		#in
my $long = "some very very long strng";
my $right = substr($long, index($long, "l"));
my $string = "Hello, world! Fred";
substr($string, 0, 5)="Goodbye";		#$string은 이제 "Goodbye, world!"
substr($string, -20) =~ s/fred/barney/g;
my $previous_value = substr($string, 0, 5, "Goodbye");
print "$mineral\n$rock\n$pebble\n$out\n$long\n$right\n$string\n$previous_value\n";



print "\n#4:sprintf\n";
#my $date_tag = sprintf	"%4d/%02d/%02d %2d:%02d:%02d",	$yr, $mo, $da, $h, $m, $s;
#my $money = sprintf "%.2f", 2.49997;
sub big_money {
	my $number = sprintf "%.2f", shift @_;
	
	#아무것도 수행하지 않는 반복문 수행하면서 매번 하나의 쉼표 넣음
	1 while $number =~ s/^(-?\d+)(\d\d\d)/$1, $2/;
	
	#적절한 위치에 달러 기호
	$number =~ s/^(-?)/$1\$/;
	$number;
}
print big_money;


print "\n#5\n";
while ($number =~ s/^(-?\d+)(\d\d\d)/$1,$2/){
	1;
}

print "\n#5-1\n";
'keep looping' while $number =~ s/^(-?\d+)(\d\d\d)/$1,$2/;

=cut

print "\n#6:고급정렬\n";
sub by_number {
	#정렬 사용자 함수는 $a와 $b를 인자로 받았다고 여김
	if ($a < $b) {
		-1
	} elsif ($a>$b){
		1
	} else {
		0
	}
}
my @some_numbers = qw/ 50 56 7 9 8 45 2 98 20 16 57 49 32/;
my @result = sort by_number @some_numbers;
print "@result\n";



print "\n#6-1:고급정렬\n";
sub by_number1 { $a <=> $b }
my @some_numbers1 = qw/ 50 56 7 9 8 45 2 98 20 16 57 49 32/;
my @result1 = sort by_number1 @some_numbers1;
print "@result1\n";


print "\n#6-2:대소문자 구분 없는 정렬";
sub case_insensitive { "\L$a" cmp "\L$b"}

print "\n#6-3:역순정렬1";
my @some_numbers2 = qw/ 50 56 7 9 8 45 2 98 20 16 57 49 32/;
my @descending = reverse sort { $a <=> $b } @some_numbers2;


print "\n#6-4:역순 정렬2";
my @some_numbers3 = qw/ 50 56 7 9 8 45 2 98 20 16 57 49 32/;
my @descending1 = sort { $b <=> $a } @some_numbers3;






































