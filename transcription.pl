$dna = 'GCAATGG';
print "The DNA sequence is $dna\n";
$rna = $dna;
$rna =~ tr/T/U/;
print "and the RNA sequence is $rna\n";
