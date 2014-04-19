use Test::More;

use strict;
use warnings;

my $result = `pdf2json --help`;
use DDP; p $result;

done_testing;
