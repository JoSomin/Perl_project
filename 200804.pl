use 5.010;
#!/usr/bin/perl   ##Ȥ�� /usr/local/bin/perl


print "\nch.17 #1:���Ͽ��� �� �ٴ� �� ���ڿ��� ���ڿ� ����� �а� ����ڿ��� ���ڿ��� �Ϻθ� ��ġ��ų �� �ִ� ������ �Է¹޴� ���α׷�, ��� ���ڿ��� ��ġ�ϴ���,
	��� ���ڿ��� �ش��ϴ��� ���, ���ο� ���� ó������ ���� ���� ����X ���ڿ� �޸𸮿� ����, ���� ��ȿ���� ������ ���� ���� �Է� �ٽ� �ޱ�, �� �� �Է� �� ����\n";

my $filename = 'sample_text';
open FILE, $filename
	or die "Can't open '$filename': $!";
chomp(my @strings = <FILE>);
while (1){
	print "Please enter a pattern: ";
	chomp(my $pattern = <STDIN>);
	last if $pattern =~ /^\s*$/;
	my @matches = eval {
		grep /$pattern/, @strings;
	};
	if ($@) {
		print "Error: $@";
	} else {
		my $count = @matches;
		print "There were $count matching strings:\n",
			map "$_\n", @matches;
	}
	print "\n";
}