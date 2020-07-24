use 5.010;
=cut
print "\n#1:cat처렁 동작하지만 줄의 순서를 거꾸로 출력";
print reverse <>;
=cut

print "\n#2:사용자에게 각각의 줄에서 문자열 목록을 입력받아 각각의 문자열을 20글자칸에 오른쪽 정렬(눈금줄출력)\n";
@input=<STDIN>;
$result=("%20s\n"x@input);
printf $result, @input;
