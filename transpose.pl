#!/usr/bin/perl

# Read csv file and transpose contents to output.
# (i.e. make columns into rows and vice versa)

use strict;

if ($#ARGV < 0) {
  die "You need to give the name of the input file name as argument!";
}

my $in=$ARGV[0];
open IF,$in || die "Unable to open file";
my @lines=<IF>;
close IF;
chomp @lines;

my @all;
foreach my $line (@lines) {
  next if $line =~ /^ *$/;
  my @f = split(/[ \t]+/, $line);
  push @all, \@f;
}

my @x=@{$all[0]};
for (my $i=0; $i<=$#x; $i++) {
  my @fields;
  for (my $j=0; $j<=$#all; $j++) {
    push @fields, $all[$j][$i];
  }
  print join("\t",@fields), "\n";
}
