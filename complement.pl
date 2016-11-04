$dna = 'GCAATGG';
$rev = reverse($dna);
$rev =~ tr/ATCG/TAGC/;
print "$rev\n";
