use 5.010;
#!/usr/bin/perl   ##Ȥ�� /usr/local/bin/perl

=cut
print "\n#1:��Ʈ ���͸��Ͱ��� Ư�� ���͸��� �ٲٴ� ���α׷�, ls-l:�� ���͸����� �� ���� ���͸� �������� ��� ��ɾ� ����\n";
chdir "/" or die "Can't chdir to root directory: $!";
exec "ls", "-l" or die "Can't exec ls: $!";



print "\n#2:#1����, ���� ���͸����� ls.out ���Ͽ� ��ɾ� ��¹� ������, ���� ��¹��� ls.err��� ���Ϸ� (��ä�� ������)\n";
#ù ��°, �� ��° ���� ���� ���͸��� ���Ϸ� �ٽ� �� �׸��� ���͸��� ����� ���� ���͸��� ���빰�� ����ϴ� ��ɾ� �����ϰ� ���� ���͸��� �� ���Ͽ� ������ ����
open STDOUT, ">ls.out" or die "Can't write to ls.out: $!";
open STDERR, ">ls.err" or die "Can't write to ls.err: $!";

chdir "/" or die "Can't chdir to root directory: $!";
exec "ls", "-l" or die "Can't exec ls: $!";
#������ die�� ����� �޽����� ls.err�� 	why?)�� ������ STDERR�� ls.err�� ����Ű�� �ֱ� ����
#chdir�� die ���� ls.err�� �޽��� ����
#�� ��° �ٿ��� STDERR�� �ٽ� ���� ���ϸ� ������ STDERR�� ��
#�� ���� ���� �ڵ��� �ٽ� ���� �Ϳ� �����ߴٸ� ���� ���� �ڵ��� �״�� ���� ����
=cut


print "\n#3:���� ��¥ �������� date��ɾ� ��¹� �Ľ��ϴ� ���α׷�, �����̶�� get to work, �ָ��̸� get play ���, �������̸� Mon, date��ɾ ���ٸ� ������ ���ڿ���� ���α׷� �����\n";
if ('date' =~ /^S/) {
	print "go play!\n";
} else {
	print "get to work\n";
}