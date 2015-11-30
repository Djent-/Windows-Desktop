# Copyright 2015 Patrick Hurd

use v6;
use strict;
use NativeCall;

unit module Windows::Desktop;

# Constants used by SystemParametersInfo
my $SPI_SETDESKWALLPAPER  = 20;
my $SPIF_UPDATEANDSENDINI = 3;

# Might need to mess with integer size and whether P translates to Pointer[void]
sub SystemParametersInfo(int32, int32, Pointer[int32], int32)
	returns int32
	is nativeconv("stdcall")
	{ * }
	
sub SetWallpaper ($filename) is export {
	# TODO: check whether provided filename exists
	SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $filename, $SPIF_UPDATEANDSENDINI);
}

SetWallpaper("E:/Wallpapers/1305281760696.jpg");

#People trying to help on IRC: retupmoca, RabidGravy, Skarsnik, FROGGS