#!/usr/bin/perl -w
# very simple cutter

%enzymes = (
	'BclI'		=>	'TGATCA',
	'BfmI'		=>	'CTRYAG',
	'CAC8I'		=>	'GCNNGC',
	'EcoRI'		=>	'GAATTC',
	'HindIII'	=>	'AAGCTT'
);

%enzymes_mod = %enzymes;		# create a copy of the restriction list to modify it

#modify the ambiguity letters
%amb = (
	'R'	=>	'[AG]',
	'Y'	=>	'[CT]',
	'N'	=>	'[AGCT]',
	'W'	=>	'[AT]',
	'M'	=>	'[AC]',
	'S'	=>	'[CG]',
	'K'	=>	'[TG]',
	'V'	=>	'[ACG]',
	'H'	=>	'[ACT]',
	'D'	=>	'[AGT]',
	'B' =>	'[CGT]'
);

foreach $value ( values %enzymes_mod ) {	# loop over the enzymes in the hash
	foreach $key ( keys %amb ) {			# for each key in the ambguity list
		$value =~ s/$key/$amb{$key}/g;		# replace the ambiguious letter with the regular expression in the restriction hash		
	}
}

while (<>) {				# get user input as a file or stdin
	chomp($_);				# remove newline character
	exit 0 if ("$_" eq "");
	
	$seq = "$_";
	
	for ( $i = 0 ; $i < length($seq) - 5 ; $i++ ){			# construct words starting from the 5' end
		$testseq = substr( $seq, $i, 6 );					# get every possible 6 letter word substring
		foreach $key ( keys %enzymes_mod ){					# loop over the restriction enzymes
			if ( $testseq =~ m/$enzymes_mod{$key}/ ){		# if the restriction enzyme recognizes a sequence in the substring
				$pos = $i + 1;								
				print "$key\t$pos\t$testseq\t$enzymes{$key}\n";		# print the name of the enzyme, the nucleotide number where the sequence begins, the actual DNA seq along with the ambiguous sequence
			}
		}	
	}
}