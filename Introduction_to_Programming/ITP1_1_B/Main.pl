use strict;
use warnings;
use utf8;

binmode STDIN,  ":utf8";
binmode STDOUT, ":utf8";
binmode STDERR, ":utf8";

sub main() {
  while(<STDIN>) {
    print int($_)**3 . "\n";
  }
}

&main();


