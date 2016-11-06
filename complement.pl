#!/usr/bin/perl

while (<>) {
    chomp($_);
    $dna = "$_";                 # use <> to accept input from either files or STDIN

    #$dna = 'GCAATGG';             define a sequence of bases as a string in the variable $dna. Strings can be enclosed by single (') or double (") quotes
    $rev = reverse($dna);        # use build-in function reverse to reverse the order of the characters in a string
    $rev =~ tr/ATCG/TAGC/;       # transliteration (tr/SEARCHLIST/REPLACEMENTLIST/) replaces characters in the searchlist with the characters in the replacementlist in the order given.  
                                 # the =~ symbol is the binding operator that makes $rev subject to the tr operation.
    print "$rev\n";              # print the contents of $rev to the screen. Double quotes are used for variable interpolation so that the contents of the variable are printed unlike single quotes which would just print the name of the variable. 

    exit 0 if ("$_" eq "");      # if empty string is entered, exit.
}

