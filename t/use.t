use Test::More tests => 2;

use strict;
use warnings;
use IPC::Open3;

BEGIN{  use_ok 'Alien::pdf2json' }

my $p = Alien::pdf2json->new;

my($wtr, $rdr, $err);
use Symbol 'gensym'; $err = gensym;
my $pid = open3($wtr, $rdr, $err,
	$p->pdf2json_path, "-help" );
waitpid( $pid, 0 );

my $result = join "", <$err>;
like($result, qr/pdf2json version/, 'can run pdf2json');

done_testing;
