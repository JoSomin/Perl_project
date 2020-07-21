print "#1\n";
$meal="brontosaurus steak\n";

$test= "fred ate a $meal\n";
$test1= 'fred ate a $meal'."\n";
$test2= 'fred ate a $meal\n';
$test3= 'fred ate a $meal'.'\n';
$test4= 'fred ate a ' . $meal;
$test5="fred ate a ".$meal;

printf $test;
printf $test1;
printf $test2 . "\n";
printf $test3 ."\n";
printf $test4."\n";
printf $test5."\n";


print "#2\n";

$what = "brontosaurus steak";
$n =3;
#print "fred ate $n $whats.\n";
print "fred ate $n ${what}s.\n";
print "fred ate $n $what" . "s.\n";
print 'fred ate ' . $n . ' ' . $what . "s.\n";


print "#3\n";

$text="a line of text\n";
chomp($text);
print $text;


print "\n#4\n";

$line=<STDIN>;
if($line eq"\n"){
	print "That was just a blank line\n";
} else {
	print "That line of input was : $line";
}


print "\n#5\n";

chomp($text1=<STDIN>);
if($text1 eq"\n"){
	print "That was just a blank line\n\n";
} else {
	print "That line of input was : $text1";
}
print chomp;


print "\n#6\n";

$madonna=<STDIN>;
if(defined($madonna)){
	print "The input was $madonna";
} else {
	print "No input available\n";
}


print "\n#7\n";

$fred[0]="yabba";
$fred[1]="dabba";
$fred[2]="doo";
$fred[142]="goo";
#$blank=$fred[141];

print $fred[0];
print $fred[2];
print $fred[142];
#print $blank;


print "\n#8\n";

@rocks = qw/ bedrock slate lava /;
@tiny =( );
$dino = "granite";
@quarry = (@rocks, "crushed rock", @tiny, $dino);
print $quarry[0] . "\n";
print $quarry[3] . "\n";
print $quarry[4];


print "\n#9\n";

@list=qw(hello dolly);
$y=2;
$x="This is $list[1]'s place";
$z="This is $list[$y-1]'s place";

print $x;
print $z;