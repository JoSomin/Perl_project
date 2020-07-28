use 5.010;

print "\nch.08 #1\n";
$_="i saw Barney\ndown at the bowling alley\nwith Fred\nlast night\n";
if(/Barney.*Fred/s){
	print "that string mentions Fred after Barney\n";
}

print "\n#1-1\n";
$_="i saw Barney\ndown at the bowling alley\nwith Fred\nlast night\n";
if(/Barney(.)Fred/){
	print "that string mentions Fred after Barney\n";
} else {
	print "fail\n";
}

print"\n#2\n";
$_="Hello there, neighbor";
if(/\s(\w+),/){
	print "the word was $1\n";
}

print "\n#2-1\n";
$_="Hello there, neighbor";
if(/(\S+) (\S+), (\S+)/){
	print "words were $1 $2 $3\n";
}

print "\n#3\n";
my $dino="I fear that I'll be extinct after 1000 years.";
if($dino=~/(\d*) years/){
	print "that said '$1' years.\n"
}

print "\n#3-1\n";
$dino1="I fear that I'll be extinct after a few million years.";
if($dino1=~/(\d*) years/){
	print "that said '$1' years.\n"
}

print "\n#4\n";
$wilma = "@ fear that I'll be extinct after a few million years.";
if($wilma =~ /(\w+)/){
	print "Wilma's word was $1.\n";
} else {
	print "Wilma doesn't have a word\n";
}

print "\n#5\n";
if(/(bronto)?saurus (steak|burger)/){
	print "Fred wants a $2\n";
}

print "\n#5-1\n";
if(/(bronto)?saurus (steak|burger)/){
	print "Fred wants a $1\n";
}

print "\n#5-2\n";
if(/(?:bronto)?saurus (steak|burger)/){
	print "Fred wants a $2\n";
}

print "\n#5-3\n";
if(/(?:bronto)?saurus (?:BBQ )?(steak|burger)/){
	print "Fred wants a $1\n";
}


print "\n#6\n";
my $names = "Fred or Barney";
if ($names =~ m/(\w+) and (\w+)/ ){
	say "I saw $1 and $2";
}
print "and�ڸ��� or�� �ֱ⿡ ��ġ���� ����\n";

print "\n#6-1\n";
my $names1 = "Fred or Barney";
if ( $names1 =~ m/(\w+) (and|or) (\w+)/ ){
	say "I saw $1 and $2";
}

print "\n#6-2\n";
my $names2 = "Fred or Barney";
if ( $names2 =~ m/(?<name1>\w+) (?:and|or) (?<name2>\w+)/ ){
	say "I saw $+{name1} and $+{name2}";
}

print "\n#6-3\n";
my $names3 = "Fred or Barney";
if ( $names3 =~ m/(?<name2>\w+) (?:and|or) (?<name1>\w+)/ ){
	say "I saw $+{name1} and $+{name2}";
}

print "\n#6-4\n";
my $names4 = "Fred Flinstone and Wilma Flinstone";
if ( $names4 =~ m/(?<last_name>\w+) and \w+ \g{last_name}/ ){
	say "I saw $+{last_name}";
}

print "\n#6-5\n";
my $names5 = "Fred Flinstone and Wilma Flinstone";
if ( $names5 =~ m/(?<last_name>\w+) and \w+ \k<last_name>/ ){
	say "I saw $+{last_name}";
}

=cut
print "\n#7\n";
while (<>){
	chomp;
	if(/larry/){
		print "Matched: |$`<$&>$'|\n";
	} else {
		print "No match: |$_\n";
	}
}


print "\nch.09 #8\n";
$_ = "He's out bowling with Barney tonight.";
s/Barney/Fred/;
print "$_\n";
s/with (\w+)/against $1's team/;
print "$_\n";
=cut

print "\n#9\n";	#����!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!���� �ٸ��� ����
$_="green scaly dinosaur";
s/(\w+) (\w+)/$2, $1/;
print "$_\n";
s/^/huge, /;
print "$_\n";
s/..*een//;		#�� ������ ġȯ : "huge dinosaur"
print "$_\n"; 
s/green/red/;	#��ġ ���� : ������ "huge dinosaur"
print "$_\n";	
s/\w+$/($`!)$&/;	#"huge(huge !)dinosaur"
print "$_\n";	
s/\s+(!\W+)/$1 /;	#"huge(huge!)dinosaur"
print "$_\n";	
s/huge/gigantic/;	#"gigantic(huge!) dinosaur"
print "$_\n";	


print "\n#10\n";
$line="home, sweet home!";
$line =~ s/home/cave/g;
print "$line\n";


print "\n#11\n";
$line1 = "Input data\t may have extra whitespace.";
print "$line1\n";
$line1 =~ s/\s+/ /g;	#\t�� ��ĭ �ϳ��� ����
print "$line1\n";
$line1 =~ s/^\s+//;	#�պκ��� ���� ����
print "$line1\n";
$line1 =~ s/\s+$//;	#�޺κ��� ���� ����
print "$line1\n";
$line1 =~ s/^\s+|\s+$//g; 	#�յ��� ���� ����
print "$line1\n";


print "\n#12\n";
$line2 = "I saw Barney with Fred.";
$line2 =~ s/(fred|barney)/\U$1/gi;	#�ڿ� ������� ��� ���ڿ��� ������ �빮��
print "$line2\n";
$line2 =~ s/(fred|barney)/\L$1/gi;	#�ڿ� ������� ��� ���ڿ��� ������ �ҹ���
print "$line2\n";	
$line2 =~ s/(\w+) with (\w+)/\U$2\E with $1/i;	#��ҹ��� ���� ȸ�Ǵ� ġȯ ���ڿ��� ���� �κ� ������ ����, �߰��� ��ҹ��� ���� ����� ������ \Eȸ�� ���
print "$line2\n";
$line2 =~ s/(fred|barney)/\u$1/ig;	#�ҹ��ڷ� �ۼ��ϸ� \l�� \u �ٷ� ������ ���ڿ��� ����
print "$line2\n";
$line2 =~ s/(fred|barney)/\u\L$1/ig;	#\u��\L�� ���� ����ϸ� ��� �ҹ��ڷ� �����ϵ� ù��° ���ڴ� �빮��, \L�� \u�� ������ �ٲپ ��
print "$line2\n";
print "Hello, \L\u$line2\E, would yo like to play a game?\n";	#���ذ� �ȵ�;;;


print "\n#13\n";
$url = "http://www.joinc.co.kr/wiki.php/mypage";
my ($protocol, $domain, @page) = split ":*\/+", $url;
$uri_page = join "/", @page;

print "Protocol : $protocol\n";
print "Domain : $domain\n";
print "Page : $uri_page\n";


print "\n#14\n";
#use strict;
#use warnings;

my $data = 'hello world\n';
my @values = split(undef, $data);

foreach my $val(@values)
{
    print $val,"\n";
}


print "\n#15\n";
my $line4 = "meryln:test:118:80:Randal:/home/meradf:/user/bin/perl";
my @fields = split(/:/, $line4);
print "@fields\n";
for($i=0; $i<$#fields +1; $i++){
	print "$fields[$i]\n";
}
print("-----------------------------\n\n");
my $outline = join(":", @fields);
print "$outline\n";



print "\n#15-1\n";
my $line5 = "meryln:test:118:80:Randal:/home/meradf:/user/bin/perl";
my @fields1 = split(/:/, $line5);
print "@fields1\n";
foreach $text (@fields1){
	print "$text\n";
}
print("-----------------------------\n\n");
my $outline1 = join(":", @fields1);
print "$outline1\n";


