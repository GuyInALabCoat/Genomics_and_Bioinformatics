#!/usr/bin/perl -w

# The genetic code is represented as a hash. Each codon (hash key)
# is associated with an amino acid (hash value).
# A stop codon is shown as '*'

%code = (
    'UUU' => 'F', 'UUC' => 'F', 'UUA' => 'L', 'UUG' => 'L',
    'CUU' => 'L', 'CUC' => 'L', 'CUA' => 'L', 'CUG' => 'L',
    'AUU' => 'I', 'AUC' => 'I', 'AUA' => 'I', 'AUG' => 'M',
    'GUU' => 'V', 'GUC' => 'V', 'GUA' => 'V', 'GUG' => 'V',
    'UCU' => 'S', 'UCC' => 'S', 'UCA' => 'S', 'UCG' => 'S',
    'CCU' => 'P', 'CCC' => 'P', 'CCA' => 'P', 'CCG' => 'P',
    'ACU' => 'T', 'ACC' => 'T', 'ACA' => 'T', 'ACG' => 'T',
    'GCU' => 'A', 'GCC' => 'A', 'GCA' => 'A', 'GCG' => 'A',
    'UAU' => 'Y', 'UAC' => 'Y', 'UAA' => '*', 'UAG' => '*',
    'CAU' => 'H', 'CAC' => 'H', 'CAA' => 'Q', 'CAG' => 'Q',
    'AAU' => 'N', 'AAC' => 'N', 'AAA' => 'K', 'AAG' => 'K',
    'GAU' => 'D', 'GAC' => 'D', 'GAA' => 'E', 'GAG' => 'E',
    'UGU' => 'C', 'UGC' => 'C', 'UGA' => '*', 'UGG' => 'W',
    'CGU' => 'R', 'CGC' => 'R', 'CGA' => 'R', 'CGG' => 'R',
    'AGU' => 'S', 'AGC' => 'S', 'AGA' => 'R', 'AGG' => 'R',
    'GGU' => 'G', 'GGC' => 'G', 'GGA' => 'G', 'GGG' => 'G'
    );

#$dnaseq = 'GAACTGGGT';                # the DNA sequence

while (<>) {                           # user input as file or stdin
    chomp($_);                         # chomp newline charater
    exit 0 if ("$_" eq "");            # if user enters an empty string, exit

    $dnaseq = "$_";

    print "3' $dnaseq 5'    Template DNA sequence\n";

    $complement = reverse($dnaseq);
    $complement =~ tr/ATCG/TAGC/;
    print "5' $complement 3'    Complement DNA sequence\n   ";

    $complement =~ tr/T/U/;

    for ( $i = 0 ; $i < length($complement) - 2 ; $i = $i + 3 ) {     # translation
	$codon = substr($complement, $i, 3);                          # moving three bases at a time, extract one codon at a time
	$amino_acid = $code{$codon};                              # translate codon into amino acid
	print " $amino_acid ";
    }
    print "\n";
    

}
