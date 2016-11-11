#!/usr/bin/perl -w

while (<>) {                   # input from file or stdin
    chomp($_);
    exit 0 if ("$_" eq "");    # if user entered an empty string, exit

    $dna = "$_";

    print "5' $dna 3'\n";        # print dna strand
    
    $complement = "$dna";
    $complement =~ tr/ATCG/TAGC/; # replace characters to turn into complement

    print "3' $complement 5'\n"; # print complementary dna strand
}
