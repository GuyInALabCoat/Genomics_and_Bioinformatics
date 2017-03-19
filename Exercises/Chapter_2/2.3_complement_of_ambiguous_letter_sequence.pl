#!/usr/bin/perl -w
# prints the complement of restriction enzyme recognition sequences

%complementAmb = (
	'R' =>	'Y',
	'Y' =>	'R',
	'N'	=>	'N',
	'W'	=>	'W',
	'M'	=>	'K',
	'S'	=>	'S',
	'K'	=>	'M',
	'V'	=>	'B',
	'H'	=>	'D',
	'D'	=>	'H',
	'B'	=>	'V'
);

	@sequences = ('GTMKAC', 'GDGCHC', 'ACNNNNGTAYC');		# array of sequences
	
	foreach $sequence(@sequences){
		
		print "$sequence\tcomplement: ";
		
		$sequence =~ tr/ATCG/TAGC/;							# transliterate the regular base pairs (ATCG), into their complements
	
		for ( $i = 0; $i < length($sequence); $i++ ){		# loop over the entire sequence
		
			$letter = substr($sequence, $i, 1);				# get each individual character in the sequence
		
			if ($letter =~ m/[^ATCG]/){						# if the character is not either ATCG, then it must be an ambiguous letter
			
				print "$complementAmb{$letter}";			# print the value that corresponds to the abiguous letter key
			
			} else {
				print "$letter";							# else print the base pair as it is.
			}
		}
		
		print "\n";									
	}
	
	
	
