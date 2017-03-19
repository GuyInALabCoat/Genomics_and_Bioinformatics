#!/usr/bin/perl -w

# A simplification of the simple cutter that only identifies whether a certain enzyme cleaves or not in the sequence under investigation

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
	
	foreach $key ( keys %enzymes_mod ){
		if ( $seq =~ m/$enzymes_mod{$key}/ ){
			print "$key\tcuts in this sequence\n";
		}
	}
}