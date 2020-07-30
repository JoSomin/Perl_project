use 5.010;
#!/usr/bin/perl

=cut
print"\nch.12 #1:명령줄에서 입력한 파일 이름 인자로 받아 각 파일이 읽기,쓰기,실행이 가능한지 존재하지 않는지 보고하는 프로그램\n";;
foreach my $file (@ARGV){
	my $attribs = &attrivutes($file);
	print "'file' $attribs.\n";
}
sub attributes {
	#주어진 파일들의 속성 보고
	my $file = shift @_;
	return "does not exist" unless -e $file;
	
	my @attrib;
	push @attrib, "readable" if -r $file;
	push @attrib, "writable" if -w $file;
	push @attrib, "executalbe" if -x $file;
	return "exists" unless @attrib;
	'is ' . join " and ", @attrib;		#반환값
}


print "\n#2:명령줄에서 입력한 파일 중 가장 오래된 파일을 찾아내 나이가 며칠인지 보고, 목록이 비어있다면?\n";
die "No file names supplied\n" unless @ARGV;
my $oldest_name = shift @ARGV;
my $oldest_age = -M $oldest_name;

foreach (@ARGV){
	my $age = -M;
	($oldest_name, $oldest_age)=($_, $age)
		if $age > $oldest_age;
}
printf "The oldest file was %s, and it was %. if days old\n", $oldest_name, $oldest_age;



print "\n#3:쌓아놓은(stacked)파일 테스트 연산자 이용, 명령줄에서 입력한 파일중 소유자가 사용자이며 읽기, 쓰기가 가능한 파일들 나열\n";
say "Looking for my files that are readable and writable";
die "No files specifed\n" unless @ARGV;
foreach my $file (@ARGV){
	say "$file is readable and writable" if -o -r -w $file;
}


print "\n#3-1:쌓아놓은(stacked)파일 테스트 연산자 이용, 명령줄에서 입력한 파일중 소유자가 사용자이며 읽기, 쓰기가 가능한 파일들 나열\n";
say "Looking for my files that are readable and writable";
die "No files specifed\n" unless @ARGV;
foreach my $file (@ARGV){
	print "$file is readable and writable" if(-w $file && -r _&&-o _);
}




print "\nch13 #4:사용자에게 디렉터리 이름 입력받고 이동, 기본동작:공백문자 제외하고 입력하지 않은 채 엔터 치면 홈 디렉터리로 이동, 알파벳 순서로 파일 출력, 디렉터리 변경 실패 시 경고만\n";;
print "Which directory? (Default is your home directory) ";
chomp(my $dir =<STDIN>);
if($dir =~ /^\s*$/){		#A blank line
	chdir or die "Can't chdir to your home dircetory: $!";
} else {
	chdir $dir or die "Can't chdir to '$dir' : $!";
}
my @files =<*>;
foreach (@files){
	print "$_\n";
}


print "\n#5:마침표로 시작하는 파일이 아니라 모든 파일 포함하도록 #2수정\n";
print "Which directory? (Default is your home directory) ";
chomp(my $dir =<STDIN>);
if($dir =~ /^\s*$/){		#A blank line
	chdir or die "Can't chdir to your home dircetory: $!";
} else {
	chdir $dir or die "Can't chdir to '$dir' : $!";
}
my @files =<.* *>;		#now includes .*
foreach (sort @files){		#now shorts
	print "$_\n";
}


print "\n#6:디렉터리 핸들 대신 글로빙 사용\n";
print "Which directory? (Default is your home directory) ";
chomp(my $dir =<STDIN>);
if($dir =~ /^\s*$/){		#A blank line
	chdir or die "Can't chdir to your home dircetory: $!";
} else {
	chdir $dir or die "Can't chdir to '$dir' : $!";
}
opendir DOT, ". " or die "Can't opendir dot: $!";
foreach (sort readdir DOT){
	#next if /^\. /;
	#if we were skipping dot files
	print "$_\n";
}


print "\n#7:rm처럼 명령줄에서 표기한 파일을 지우는 프로그램 작성\n";
unlink @ARGV;
foreach (@ARGV) {
	unlink $_ or warn "Can't unlink '$_': $!, continuing...\n";
}


print "\n#8:mv처럼 파일의 이름을 명령줄의 첫번째 인자에서 두번재 인자로 변경하는 프로그램 작성, 목적지가 디렉터리인 경우도 고려하여 새로운 디렉터리에서는 원래 파일의 베이스네임 사용\n";
use File::Basename;
use File::spec;

my ($source, $dest) = @ARGV;
if (-d $dest) {
	my $dasename = basename $source;
	$dest = File::Spec->catfile($dest, $basename);
}
rename $source, $dest
	or die "Can't rename '$source' to '$dest': $!\n";




print "\n#9:하드 링크 지원 시 ln처럼 명령줄의 첫번째 인자를 두번째 인자로 하드 링크 생성하는 프로그램 작성, 지원하지 않더라도 가능한 것처럼 수행한 연산을 알려주는 메시지 출력\n";
use File::Basename;
use File::Spec;

my($source, $dest)=@ARGV;
if(-d $dest){
	my $basename=basename $source;
	$dest=File::Spec->catfile($dest, $basename);
}
link $source, $dest
	or die "Can't link '$source' to '$dest' : $!\n";
#rename을 쓰는 대신에 link를 사용, 시스템이 하드링크를 지원하지 않으면 print "Would link '$source' to '$dest'. \n";를 마지막 명령문으로 대체
	


print "\n#10:소프트 링크 지원시 #7수정하여 다른 인자보다 앞서 -s 스위치 옵션을 받아들여 하드 링크 대신 소프트 링크 생성\n";
use File::Basename;
use File::Spec;

my $symlink = $ARGV[0] eq '-s';
shift @ARGV if $symink;

my($source, $dest)=@ARGV;
if(-d $dest){
	my $basename=basename $source;
	$dest=File::Spec->catfile($dest, $basename);
}
if ($symlink) {
	symlink $source, $dest
		or die "Can't link '$source' to '$dest' : $!\n";
} else {
	link $source, $dest
		or die "Can't link '$source' to '$dest' : $!\n";
}



print "\n#11:운영체제가 심벌릭 링크 지원시 현재 디렉터리에 있는 모든 심벌릭 링크를 찾아 심벌릭 링크가 가리키는 값 출력하는 프로그램, ls -l의 결과 처럼 이름name->value 값 형식\n";
foreach (<.* *>){
	my $dest =readlink $_;
	print "$_ -> $dest\n"	if defined $dest;
}

=cut




















