# Copyright 2015 Patrick Hurd

use v6;
use warnings;
use strict;
use NativeCall;

unit module Windows::Desktop;

# Constants used by SystemParametersInfo
my $!SPI_SETDESKWALLPAPER  = 20;
my $!SPIF_UPDATEANDSENDINI = 3;

# Might need to mess with integer size and whether P translates to Pointer[void]
sub SystemParametersInfo(int32, int32, Pointer[void], int32)
	returns int32
	is native("user32")
	{ * }
	
sub SetWallpaper (Str $filename) is export {
	# TODO: check whether provided filename exists
	SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $filename, $SPIF_UPDATEANDSENDINI);
}