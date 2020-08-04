use 5.010;
#!/usr/bin/perl   ##혹은 /usr/local/bin/perl


print "\nch.17 #1:파일에서 한 줄당 한 문자열씩 문자열 목록을 읽고 사용자에게 문자열의 일부를 일치시킬 수 있는 패턴을 입력받는 프로그램, 몇개의 문자열이 일치하는지,
	어느 문자열이 해당하는지 출력, 새로운 패턴 처리위해 파일 새로 읽지X 문자열 메모리에 보관, 패턴 유효하지 않으면 오류 보고 입력 다시 받기, 빈 줄 입력 시 종료\n";

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