#!/usr/bin/perl -w

# Read file, print out lines until the specified number of empty lines
# has been encountered. This can be used to extract a specific number
# of locutions from a conll file.
#
# Lari Lampen, 2014

use strict;

if ($#ARGV < 1) {
  print "Usage: $0 file num\n";
  print "Print lines from file until num empty lines have been encountered.\n\n";
  die "Arguments missing";
}

open IF, $ARGV[0];
my $a;
my $counter = 0;
while ($a = <IF>) {
  if ($a =~ /^\s*$/) {
    $counter++;
    last if ($counter >= $ARGV[1]);
  }
  print $a;
}
close IF;
