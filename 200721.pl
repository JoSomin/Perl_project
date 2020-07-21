=cut
print "\n#1:�Է��� ������ �ٷ� ���е� ���ڿ� ����� �о�, �� ����� �������� ���(�Է³���ȣ�� ��Ʈ��-z)\n";
chomp(@text=<STDIN>);
@reverse_text=reverse @text;
print @reverse_text;

print "\n#1-1:�Է��� ������ �ٷ� ���е� ���ڿ� ����� �о�, �� ����� �������� ���(�Է³���ȣ�� ��Ʈ��-z)\n";
@text=<STDIN>;
print reverse @text;

print "\n#1-2:�Է��� ������ �ٷ� ���е� ���ڿ� ����� �о�, �� ����� �������� ���(�Է³���ȣ�� ��Ʈ��-z)\n";
print reverse <STDIN>;

print "\n#2:�Է��� ������ �ٷ� ���е� ���� ����� �а� �־��� ������� ���� �� ���ڿ� �����ϴ� ����� �̸��� ���(�Է³���ȣ�� ��Ʈ��-z)\n";
@list =qw/ fred betty barney dino wilma pebbles bamm-bamm /;
chomp($number=<STDIN>);
while($number!=0){
	print $list[$number-1];
}


print "\n#2-1:�Է��� ������ �ٷ� ���е� ���� ����� �а� �־��� ������� ���� �� ���ڿ� �����ϴ� ����� �̸��� ���(�Է³���ȣ�� ��Ʈ��-z)\n";
@list =qw/ fred betty barney dino wilma pebbles bamm-bamm /;
chomp(@number=<STDIN>);
foreach (@number){
	print "$list[$_-1]\n";
}


print "\n#3:�Է��� ������ �ٷ� ���е� ���ڿ� ����� �а� �ƽ�Ű���� ������ ���, �ϳ��� �ٷ�\n";
chomp(@line=<STDIN>);
@sorted_line = sort @line;
print "@sorted_line\n";

print "\n#3-1:�Է��� ������ �ٷ� ���е� ���ڿ� ����� �а� �ƽ�Ű���� ������ ���, ���� �ٷ�\n";
print sort <STDIN>;



print "\n#4:���ڸ�� ���� ��ȯ total �ۼ�\n";
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


print "\n#5:���ڸ���� ���ڷ� �޾� ��� ������ ū ������ ��ȯ�ϴ� &above_average �Լ� �ۼ�\n";
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


print "\n#5-1:���ڸ���� ���ڷ� �޾� ��� ������ ū ������ ��ȯ�ϴ� &above_average �Լ� �ۼ�\n";
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


print "\n#6:���ڷ� �Է��� �̸��� ������� ȯ�� �λ縦 �ϵ� �������� �λ��� ����� �̸��� ���� ���;���\n";
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