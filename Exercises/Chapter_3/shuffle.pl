use List::Util  'shuffle';

$seq = 'GACACGGGGGGTTTTAA';

@seq = split( '',$seq);
@shuf = shuffle(@seq);

print "ORIGINAL SEQUENCE: $seq\n";

$shuf = join('',@shuf);
print "SHUFFLED SEQUENCE: $shuf\n";

