use 5.010;

=cut
print "\n#2:����ڿ��� ������ �ٿ��� ���ڿ� ����� �Է¹޾� ������ ���ڿ��� 20����ĭ�� ������ ����(���������)(���ڿ��Է�����:ctrl+z)\n";
chomp(@input=<STDIN>);
$result=("%20s\n"x@input);
printf $result, @input;


print "\n#2-1:����ڿ��� ������ �ٿ��� ���ڿ� ����� �Է¹޾� ������ ���ڿ��� 20����ĭ�� ������ ����(���������)(���ڿ��Է�����:ctrl+z)\n";
print "Enter some lines, then press ctrl-z\n";
chomp(my @lines =<STDIN>);
print "1234567890"x7, "12345\n";
foreach(@lines){
	printf"%20s\n", $_;
}
my $format = "%20s\n"x@lines;
printf $format, @lines;


@fred=qw/ eating rocks is wrong /;
$fred="right";
print "$fred[3]\n";
print "${fred}[3]\n";
print "$fred"."[3]\n";
print "$fred\[3]\n";

print "\n#3:#2���� ����ڰ� ĭ �ʺ� ����, �ʺ�:30\n";
print "Enter number you want : ";
chomp($number=<STDIN>);
print "Enter some lines, then press ctrl-z\n";
chomp(@input=<STDIN>);
print "1234567890"x7, "\n";
foreach(@input){
	printf "%${number}s\n", $_;
}


print "\n#1:����ڿ��� �̸� ���� �����ϴ� �� ���\n";
%name=(
	"fred"=>"flintstone",
	"barney"=> "rubble",
	"wilma"=> "flintstone"
);
chomp($input=<STDIN>);
print "input = $input / output = $name{$input}";

 
 print "\n#1-1:����ڿ��� �̸� ���� �����ϴ� �� ���\n";
 my %last_name=qw{
 	fred flintstone
 	barney rubble
 	wilma flintstone
 };
 print "Pleas enter a first name: ";
 chomp(my $name=<STDIN>);
 print "That's $name $last_name{$name}.\n";

 
 print "\n#2:�Է��� ���� ������ ������ �Ϸ��� �ܾ �о� ���̰� ������ �ܾ��� ���� �󵵼��� ���\n";
 my(@words, %count, $word);
 chomp(@words=<STDIN>);
 foreach $word (@words){
 	$count{$word}+=1;
 	#Ȥ�� $count{$word}=$count{$word}+1;
 }
 foreach $word (keys %count ){	#Ȥ�� sort keys %count
 	print "$word was seen $count{$word} times.\n";
 }
 

print "\n#3:%ENV ���� ��� Ű�� ���� ����\n";
my $longest=0;
foreach my $key(keys %ENV){
	my $key_length=length($key);
	$longest=$key_length if $key_length > $longest;
}
foreach my $key(sort keys %ENV){
	printf "%-${longest}s %s\n", $key, $ENV{$key};
}


print "\n#4:�Է¿��� fred�� ������ �� ���, �Է� ���ڿ��� Fred, frederick, Alfred��� ��ġ �ϴ°�?,
'fred flintstone'�� ģ������ ������ �ؽ�Ʈ���� ����\n";
while (<>){
	if(/fred/){
		print;
	}
}


print "\n#5:Fred�� ��ġ�ϵ��� #4 ����\n";
while (<>){
	if(/[Ff]red/){
		print;
	}
}


print "\n#6:�Է¿��� ��ħǥ�� �����ϴ� �� ���, �� ���� ���� ����\n";
while (<>){
	if(/\./){	#Ȥ�� /[.]/ ���� Ŭ���� �̿� ����
		print;
	}
}


print "\n#7:�빮�ڰ� ������ ��� �빮�ڴ� �ƴ� �ܾ ������ �� ���\n";
while (<>){
	if(/[A-Z][a-z]+/){
		print;
	}
}


print "\n#8:������ �ƴ� ���� ���� �� ���� ���� �� ���\n";
while (<>){
	if(/(\S)\1/){
		print;
	}
}


print "\n#9:wilma�� fred�� ��� �����ϴ� �� ���\n";
while (<>){
	if(/wilma fred+/){
		print;
	}
}


print "\n#9-1:wilma�� fred�� ��� �����ϴ� �� ���\n";
while(<>){
	if(/wilma.*fred|fred.*wilma/){
		print;
	}
}

print "\n#9-2:wilma�� fred�� ��� �����ϴ� �� ���\n";
while (<>){
	if(/wilma/){
		if(/fred/){
			print;
		}
	}
}
=cut