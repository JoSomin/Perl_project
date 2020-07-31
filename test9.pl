use 5.010;
#!/usr/bin/perl

=cut
print "\nch.14 #1:해쉬정렬\n";
sub by_score {
	$score{$b} <=> $score{$a}		#점수를 기반으로 숫자 순서를 거꾸로 정렬
}
my %score =("barney"=>195, "fred"=>205, "dino"=>30);
my @winners = sort by_score keys %score;



print "\n#2:여러 개의 키로 정렬\n";
my %score1=(
"barney" 	=> 	195, 	"fred" 		=>	205,
"dino"		=>	30, 	"bamm-bam"	=>	195
);
sub by_score_and_name {
	$score{$b} <=> $score{$a}
		or
	$a cmp $b
}
my @winners1=sort by_score_and_name keys %score1;


print "\n#3\n";
@patron_IDs=sort {
	&fines ($b)<=>&fines($a) or
	$items{$b}<=> $items{$a} or
	$family_name{$a} cmp $family_name{$b} or
	$personal_name{$a} cmp $personal_name{$b} or
	$a <=> $b
} @patron_IDs;

print "\nch.15 #4:~~ 바인딩 연산자\n";
print "I found Fred in the name\n"	if $name =~/Fred/;
say " I found Fred in the name"	if $name ~~ /Fred/;


print "\n#5\n";
my $flag =0;
foreach my $key (keys %names){
	next unless $key =~ /Fred/;
	$flag = $key;
	last;
}

print "I found a key matching 'Fred'. It was $flag\n" if $flag;



print "\n#5-1\n";
my $equal =0;
foreach my $index(0..$#names1){
	last unless $names1[$index] eq $names2[$index];
	$equal++;
}
print "The arrays have the same elements\n"
	if $equal == @names1;


print "\n#6\n";
my @nums = qw(1 2 3 27 42);
my $result=max( @nums );

my $flag = 0;
foreach my $num( @nums ){
	next unless $result==$num;
	$flag =1;
	last;
}
print "The result is one of the input values\n" if $flag;



print "\n#6-1\n";
my @nums1 = qw(1 2 3 27 42);
my $result1=max(@nums1);

say "The result [$result1] is one of the input values (@nums1)"
	if @nums1 ~~ $result1;		#피연산자 순서 바꾸어도 동일 결과 도출


print "\n#7:given 명령문\n";
given ($ARGV[0]){
	when (/fred/i)	{say 'Name has fred in it'}
	when (/^Fred/)	{say 'Name starts with Fred'}
	when ('Fred')	{say 'Name if Fred'}
	default			{say "I don't see a Fred"}
}


print "\n#7-1:given 명령문, ~~연산자 사용\n";
given ($ARGV[0]){
	when ($_~~/fred/i)	{say 'Name has fred in it'}
	when ($_~~/^Fred/)	{say 'Name starts with Fred'}
	when ($_~~'Fred')	{say 'Name if Fred'}
	default				{say "I don't see a Fred"}
}


print "\n#7-2:if-elsif-else, ~~연산자 사용\n";
{
my $_ = $ARGV[0];
	if ($_~~/fred/i)	{say 'Name has fred in it'}
	elsif ($_~~/^Fred/)	{say 'Name starts with Fred'}
	elsif ($_~~'Fred')	{say 'Name if Fred'}
	else				{say "I don't see a Fred"}
}


print "\n#8:when으로 항목 다루기\n";
my @names=qw{ fred flintstone Wilma Flintstone Barney Rubble };
foreach (@names) {		#현재 요소를 넣을 변수의 이름을 짓지 말기
	when ($_~~/fred/i)	{say 'Name has fred in it'}
	when ($_~~/^Fred/)	{say 'Name starts with Fred'}
	when ($_~~'Fred')	{say 'Name if Fred'}
	default				{say "I don't see a Fred"}
}


print "\n#8-1:when으로 항목 다루기\n";
my @names1=qw{ fred flintstone Wilma Flintstone Barney Rubble };
foreach (@names1) {		#현재 요소를 넣을 변수의 이름을 짓지 말기
	say "\nProcessing $_";
	when ($_~~/fred/i)	{say 'Name has fred in it'; continue}
	when ($_~~/^Fred/)	{say 'Name starts with Fred'; continue}
	when ($_~~'Fred')	{say 'Name if Fred';}
	default				{say "I don't see a Fred"}
}


print "\n#8-2:when으로 항목 다루기\n";
my @names2=qw{ fred flintstone Wilma Flintstone Barney Rubble };
foreach (@names2) {		#현재 요소를 넣을 변수의 이름을 짓지 말기
	say "\nProcessing $_";
	when ($_~~/fred/i)	{say 'Name has fred in it'; continue}
	when ($_~~/^Fred/)	{say 'Name starts with Fred'; continue}
	when ($_~~'Fred')	{say 'Name if Fred';}
	say "Moving on to default...";
	default				{say "I don't see a Fred"}
}
=cut

print "\nch.16 #9\n";















