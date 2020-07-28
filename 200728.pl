use 5.010;

=cut
print "\n#1:패턴검사프로그램사용, 문자열 일치에 일치하는 패턴 만들기, beforematchafter입력\n";
while (<>){
	chomp;
	if(/match/){
		print "Matched: |$`<$&>$'|\n";
	} else {
		print "No match: |$_\n";
	}
}


print "\n#2:패턴검사프로그램사용, 글자a로 끝나는 모든 단어와 일치하는 패턴 만들기 ->a$는 문장의 끝이 a\n";
while (<>){
	chomp;
	if(/a$/){
		print "Matched: |$`<$&>$'|\n";
	} else {
		print "No match: |$_\n";
	}
}


print "\n#2-1:패턴검사프로그램사용, 글자a로 끝나는 모든 단어와 일치하는 패턴 만들기\n";
while (<>){
	chomp;
	if(/a\b/){
		print "Matched: |$`<$&>$'|\n";
	} else {
		print "No match: |$_\n";
	}
}


print "\n#2-2:패턴검사프로그램사용, 글자a로 끝나는 모든 단어와 일치하는 패턴 만들기 -> barney의 a도 match\n";
while (<>){
	chomp;
	if(/a/){
		print "Matched: |$`<$&>$'|\n";
	} else {
		print "No match: |$_\n";
	}
}


print "\n#3:#2를 수정하여 글자 a로 끝나는 단어를 기억공간 $1에 저장, 일치한 문자열을 작은따옴표로 둘러싸서 $1에 'wilma'가 들어잇는 것처럼 출력\n";
while (<>){
	chomp;
	if(/(\b\w*a\b)/){
		print "Matched: |$`<$&>$'|\n";
		print "\$1 contains '$1'\n";
	} else {
		print "No match: |$_|\n";
	}
}


print "\n#4:#3를 수정 $1변수 사용이 아닌 저장 변수 사용, 저장 변수 이름 : 'word', 'wilma'문자열 출력\n";
while (<>){
	chomp;
	if(/(?<word>\b\w*a\b)/){
		print "Matched: |$`<$&>$'|\n";
		print "'word' contains '$+{word}'\n";
	} else {
		print "No match: |$_|\n";
	}
}


print "\n#5:a로 끝나는 단어의 뒤에 뒤따라오는 문자가 있다면 0~5개까지 다른 기억 변수에 저장, 두 기억 변수 모두 출력\n";	#오류!!!!!!!!!!!!!!!!!!!!
while (<>){
	chomp;
	if(/m!
	(\b\w*a\b)
	(.{0,5})
	!xs/){
		print "Matched: |$`<$&>$'|\n";
		print "\$1 contains '$1'\n";
		print "\$2 contains '$2\n";
	} else {
		print "No match: |$_|\n";
	}
}


print "\n#6:입력받은 줄 중에서 줄바꿈 문자를 제외한 공백 문자로 끝나는 줄을 출력, 테스트 프로그램 말고, 출력 시 줄의 끝부분에 표식 문자를 넣어 공백 문자 확인\n";
while (<>){
	chomp;
	if(/\s+$/){
		print "$_#\n";
		
	}
}
=cut

print "\nch.09 #1\n";



