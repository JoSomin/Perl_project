use 5.010;
#!/usr/bin/perl   ##Ȥ�� /usr/local/bin/perl

=cut
print "\nch16 #1\n";
my $who_text =`who`;
my @who_lines=`who`;
foreach (`who`){
	my($user, $tty, $date)=/(\S+)\s+(\S+)\s+(.*)/;		#�Ѱ��̻��ǰ����� �ƴѹ���, �Ѱ� �̻��� ���� ����, �Ѱ��̻��ǰ����� �ƴѹ���, �Ѱ��̻��ǰ��鹮��, �ٹٲ޹�������
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
	#�ڽ� ���μ���
	exec "date";
	die "cannot exec date: $!";
}
#�θ� ���μ���
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

my $temp_directory ="/tmp/myprog.$$";		#�� ��ġ�� ���� ����
mkdir $temp_directory, 0700 or die "Cannot create $temp_directory: $1";
$SIG{'INT'}='my_int_handler';
#���α׷� ���� ��
#�ӽ� ���͸��� �� ���� �ӽ� ������ ����
#������ ��Ʈ��-C�� �������� ��
#����ϰ� �������� ��� ������ �κ��� �Ʒ��� ����.
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
	#...�� �ʰ� �ɸ��� ��� ó�� �۾�...
	if ($int_count){
		print "[processing interruped...\n";
		last;
	}
}
#�ñ׳� �ڵ鷯 �ȿ��� ó���� �۾��� �ּ������� ���̱�, �׷��� ������ ����ġ ���ϰ� ���α׷��� �����ϸ� ����� �� ����



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




print"\n#9:����ǥ ���� �ؽ� Ű\n";
my %score=(		#�������� �ؽ�
barney =>195,
fred => 205,
dino =>30,
);
print "$score{fred}\n";



print"\n#10:�����̽�\n";
my ($card_num, $count)=(split /:/)[1,5];
my ($first, $last)=(split /:/)[0,-1];

#�����̽��� ÷�ڸ� ���ϴ� ������� ����ϰų� ÷���� ���� �ݺ��ϴ� �� ����
my @names =qw{ zero one two three four five six seven eight nine };
my @numbers = (@names)[9, 0, 2, 1, 0];
print "Bedrock @numbers\n";		#Bedrock nine zero two one zero




print "\n#11:�迭 �����̽�\n";
my @names1 =qw{ zero one two three four five six seven eight nine };
#my @numbers1 = @names1[9, 0, 2, 1, 0];		#�迭�� ���Ҹ� �����ϴ� �ٸ� ǥ���
											#@�� '��� ����', ����� ����� ������ �ǹ�	#$�� ���� �ϳ��� �ִٴ� �ǹ�
##@names[2,5]�� ($names[2], $names[5])�� ����	##�����̽��� �׻� ����̹Ƿ� �迭 �����̽� ǥ��� @���
print "Besdrock @names1[9,0,2,1,0]\n";




print "\n#12:�迭�����̽�\n";
my $new_home_phone="555-6099";
my $new_address = "99380 Red Rock West";
 @items[2, 3]=($new_address, $new_home_phone);
print "@itmes\n";
=cut



print "\n#13:�ؽý����̵�\n";













