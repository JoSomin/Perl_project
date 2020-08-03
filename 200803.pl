use 5.010;
#!/usr/bin/perl   ##혹은 /usr/local/bin/perl

=cut
print "\n#1:루트 디렉터리와같은 특정 디렉터리로 바꾸는 프로그램, ls-l:그 디렉터리에서 긴 포맷 디렉터리 리스팅을 얻는 명령어 실행\n";
chdir "/" or die "Can't chdir to root directory: $!";
exec "ls", "-l" or die "Can't exec ls: $!";



print "\n#2:#1수정, 현대 디렉터리에서 ls.out 파일에 명령어 출력물 보내기, 에러 출력물은 ls.err라는 파일로 (빈채로 끝날것)\n";
#첫 번째, 두 번째 줄은 현재 디렉터리의 파일로 다시 염 그리고 디렉터리가 변경된 다음 디렉터리의 내용물을 출력하는 명령어 실행하고 이전 디렉터리에 연 파일에 데이터 저장
open STDOUT, ">ls.out" or die "Can't write to ls.out: $!";
open STDERR, ">ls.err" or die "Can't write to ls.err: $!";

chdir "/" or die "Can't chdir to root directory: $!";
exec "ls", "-l" or die "Can't exec ls: $!";
#마지막 die가 출력한 메시지는 ls.err로 	why?)그 시점에 STDERR이 ls.err을 가리키고 있기 때문
#chdir의 die 또한 ls.err로 메시지 보냄
#두 번째 줄에서 STDERR을 다시 열지 못하면 예전의 STDERR로 감
#세 개의 파일 핸들을 다시 여는 것에 실패했다면 예전 파일 핸들이 그대로 열려 있음
=cut


print "\n#3:현재 날짜 결정위해 date명령어 출력물 파싱하는 프로그램, 주중이라면 get to work, 주말이면 get play 출력, 월요일이면 Mon, date명령어가 없다면 가장의 문자열출력 프로그램 만들기\n";
if ('date' =~ /^S/) {
	print "go play!\n";
} else {
	print "get to work\n";
}