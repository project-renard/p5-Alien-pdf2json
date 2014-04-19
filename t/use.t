use Test::More;

use strict;
use warnings;

BEGIN{  use_ok 'Alien::pdf2json' }


my $result = `pdf2json --help`;
use DDP; p $result;

done_testing;
