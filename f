#!/usr/bin/perl

# Given a glob pattern, look for a matching file in current directory and
# subdirectories, then open in the default editor if a match is found.
# The editor is started in the background. This works for GUI editors
# like subl/atom; for others remove & from the system command.

# Lari Lampen, ~2010

use strict;
use warnings;

my @files= `find . -iname \"$ARGV[0]\"`;
chomp @files;

my $target;
if ($#files == 0) {
  $target=$files[0];
} elsif ($#ARGV >= 1) {
  my $idx=$ARGV[1];
  if ($#files >= $idx) {
    $target=$files[$idx];
  } else {
    die "No such index: $idx";
  }
} else {
  print $#files+1, " files match:\n";
  for (my $i=0; $i<=$#files; $i++) {
    print " $i\t",$files[$i],"\n";
  }
  exit;
}

print ">>> opening $target\n";
system("$ENV{'EDITOR'} $target &");
