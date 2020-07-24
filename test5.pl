use 5.010;

print "\n#1\n";
$family_name{"fred"}="flintstone";
$family_name{"barney"}="rubble";
foreach $person(qw/barney fred/){
	print "i've heard of $person $family_name{$person}.\n";
}

print "\n#1-1\n";
@family=qw/barney fred/;
$family_name{"fred"}="flintstone";
$family_name{"barney"}="rubble";
foreach $person(@family){
	print "i've heard of $person $family_name{$person}.\n";
}

print "\n#1-2\n";
@family=qw/barney fred/;
$family_name{"fred"}="flintstone";
$foo="bar";
$family_name{$foo."ney"}="rubble";
foreach $person(@family){
	print "i've heard of $person $family_name{$person}.\n";
}

print "\n#1-3\n";
@family=qw/barney fred/;
$family_name{"fred"}="flintstone";
$family_name{"fred"}="astaire";
$bedrock=$family_name{"fred"};
$family_name{"barney"}="rubble";
foreach $person(@family){
	print "i've heard of $person $family_name{$person}.\n";
}
print $bedrock;

print "\n#1-4\n";
@family=qw/barney fred wilma betty/;
$family_name{"fred"}="flintstone";
$family_name{"barney"}="rubble";
$family_name{"wilma"}="flintstone";
$family_name{"betty"}="jane ";
$family_name{"betty"}.=$family_name{"barney"};
foreach $person(@family){
	print "i've heard of $person $family_name{$person}.\n";
}
#$granite=$family_name{"larry"};
#print $granite;

print "\n#2\n";
%some_hash=("foo", 35, "bar", 12.4, 2.5, "hello", "wilma", 1.72e30, "betty", "bye\n");
@any_array=%some_hash;
print "@any_array\n";

print "\n#2-1\n";
@family=qw/barney fred/;
%family_name=("fred", "flintstone", "barney", "rubble");
foreach $person(@family){
	print "i've heard of $person $family_name{$person}.\n";
}

print "\n#2-2\n";
@family=qw/barney fred wilma betty/;
%family_name=(
	"fred"=> "flintstone",
	"barney"=> "rubble",
	"dino"=> undef,
	"wilma"=> "flintstone",
	"betty"=> "jane"
	);
foreach $person(@family){
	print "i've heard of $person $family_name{$person}.\n";
}

print "\n#3\n";
%hash=(
	"a"=>1,
	"b"=>2,
	"c"=>3
	);
foreach $key (sort keys %hash){
	$value = $hash{$key};
	print "$key=>$value\n";
	print "$key=>$hash{$key}\n"; #윗줄의 코드와 같음
}

print"\n#4\n";
$_="the HAL-9000 reauires authorization to continue";
if(/HAL-[0-9]+/){
	print "The string mentions some model of HAL computer\n"
}

=cut
print "\n#5\n";
print "Would yo like to play a game?";
chomp($_= );	#이부분 오류!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if(/yes/i){
	print "In that case, i rcommend that you go bowling\n";
}
=cut
print "\n#6\n";
$_="i saw Barney\ndown at the bowling alley\nwith Fred\nlast night\n";
if(/Barney.*Fred/s){
	print "that string mentions Fred after Barney\n";
}

print "\n#7\n";
