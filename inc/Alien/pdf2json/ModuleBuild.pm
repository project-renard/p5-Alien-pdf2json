package Alien::pdf2json::ModuleBuild;

use strict;
use warnings;

use parent 'Alien::Base::ModuleBuild';
use Archive::Extract;

sub alien_do_commands {
  my ($self, $phase) = @_;
  use DDP; p $phase;
  $self->SUPER::alien_do_commands($phase);
}

1;
