use 5.010;

=cut
print "\n#2:사용자에게 각각의 줄에서 문자열 목록을 입력받아 각각의 문자열을 20글자칸에 오른쪽 정렬(눈금줄출력)(문자열입력종료:ctrl+z)\n";
chomp(@input=<STDIN>);
$result=("%20s\n"x@input);
printf $result, @input;


print "\n#2-1:사용자에게 각각의 줄에서 문자열 목록을 입력받아 각각의 문자열을 20글자칸에 오른쪽 정렬(눈금줄출력)(문자열입력종료:ctrl+z)\n";
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

print "\n#3:#2에서 사용자가 칸 너비를 선택, 너비:30\n";
print "Enter number you want : ";
chomp($number=<STDIN>);
print "Enter some lines, then press ctrl-z\n";
chomp(@input=<STDIN>);
print "1234567890"x7, "\n";
foreach(@input){
	printf "%${number}s\n", $_;
}


print "\n#1:사용자에게 이름 묻고 대응하는 성 출력\n";
%name=(
	"fred"=>"flintstone",
	"barney"=> "rubble",
	"wilma"=> "flintstone"
);
chomp($input=<STDIN>);
print "input = $input / output = $name{$input}";

 
 print "\n#1-1:사용자에게 이름 묻고 대응하는 성 출력\n";
 my %last_name=qw{
 	fred flintstone
 	barney rubble
 	wilma flintstone
 };
 print "Pleas enter a first name: ";
 chomp(my $name=<STDIN>);
 print "That's $name $last_name{$name}.\n";

 
 print "\n#2:입력의 끝에 도달할 때까지 일련의 단어를 읽어 들이고 각각의 단어의 출현 빈도수를 출력\n";
 my(@words, %count, $word);
 chomp(@words=<STDIN>);
 foreach $word (@words){
 	$count{$word}+=1;
 	#혹은 $count{$word}=$count{$word}+1;
 }
 foreach $word (keys %count ){	#혹은 sort keys %count
 	print "$word was seen $count{$word} times.\n";
 }
 

print "\n#3:%ENV 안의 모든 키와 값을 나열\n";
my $longest=0;
foreach my $key(keys %ENV){
	my $key_length=length($key);
	$longest=$key_length if $key_length > $longest;
}
foreach my $key(sort keys %ENV){
	printf "%-${longest}s %s\n", $key, $ENV{$key};
}


print "\n#4:입력에서 fred가 나오는 줄 출력, 입력 물자열이 Fred, frederick, Alfred라면 일치 하는가?,
'fred flintstone'과 친구들이 나오는 텍스트파일 생성\n";
while (<>){
	if(/fred/){
		print;
	}
}


print "\n#5:Fred도 일치하도록 #4 수정\n";
while (<>){
	if(/[Ff]red/){
		print;
	}
}


print "\n#6:입력에서 마침표를 포함하는 줄 출력, 그 외의 줄은 무시\n";
while (<>){
	if(/\./){	#혹은 /[.]/ 문자 클래스 이용 가능
		print;
	}
}


print "\n#7:대문자가 있지만 모두 대문자는 아닌 단어를 포함한 줄 출력\n";
while (<>){
	if(/[A-Z][a-z]+/){
		print;
	}
}


print "\n#8:공백이 아닌 같은 문자 두 개를 가진 줄 출력\n";
while (<>){
	if(/(\S)\1/){
		print;
	}
}


print "\n#9:wilma와 fred를 모두 포함하는 줄 출력\n";
while (<>){
	if(/wilma fred+/){
		print;
	}
}


print "\n#9-1:wilma와 fred를 모두 포함하는 줄 출력\n";
while(<>){
	if(/wilma.*fred|fred.*wilma/){
		print;
	}
}

print "\n#9-2:wilma와 fred를 모두 포함하는 줄 출력\n";
while (<>){
	if(/wilma/){
		if(/fred/){
			print;
		}
	}
}
=cut