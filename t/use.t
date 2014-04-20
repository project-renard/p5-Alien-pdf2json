use Test::More tests => 2;

use strict;
use warnings;

BEGIN{  use_ok 'Alien::pdf2json' }

my $p = Alien::pdf2json->new;
system($p->pdf2json_path, '-help' );
diag $p->pdf2json_path;

my $pid = open my $read_pdf2json, "-|";
die "$0: fork: $!" unless defined $pid;

if( $pid == 0 ) {
  # child
  open STDERR, ">&", \*STDOUT  or die "$0: open: $!";
  exec({$p->pdf2json_path} "-help") or die "exec: $!";
} else {
  my $result = join "", <$read_pdf2json>;
  like($result, qr/pdf2json version/, 'can run pdf2json');
}

done_testing;
