use 5.010;

print "\n#1:print와 printf 차이\n";
printf "%g %g %g\n", 5/2, 51/17, 51 ** 17;
printf "in %d days!\n", 17.85;
printf "%6d\n", 42;
printf "2d\n", 2e3+1.95;
printf "%10s\n", "wilma";
printf "%-5s\n", "flintstone";
printf "%12f\n", 6*7+2/3;
printf "%12.3f\n", 6*7+2/3;
printf "%12.0f\n", 6*7+2/3;
print "\n%12f\n", 6*7+2/3;
print "\n%12.3f\n", 6*7+2/3;
print "\n%12.0f\n", 6*7+2/3;
printf "\nmonthly interest reate : %12.2f%%\n", 5.25/12;

print "\n#2:배열과 printf\n";
my @items = qw( wilma dino pebbles red );
my $format = "the items are:\n" . ("%10s\n" x @items);
printf $format, @items;
print $format, "@items";
print "\n";
printf "The items are:\n" . ("%10s\n" x @items), @items;

print "\n#3:say로 출력\n";
my @array=qw(a b c d);
say @array;
say "@array";

