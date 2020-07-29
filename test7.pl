use 5.010;

=cut
$filename='fred03.dat';
print"\n#1\n";
 $_="I'm much better\nthan Barney is\nat bowling.\nWilma.\n";
 print "Found 'wilma' at start fo line\n" if /^wilma\b/im;
 open FILE, $filename											#8,9줄 : 펄에서 파일을 여는 관용적인 표현 방법
 	or die "Can't open '$filename' : $!";
 my $lines = join '', <FILE>;
 $lines =~ s/^/$filename: /gm;
 print "$lines\n";

 
 print"\n#2\n";

 chomp(my $date=`date`);
 $^I = ".bak";
 while(<>){
 	s/^Author:.*/Author: Randal L. Schwartz/;
 	s/^Phone:.*\n//;
 	s/^Date:.*/Date: $date/;
 	print;
 }
 #my $date=localtime;

 
 
 print "\n#3\n";
 unless ($mon =~ /^Feb/){
 	print "This month has at least thirty days.\n";
 } else {
 	print "Do you see what's going on here?\n";
 }
 
  print "\n#3-1\n";
  if($mon =~ /^Feb/){
  	print "Do you see what's going on here?\n";
  } else {
  	print "This month has at least thirty days.\n";
  }
  

 
 print "\n#4:노풀된 블록 제어구조-임시로 사용할 렉시컬 변수의 범위 제공\n";
 {
 	print "Please enter a number: ";
 	chomp(my $n =<STDIN>);
 	my $root = sqrt $n;	#제곱근 계산
 	print "The square root of $n is $root.\n";
 }
 
 
 print "\n#5\n";
 my $bedrock =42;
 $bedrock++;
 my @people = qw{ fred barney fred wilma dino barney fred pebbles};
 my %count;		#비어있는 새로운 해시
 $count{$_}++ foreach @people; 		#필요 시 새로운 키와 값 생성
 print "$bedrock\n";
 
 
 print "\n#6\n";
 my @people1 = qw{ fred barney fred wilma dino barney fred pebbles};
 my %seen;
 foreach(@people1){
 	print "I've seen you somewhere before,$_!\n"
 		if $seen{$_}++;
 }
 
 
 print"\n#7\n";		#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 while(<>){
 	foreach (split){		#$_를 단어로 쪼개서 각각을 매번 $_에 할당
 		$total++;
 		next if /\W/;		#이상한 단어가 있으면 반복문 나머지 부분 건너뜀
 		$valid++;
 		$count{$_}++;		#구분한 각각의 단어를 셈
 		##next는 이곳으로 옴##
 	}
 }
 
 print "total things \= $total, valid words = $valid\n";
 foreach $word (sort keys %count){
 	print "$word was seen $count{$word} times.\n";
 }
 
 
 print "\n#8\n";
 my @words=qw{ fred barney fred wilma dino barney fred pebbles};
 my $errors=0;
 foreach (@words){
 	##redo는 이곳으로 옴##
 	print "Type the word '$_': ";
 	chomp(my $try = <STDIN>);
 	if ($try ne $_){
 		print "Sorry - That's not right.\n\n";
 		$errors++;
 		redo;		#반복문의 가장 꼭대기
 	}
 }
 print "You've completed the test, with $errors errors.\n";
 
 
 print "\n#9\n";
 if($dessert{'cake'}&&$dessert{'ice cream'}){
 	print "Hooray! Cake and ice cream\n";
 } elsif ($dessert{'cake'}||$dessert{'ice cream'}){
 	print "That's still good\n";
 } else {
 	print "bb";
 }
 
 
 print "\n#10\n";
 my $Verbose = $ENV{VERBOSE} // 1;
 print "I can talk to you\n" if $Verbose;
 
 
 print "\n#11\n";
 foreach my $try1(0, undef, '0', 1, 25){
 	print "Trying [$try1] ---> ";
 	my $value = $try1 // 'default';
 	say "\tgot [$value]";
 }
 
 
 print "\n#12\n";
 my $name;
 printf "%s", $name;		#값이 없어 정의 되지 않음 !경고! use of uninitialized value in printf...
 printf "%s", $name // 'null';		#정의되자 않은 값 출력 시 대신 빈 문자열 사용 가능
 

 
 print "\n\nch.11 #13:파일테스트 연산자\n";
 #chomp($filename=<STDIN>);
 #-e 파일 테스트를 이용해 파일 이름이 존재하는지 확인
 die "Oops! A file called '$filename' already exists.\n"
	if -e $filename;
	
 #프로그램 설정 파일이 매주 또는 2주에 한 번씩 갱신되어 있어야 한다면 파일을 지난 28일 간 수정한 적이 있는가 확인
 warn "Config file is looking pretty old!\n"
 	if -M CONFIG > 28;
 	
 #시스템 디스크 공간이 가득 차 크고 쓸데없는 파일을 백업 테이프로 옮긴다, 100KB보다 큰 파일을 찾아 목록 확인, 최근 90일사이에 파일에 접근한 적 있다면 옮겨선 안됨
 my @original_files =qw/ fred barney betty wilma pebbles dino bamm-bamm /;
 my @big_old_files;		#백업 테이프에 넣을 파일
 foreach my $filename (@original_files) {
 	push @big_old_files, $filename
 		if -s $filename > 100_000 and -A $filename > 90;
 } 		
=cut		
 		
 		
 print "\n#14\n";
 if(-r $file){
 	print "The file is readable\n";
 }
 lookup( $outher_file );
 if(-w _) {
 	print "The file is writable\n";
 }
 sub lookup {
 	return -w $_[0];
 }
 
 		
 		
 		
 		
 		
 		
 		

 
 
 
 
 
 
 
 
 
 
 
 
 