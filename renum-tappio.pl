#!/usr/bin/perl

# Tappio is an old Finnish accounting software. If you are unfamiliar
# with it, then you don't need this script.

# Tappio uses a sequential numbering scheme for documents, meaning that
# if you forget something, adding it later is very awkward due to the
# inflexible numbering. Hence this simple script to change numbers
# in Tappio files.

# Usage: renum-tappio.pl file.tlk 666.
#   Event 666 (and subsequent events) will be moved up.

# With optional increment: renum-tappio.pl file.tlk 666 3
#   Event 666 and above will be bumped up by 3.

my $ifile = shift @ARGV;
my $num = shift @ARGV;
my $incr = 1;
if ($#ARGV >= 0) {
  $incr = shift @ARGV;
}

my $string;
{
  local $/ = undef;
  open IF, $ifile or die "Couldn't open file: $!";
  $string = <IF>;
  close IF;
}

my $ct=-1;
while ($string =~ s/(.*?)\(event ([0-9]+)//) {
  $ct++;
  if ($2 != $ct) {
    die "FAIL: expected $ct, found $2";
  }
  my $n = $ct;
  if ($n >= $num) {
    $n += $incr;
  }
  print "$1(event $n";
}
print $string;
