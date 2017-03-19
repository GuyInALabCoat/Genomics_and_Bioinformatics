#!/usr/bin/perl -w

# analyses sequence to generate candidate siRNA sequences that could be used in an RNAi experiment

# First read the sequence from a file named 'mrna.fa'

$seq = '';
open(IN, 'mrna.fa') or die "Could not open file mrna.fa\n";
while(<IN>){
	unless(/>/) {
		chomp;
		$seq .= $_;
	}
}

close IN;

# Now analyse the sequence from the file

# Step through each position of the sequence

for ( $i = 0; $i < length($seq) - 22 ; $i++ ){
	
	$testseq = substr( $seq, $i, 23 );
	
	# check if first two positions are AA and last are TT
	if ( $testseq =~ m/^AA.*TT$/ ){
		
		# test GC content
		
		# count the number of G's and C's
		$gc_content = ( $testseq =~ tr/GC// ) / 23;
		
		# is the GC content within the range 30-50?
		if ( ( $gc_content >= 0.3 ) && ( $gc_content <= 0.5 ) ) {
			
			# does the sequence contain stretches of As, Ts, Cs, or Gs?
			
			unless ( ( $testseq =~ /A{4}/ ) 
				|| ( $testseq =~ /T{4}/ )
				|| ( $testseq =~ /G{4}/ )
				|| ( $testseq =~ /C{4}/ )
				
				# also avoid regions of six positions with G or C
				|| ( $testseq =~ /[GC]{6}/ ) )
			{
				print "pos $i $testseq\n";
			}
		}	 
	}
}