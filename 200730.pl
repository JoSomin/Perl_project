use 5.010;
#!/usr/bin/perl

=cut
print"\nch.12 #1:����ٿ��� �Է��� ���� �̸� ���ڷ� �޾� �� ������ �б�,����,������ �������� �������� �ʴ��� �����ϴ� ���α׷�\n";;
foreach my $file (@ARGV){
	my $attribs = &attrivutes($file);
	print "'file' $attribs.\n";
}
sub attributes {
	#�־��� ���ϵ��� �Ӽ� ����
	my $file = shift @_;
	return "does not exist" unless -e $file;
	
	my @attrib;
	push @attrib, "readable" if -r $file;
	push @attrib, "writable" if -w $file;
	push @attrib, "executalbe" if -x $file;
	return "exists" unless @attrib;
	'is ' . join " and ", @attrib;		#��ȯ��
}


print "\n#2:����ٿ��� �Է��� ���� �� ���� ������ ������ ã�Ƴ� ���̰� ��ĥ���� ����, ����� ����ִٸ�?\n";
die "No file names supplied\n" unless @ARGV;
my $oldest_name = shift @ARGV;
my $oldest_age = -M $oldest_name;

foreach (@ARGV){
	my $age = -M;
	($oldest_name, $oldest_age)=($_, $age)
		if $age > $oldest_age;
}
printf "The oldest file was %s, and it was %. if days old\n", $oldest_name, $oldest_age;



print "\n#3:�׾Ƴ���(stacked)���� �׽�Ʈ ������ �̿�, ����ٿ��� �Է��� ������ �����ڰ� ������̸� �б�, ���Ⱑ ������ ���ϵ� ����\n";
say "Looking for my files that are readable and writable";
die "No files specifed\n" unless @ARGV;
foreach my $file (@ARGV){
	say "$file is readable and writable" if -o -r -w $file;
}


print "\n#3-1:�׾Ƴ���(stacked)���� �׽�Ʈ ������ �̿�, ����ٿ��� �Է��� ������ �����ڰ� ������̸� �б�, ���Ⱑ ������ ���ϵ� ����\n";
say "Looking for my files that are readable and writable";
die "No files specifed\n" unless @ARGV;
foreach my $file (@ARGV){
	print "$file is readable and writable" if(-w $file && -r _&&-o _);
}




print "\nch13 #4:����ڿ��� ���͸� �̸� �Է¹ް� �̵�, �⺻����:���鹮�� �����ϰ� �Է����� ���� ä ���� ġ�� Ȩ ���͸��� �̵�, ���ĺ� ������ ���� ���, ���͸� ���� ���� �� ���\n";;
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


print "\n#5:��ħǥ�� �����ϴ� ������ �ƴ϶� ��� ���� �����ϵ��� #2����\n";
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


print "\n#6:���͸� �ڵ� ��� �۷κ� ���\n";
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


print "\n#7:rmó�� ����ٿ��� ǥ���� ������ ����� ���α׷� �ۼ�\n";
unlink @ARGV;
foreach (@ARGV) {
	unlink $_ or warn "Can't unlink '$_': $!, continuing...\n";
}


print "\n#8:mvó�� ������ �̸��� ������� ù��° ���ڿ��� �ι��� ���ڷ� �����ϴ� ���α׷� �ۼ�, �������� ���͸��� ��쵵 ����Ͽ� ���ο� ���͸������� ���� ������ ���̽����� ���\n";
use File::Basename;
use File::spec;

my ($source, $dest) = @ARGV;
if (-d $dest) {
	my $dasename = basename $source;
	$dest = File::Spec->catfile($dest, $basename);
}
rename $source, $dest
	or die "Can't rename '$source' to '$dest': $!\n";




print "\n#9:�ϵ� ��ũ ���� �� lnó�� ������� ù��° ���ڸ� �ι�° ���ڷ� �ϵ� ��ũ �����ϴ� ���α׷� �ۼ�, �������� �ʴ��� ������ ��ó�� ������ ������ �˷��ִ� �޽��� ���\n";
use File::Basename;
use File::Spec;

my($source, $dest)=@ARGV;
if(-d $dest){
	my $basename=basename $source;
	$dest=File::Spec->catfile($dest, $basename);
}
link $source, $dest
	or die "Can't link '$source' to '$dest' : $!\n";
#rename�� ���� ��ſ� link�� ���, �ý����� �ϵ帵ũ�� �������� ������ print "Would link '$source' to '$dest'. \n";�� ������ ��ɹ����� ��ü
	


print "\n#10:����Ʈ ��ũ ������ #7�����Ͽ� �ٸ� ���ں��� �ռ� -s ����ġ �ɼ��� �޾Ƶ鿩 �ϵ� ��ũ ��� ����Ʈ ��ũ ����\n";
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



print "\n#11:�ü���� �ɹ��� ��ũ ������ ���� ���͸��� �ִ� ��� �ɹ��� ��ũ�� ã�� �ɹ��� ��ũ�� ����Ű�� �� ����ϴ� ���α׷�, ls -l�� ��� ó�� �̸�name->value �� ����\n";
foreach (<.* *>){
	my $dest =readlink $_;
	print "$_ -> $dest\n"	if defined $dest;
}

=cut




















