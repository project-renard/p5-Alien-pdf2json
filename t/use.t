use Test::More;

use strict;
use warnings;

BEGIN{  use_ok 'Alien::pdf2json' }

my $p = Alien::pdf2json->new;

my $result = `$p->pdf2json_path --help`;
use DDP; p $result;

done_testing;
