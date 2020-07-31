use 5.010;
#!/usr/bin/perl

=cut
print "\nch.14 #1:���� ��� ���� �� ���� ����, ������ ���� ��� (17 1000 04 1.50 3.141592 ?10 1.5 4 2001 90210 666)\n";
my @numbers;
push @numbers, split while <>;
foreach (sort {$a <=> $b} @numbers) {
	printf "%20g\n", $_;
}


print "\nch.14 #1-1:���� ��� ���� �� ���� ����, ������ ���� ��� (17 1000 04 1.50 3.141592 ?10 1.5 4 2001 90210 666)\n";
my @numbers1;
while (<>) {
	push @numbers1, split;
	printf "%20g\n", @numbers1;
}


print "\n#2:�ؽ��ڷ� ��ҹ��� ���� ���� ���� ���ĺ� ������ ������ ���, ���� ���� �� �̸� ����\n";
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


print "\n#3:���ڿ� �����Ͽ� �κ� ���ڿ��� ��Ÿ���� ��� ���� ã�� �ش� ��ġ ���, this is a test�϶� is�� ��ġ�� 2��5\n";
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


print "\n#3-1:���ڿ� �����Ͽ� �κ� ���ڿ��� ��Ÿ���� ��� ���� ã�� �ش� ��ġ ���, this is a test�϶� is�� ��ġ�� 2��5\n";
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




print "\nch.15 #4:���� ���� ���α׷��� given�� ����� �ۼ�, �ȶ��� ��ġ ��� �ʿ�X\n";		#200729 #4����
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


print "\n#5:���ڸ� �Է¹޾� 3���� ���������� Fizz, 5�� Bin, 7�� Sausage, given-when ���� ���\n";
for(1..105){
	my $what='';
	given($_){
		when (not $_%3){$what .=' Fizz'; continue}
		when (not $_%5){$what .=' Bin'; continue}
		when (not $_%7){$what .=' Sausage'; continue}
	}
	say "$_$what";
}


print "\n#6:����ٿ��� ���� ����� �Է¹޾� ������ ������ �б�, ����, ���� ���� ���� ���, for-when���� ���\n";
for (@ARGV){
	say "Processing $_";
	#for ��Ͽ���when�� ���� ����� �����ϹǷ� given �ʿ�X
	when(! -e) {say "\tFile does not exist!"}		#ù ��° when��� ���� �� ���� ������ �����ϰ� �ش� �÷��� ���� ���߰� ������when�׽�Ʈ ����
	when(-r _) {say "\tReadable"; continue}			#���� �б� ���� �׽�Ʈ, Ư�����������ڵ鷯 _ , ������ ���Ͽ� ���� ĳ�õ� stat�� ���, continue�� ���� when �õ�
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
print "\n#7:����ٿ��� ������ ������ ��� ���(1���ڽ�����)���, given�� �ȶ��� ��ġ ���, �Ҽ���� ���ڰ� �Ҽ����� �˸���, ���ڰ� �ƴϸ� ���� ����ϰ� ������ ����X\n";
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


print "\n#8:#7����, Ȧ��?¦��?�Ҽ�?�ٸ� ���ڷ� ������������?, �ȶ�����ġ ���\n";
sub divisors {
	my $number = shift;		#����ڰ� ���� �̸� �ϳ��� ����࿡ ���� ���� �����ϴ� ��� => my $filename = shift or die "Usage: $0 FILENAME\n""
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
































