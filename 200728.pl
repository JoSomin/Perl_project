use 5.010;

=cut
print "\n#1:���ϰ˻����α׷����, ���ڿ� ��ġ�� ��ġ�ϴ� ���� �����, beforematchafter�Է�\n";
while (<>){
	chomp;
	if(/match/){
		print "Matched: |$`<$&>$'|\n";
	} else {
		print "No match: |$_\n";
	}
}


print "\n#2:���ϰ˻����α׷����, ����a�� ������ ��� �ܾ�� ��ġ�ϴ� ���� ����� ->a$�� ������ ���� a\n";
while (<>){
	chomp;
	if(/a$/){
		print "Matched: |$`<$&>$'|\n";
	} else {
		print "No match: |$_\n";
	}
}


print "\n#2-1:���ϰ˻����α׷����, ����a�� ������ ��� �ܾ�� ��ġ�ϴ� ���� �����\n";
while (<>){
	chomp;
	if(/a\b/){
		print "Matched: |$`<$&>$'|\n";
	} else {
		print "No match: |$_\n";
	}
}


print "\n#2-2:���ϰ˻����α׷����, ����a�� ������ ��� �ܾ�� ��ġ�ϴ� ���� ����� -> barney�� a�� match\n";
while (<>){
	chomp;
	if(/a/){
		print "Matched: |$`<$&>$'|\n";
	} else {
		print "No match: |$_\n";
	}
}


print "\n#3:#2�� �����Ͽ� ���� a�� ������ �ܾ ������ $1�� ����, ��ġ�� ���ڿ��� ��������ǥ�� �ѷ��μ� $1�� 'wilma'�� ����մ� ��ó�� ���\n";
while (<>){
	chomp;
	if(/(\b\w*a\b)/){
		print "Matched: |$`<$&>$'|\n";
		print "\$1 contains '$1'\n";
	} else {
		print "No match: |$_|\n";
	}
}


print "\n#4:#3�� ���� $1���� ����� �ƴ� ���� ���� ���, ���� ���� �̸� : 'word', 'wilma'���ڿ� ���\n";
while (<>){
	chomp;
	if(/(?<word>\b\w*a\b)/){
		print "Matched: |$`<$&>$'|\n";
		print "'word' contains '$+{word}'\n";
	} else {
		print "No match: |$_|\n";
	}
}


print "\n#5:a�� ������ �ܾ��� �ڿ� �ڵ������ ���ڰ� �ִٸ� 0~5������ �ٸ� ��� ������ ����, �� ��� ���� ��� ���\n";	#����!!!!!!!!!!!!!!!!!!!!
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


print "\n#6:�Է¹��� �� �߿��� �ٹٲ� ���ڸ� ������ ���� ���ڷ� ������ ���� ���, �׽�Ʈ ���α׷� ����, ��� �� ���� ���κп� ǥ�� ���ڸ� �־� ���� ���� Ȯ��\n";
while (<>){
	chomp;
	if(/\s+$/){
		print "$_#\n";
		
	}
}
=cut

print "\nch.09 #1\n";



