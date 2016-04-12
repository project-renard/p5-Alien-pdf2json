package Alien::pdf2json;

use strict;
use warnings;

use parent 'Alien::Base';
use File::Spec;

=method pdf2json_path

Returns a C<Str> which contains the absolute path
to the C<pdf2json> binary.

=cut
sub pdf2json_path {
  my ($self) = @_;
  File::Spec->catfile( $self->dist_dir , 'bin', 'pdf2json' );
}

1;

__END__

=head1 NAME

Alien::pdf2json - Alien package for the pdf2json PDF extraction library

=head1 LICENSE

pdf2json is licensed under GNU GPL v2.

=head1 SEE ALSO

L<pdf2json|https://code.google.com/p/pdf2json/>
