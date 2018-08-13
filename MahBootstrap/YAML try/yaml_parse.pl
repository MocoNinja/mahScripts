#! /usr/bin/perl

use YAML;
use Data::Dumper;

# step 1: open file
open my $fh, '<', 'packages_learn.yml' 
  or die "can't open config file: $!";

# step 2: slurp file contents
my $yml = do { local $/; <$fh> };

# step 3: convert YAML 'stream' to perl hash ref
my $config = Load($yml);
# print Dumper($config), "\n";

# step 4: extract stuff

foreach $key (%config) {
    print $key;
}
