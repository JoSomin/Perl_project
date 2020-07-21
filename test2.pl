use warnings;
#use strict;

print "\n#1\n";
@rocks=qw/ bedrock slate lava /;
foreach $rock (@rocks) {
	$rock  ="\t$rock";
	$rock .= "\n";
	print $rock;
}
print "the rocks are:\n". @rocks;


print "\n\n#2\n";
foreach $rock (qw/ bedrock slate lava /){
	print "one rock is $rock.\n";
}


print "\n#3\n";
foreach (1..4){
	print "i can count to $_\n";
}
$_="yabba dabba doo\n";
print;

print "\n#4\n";
@fred=6..10;
@fred1=10..6;
@fred2=reverse 6..10;
@fred3=reverse 10..6;
print "@fred\n";
print "@fred1\n";
print "@fred2\n";
print "@fred3\n";

print "\n#5\n";
@backwards=reverse qw/ yabba dabba doo /;
$backwards=reverse qw/ yabba dabba doo /;
print @backwards;	print"\n";
print $backwards;	print"\n";

=cut
print"\n#6\n";
chomp(@lines=<STDIN>);
print @lines;
=cut

print"\n#7\n";
sub marine {
	$n +=1;
	print "hello, sailor number $n\n";
}

&marine;
&marine;
&marine;
&marine;
&marine;
&marine;

print "\n#8\n";
sub max{
	my($max_so_far)=shift @_;	
	foreach (@_) {
		if($_ > $max_so_far) {
			$max_so_far=$_;
		}
	}
	$max_so_far;
}

$maximum = &max(3, 5, 10, 4, 6);
print $maximum;

print "\n#9\n";
sub which_element_id{
	my($what, @array) =@_;
	foreach (0..$#array){
		if($what eq $array[$_]){
			return $_;
		}
	}
	-1;
}
my @names=qw/ fred barney betty dino wilma pebbles bamm-bamm /;
my $result = &which_element_id("dina", @names);
print $result;


print "\n#10\n";
sub list_form_fred_to_barney{
	if($fred < $barney){
		$fred..$barney;
	} else {
		reverse $barney..$fred;
	}
}

$fred=11;
$barney=6;
@c = &list_form_fred_to_barney;
print @c;


print "\n#11\n";
use 5.010;

sub running_sum{
	state $sum=0;
	state @numbers;
	
	foreach my $number(@_){
		push @numbers, $number;
		$sum+=$number;
	}
	say "the sum of (@numbers) is $sum";
}

running_sum(5, 6);
running_sum(1..3);
running_sum(4);
