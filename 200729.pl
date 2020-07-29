use 5.010; 
#!/usr/bin/perl
use warnings;
use strict;

=cut
print"\n#1:$what�� ����ִ� ���� �� �� �������� ������ ���� �ۼ�, $what�� fred��� ������ fredfredfred�� ��ġ, $what�� fred|barney��� ������  fredfredbarney �Ǵ� barneyfredfred, barneybarneybarney etc.\n";
my $what = fred|barney;
while (<>){		#take one input line at a time
	chomp;
	if(/($what){3}/){
		print "Matched: |$`<$&>$'|\n";
	} else {
		print "No match: |$_|\n";
	}
}


print "\n#2:�ؽ�Ʈ ������ �����ؼ� �������� ����� ���α׷� �ۼ�, ���纻���� ��� Fred ���ڿ�(��ҹ��� ���� X)�� Larry�� ����, �Է¹��� ���� �̸��� ����� ���� �ѱ�, ���� �̸��� ���� .out���� ������Ϸ� ���";
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


print "\n#3:#2���� Fred�� Wilma�� Wilma�� Fred�� �ٲٱ�, fred&wilma�� ���� �Է��� Wilma&Fred�� ���";
while(<IN>){
	chomp;		#chomp�� �̿��� �ٹٲ� ���ڸ� �÷��̽�Ȧ���� ����� �� �ְ� �� 
	s/Fred/\n/gi;	#��� FRED�� ġȯ
	s/Wilma/Fred/gi;	#��� WILMA�� ġȯ
	s/\n/Wilma/g;	#�÷��̽�Ȧ�� ġȯ
	print OUT "$_\n";
}


print "\n#4:���۱ǰ� ������ ������ ����(shebang)�� �ٷ� ������ �߰�";
$^I=".bak";		#�������
while(<>){
	if(/^#!/){		#���� ���ΰ�?
	
		$_ .= "## Copyright (c) 2020 by yours Truly\n";
	}
	print;
}


print "\nch.10 #4:1����100������ ��й�ȣ ����ڰ� ���⶧���� �����\n";
my $secret = int(1+rand 100);		#���� ���� �Լ� rand
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


print "\n#5:#4����, ������й�ȣ�� ���� �߰����� ��������� ���, ������� ���� ���� ����, ��� ��� ���� �� ��� ��� �߻�X, //������ Ȥ�� ���� ������ ���\n";
my $Debug = $ENV{DEBUG} // 1;
my $secret1 = int(1+rand 100);		#���� ���� �Լ� rand
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


print "\n#5-1:#4����, ������й�ȣ�� ���� �߰����� ��������� ���, ������� ���� ���� ����, ��� ��� ���� �� ��� ��� �߻�X, //������ Ȥ�� ���� ������ ���\n";
my $Debug2 = defined $ENV{DEBUG} ? $ENV{DEBUG} : 1;
my $secret2 = int(1+rand 100);		#���� ���� �Լ� rand
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


print "\n#6:undefined value, �� ���� ������ �ʴ� ȯ�� ���� ���, ���� ���� ���� ������ �ùٸ��� ����ϱ�, //������ Ȥ�� ���� ������ ���\n";
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

print "\n#6-1:undefined value, �� ���� ������ �ʴ� ȯ�� ���� ���, ���� ���� ���� ������ �ùٸ��� ����ϱ�, //������ Ȥ�� ���� ������ ���\n";
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

