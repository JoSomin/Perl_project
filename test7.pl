use 5.010;

=cut
$filename='fred03.dat';
print"\n#1\n";
 $_="I'm much better\nthan Barney is\nat bowling.\nWilma.\n";
 print "Found 'wilma' at start fo line\n" if /^wilma\b/im;
 open FILE, $filename											#8,9�� : �޿��� ������ ���� �������� ǥ�� ���
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
  

 
 print "\n#4:��Ǯ�� ��� �����-�ӽ÷� ����� ������ ������ ���� ����\n";
 {
 	print "Please enter a number: ";
 	chomp(my $n =<STDIN>);
 	my $root = sqrt $n;	#������ ���
 	print "The square root of $n is $root.\n";
 }
 
 
 print "\n#5\n";
 my $bedrock =42;
 $bedrock++;
 my @people = qw{ fred barney fred wilma dino barney fred pebbles};
 my %count;		#����ִ� ���ο� �ؽ�
 $count{$_}++ foreach @people; 		#�ʿ� �� ���ο� Ű�� �� ����
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
 	foreach (split){		#$_�� �ܾ�� �ɰ��� ������ �Ź� $_�� �Ҵ�
 		$total++;
 		next if /\W/;		#�̻��� �ܾ ������ �ݺ��� ������ �κ� �ǳʶ�
 		$valid++;
 		$count{$_}++;		#������ ������ �ܾ ��
 		##next�� �̰����� ��##
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
 	##redo�� �̰����� ��##
 	print "Type the word '$_': ";
 	chomp(my $try = <STDIN>);
 	if ($try ne $_){
 		print "Sorry - That's not right.\n\n";
 		$errors++;
 		redo;		#�ݺ����� ���� �����
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
 printf "%s", $name;		#���� ���� ���� ���� ���� !���! use of uninitialized value in printf...
 printf "%s", $name // 'null';		#���ǵ��� ���� �� ��� �� ��� �� ���ڿ� ��� ����
 

 
 print "\n\nch.11 #13:�����׽�Ʈ ������\n";
 #chomp($filename=<STDIN>);
 #-e ���� �׽�Ʈ�� �̿��� ���� �̸��� �����ϴ��� Ȯ��
 die "Oops! A file called '$filename' already exists.\n"
	if -e $filename;
	
 #���α׷� ���� ������ ���� �Ǵ� 2�ֿ� �� ���� ���ŵǾ� �־�� �Ѵٸ� ������ ���� 28�� �� ������ ���� �ִ°� Ȯ��
 warn "Config file is looking pretty old!\n"
 	if -M CONFIG > 28;
 	
 #�ý��� ��ũ ������ ���� �� ũ�� �������� ������ ��� �������� �ű��, 100KB���� ū ������ ã�� ��� Ȯ��, �ֱ� 90�ϻ��̿� ���Ͽ� ������ �� �ִٸ� �Űܼ� �ȵ�
 my @original_files =qw/ fred barney betty wilma pebbles dino bamm-bamm /;
 my @big_old_files;		#��� �������� ���� ����
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
 
 		
 		
 		
 		
 		
 		
 		

 
 
 
 
 
 
 
 
 
 
 
 
 