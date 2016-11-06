#!/usr/bin/perl -w

while (<>) {
    chomp($_);
    exit 0 if ("$_" eq "");                   # if empty string, exit.

    
    $dna = "$_";
    print "The DNA sequence is $dna\n";
    $rna = $dna;
    $rna =~ tr/T/U/;                          # use transliteration operator tr/// to replace all Ts with Us
    print "and the RNA sequence is $rna\n";

    
}
