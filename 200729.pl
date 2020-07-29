use 5.010; 
#!/usr/bin/perl
use warnings;
use strict;

=cut
print"\n#1:$what에 들어있는 값이 세 번 연속으로 나오는 패턴 작성, $what이 fred라면 패턴은 fredfredfred와 일치, $what이 fred|barney라면 패턴은  fredfredbarney 또는 barneyfredfred, barneybarneybarney etc.\n";
my $what = fred|barney;
while (<>){		#take one input line at a time
	chomp;
	if(/($what){3}/){
		print "Matched: |$`<$&>$'|\n";
	} else {
		print "No match: |$_|\n";
	}
}


print "\n#2:텍스트 파일을 복사해서 수정본을 만드는 프로그램 작성, 복사본에서 모든 Fred 문자열(대소문자 구분 X)은 Larry로 변경, 입력받을 파일 이름은 명령줄 토해 넘김, 파일 이름의 끝은 .out으로 출력파일로 사용";
my $in = $ARGV[0];
unless (defined $in){
	die "Usage: $0 filename";
}

my $out = $in;
$out =~s/(\. \w+)? $/. out/;

unless (open IN, "<$in"){
	die "Can't open '$in': $!;"
}
unless (open OUT, ">$out"){
	die "Can't write '$out': $!;"
}
while (<IN>){
	s/Fred/Larry/gi;
	print OUT $_;
}


print "\n#3:#2에서 Fred는 Wilma로 Wilma는 Fred로 바꾸기, fred&wilma와 같은 입력은 Wilma&Fred로 출력";
while(<IN>){
	chomp;		#chomp를 이용해 줄바꿈 문자를 플레이스홀더를 사용할 수 있게 함 
	s/Fred/\n/gi;	#모든 FRED를 치환
	s/Wilma/Fred/gi;	#모든 WILMA를 치환
	s/\n/Wilma/g;	#플레이스홀터 치환
	print OUT "$_\n";
}


print "\n#4:저작권과 관련한 내용을 쉬뱅(shebang)줄 바로 다음에 추가";
$^I=".bak";		#백업만듬
while(<>){
	if(/^#!/){		#쉬뱅 줄인가?
	
		$_ .= "## Copyright (c) 2020 by yours Truly\n";
	}
	print;
}


print "\nch.10 #4:1부터100사이의 비밀번호 사용자가 맞출때까지 물어보는\n";
my $secret = int(1+rand 100);		#랜덤 숫자 함수 rand
while(1){
	print "Please enter a guess form 1 to 100 ";
	chomp(my $guess=<STDIN>);
	if($guess =~ /quit|exit|^\s*$/i){
		print "Sorry you gave up. The number was $secret.\n";
		last;
	} elsif ($guess < $secret){
		print "Too small. Try again\n";
	} elsif ($guess == $secret){
		print "That was it\n";
		last;
	} else {
		print "Too large. Try again\n";
	}
}


print "\n#5:#4수정, 랜덤비밀번호와 같은 추가적인 디버깅정보 출력, 변경사항 적용 여부 선택, 기능 사용 안할 대 어떠한 경고도 발생X, //연산자 혹은 삼항 연산자 사용\n";
my $Debug = $ENV{DEBUG} // 1;
my $secret1 = int(1+rand 100);		#랜덤 숫자 함수 rand
print "Don't tell anyone, but the secret number is $secret1\n"	if $Debug;
while(1){
	print "Please enter a guess form 1 to 100 ";
	chomp(my $guess1=<STDIN>);
	if($guess1 =~ /quit|exit|^\s*$/i){
		print "Sorry you gave up. The number was $secret1.\n";
		last;
	} elsif ($guess1 < $secret1){
		print "Too small. Try again\n";
	} elsif ($guess1 == $secret1){
		print "That was it\n";
		last;
	} else {
		print "Too large. Try again\n";
	}
}


print "\n#5-1:#4수정, 랜덤비밀번호와 같은 추가적인 디버깅정보 출력, 변경사항 적용 여부 선택, 기능 사용 안할 대 어떠한 경고도 발생X, //연산자 혹은 삼항 연산자 사용\n";
my $Debug2 = defined $ENV{DEBUG} ? $ENV{DEBUG} : 1;
my $secret2 = int(1+rand 100);		#랜덤 숫자 함수 rand
print "Don't tell anyone, but the secret number is $secret2\n"	if $Debug2;
while(1){
	print "Please enter a guess form 1 to 100 ";
	chomp(my $guess2=<STDIN>);
	if($guess2 =~ /quit|exit|^\s*$/i){
		print "Sorry you gave up. The number was $secret2.\n";
		last;
	} elsif ($guess2 < $secret2) {
		print "Too small. Try again\n";
	} elsif ($guess2 == $secret2) {
		print "That was it\n";
		last;
	} else {
		print "Too large. Try again\n";
	}
}


print "\n#6:undefined value, 즉 값을 가지지 않는 환경 변수 출력, 거짓 값을 가진 변수도 올바르게 출력하기, //연산자 혹은 삼항 연산자 사용\n";
$ENV{ZERO}		=0;
$ENV{EMPTY}		='';
$ENV{UNDEFINED}	=undef;

my $longest=0;
foreach my $key(keys %ENV){
	my $key_length = length($key);
	$longest=$key_length if $key_length >$longest;
}
foreach my $key (sort keys %ENV){
	printf "%-${longest}s %s\n", $key, $ENV{$key} // "(undefined)";
}
=cut

print "\n#6-1:undefined value, 즉 값을 가지지 않는 환경 변수 출력, 거짓 값을 가진 변수도 올바르게 출력하기, //연산자 혹은 삼항 연산자 사용\n";
$ENV{ZERO}		=0;
$ENV{EMPTY}		='';
$ENV{UNDEFINED}	=undef;

my $longest=0;
foreach my $key(keys %ENV){
	my $key_length = length($key);
	$longest=$key_length if $key_length >$longest;
}
foreach my $key (sort keys %ENV){
	printf "%-${longest}s %s\n", $key,
		$ENV{$key} ? $ENV{$key} : "(undefined)";
}

