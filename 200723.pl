use 5.010;
=cut
print "\n#1:cató�� ���������� ���� ������ �Ųٷ� ���";
print reverse <>;
=cut

print "\n#2:����ڿ��� ������ �ٿ��� ���ڿ� ����� �Է¹޾� ������ ���ڿ��� 20����ĭ�� ������ ����(���������)\n";
@input=<STDIN>;
$result=("%20s\n"x@input);
printf $result, @input;
