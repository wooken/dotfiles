#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

my $DEBUG = 0;

sub kill_all {
    return if $DEBUG;
    system( "killall -q polybar" );

    while(system("pgrep -x polybar")) {
        sleep 1;
    }
}

sub start {
    my $display = shift;
    if ($DEBUG) {
        print "$display\n";
        return
    }
    system( "MONITOR=$display polybar --reload unimatrix &" );
}

# Terminate already running bar instances
kill_all();

my @output = `xrandr`;
chomp @output;

my $primary;
my @secondary;

for my $line (@output) {
    my @words = split / /, $line;
    if ( $line =~ / connected primary/ ) {
        $primary = $words[0];
    } elsif ( $line =~ / connected/ ) {
        push( @secondary, $words[0] );
    }
}

# let primary display grab systray
start($primary);
sleep 1;
for my $sec (@secondary) {
    start($sec);
}

print "Polybars launched...\n";
