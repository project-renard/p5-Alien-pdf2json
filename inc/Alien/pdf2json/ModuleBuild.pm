package Alien::pdf2json::ModuleBuild;

use strict;
use warnings;

use parent 'Alien::Base::ModuleBuild';
use Archive::Extract;
use File::Copy;
use File::chdir;


sub alien_do_commands {
  my ($self, $phase) = @_;
	if( $self->is_windowsish() || 1 ) {
		my $dir = $self->config_data( 'working_directory' );
		# TODO extract inc/pdf2json-0.68-win32.zip
		if( $phase eq 'build' ) {
			# nop
		} elsif(  $phase eq 'install' ) {
			use DDP; p $CWD;
			use DDP; p $self->alien_library_destination;
			die $self->alien_library_destination;
			return 1;
		} else {
			$self->SUPER::alien_do_commands($phase);
		}
	}
	else {
		$self->SUPER::alien_do_commands($phase);
		if( $phase eq 'build' ) {
			# after build
			my $dir = $self->config_data( 'working_directory' );

			my $bin_dir = File::Spec->catfile( $dir, 'bin' );
			mkdir $bin_dir;
			
			my $pdf2json_src = File::Spec->catfile( $bin_dir, 'pdf2json' );
			my $pdf2json_tgt = File::Spec->catfile( $dir, 'src', 'pdf2json' );

			copy $pdf2json_src, $pdf2json_tgt;
			# needed for test to pass
		}
	}
}

1;
