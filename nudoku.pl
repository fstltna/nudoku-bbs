#!/usr/bin/perl
use strict;
use warnings;

use UI::Dialog;
use Term::ReadKey;
use Term::ANSIScreen qw(cls);
use Time::Piece;

my $GameEXE = "/sbbs/doors/nudoku-bbs/bin/nudoku";

###################################################
# No changes below here
###################################################

my $CR_ver = "1.0";

my $d = new UI::Dialog ( backtitle => "Nudoku Version v$CR_ver", height => 20, width => 65, listheight => 5,
	order => [ 'ascii', 'cdialog', 'xdialog' ]);

my $windowtitle = "Welcome to Nudoku!";
my $enjoyedtitle = "We hope you enjoyed Nudoku!";

my $menuselection = "";

sub MainMenu
{
	$menuselection = $d->menu( title => 'Main Menu', text => 'Select one:',
                            list => [ '1', 'Play Easy Game',
                                      '2', 'Play Normal Game',
                                      '3', 'Play Hard Game',
                                      'q', 'Quit' ] );
}

while (-1)
{
	MainMenu();
	if (($menuselection eq "CANCEL") || ($menuselection eq "ESC") || ($menuselection eq "") || ($menuselection eq "q"))
	{
		$d->msgbox( title => $enjoyedtitle, text => "Thanks for playing..." );
		exit 0;
	}
	if ($menuselection eq "1")
	{
		# Run the easy game
		system("$GameEXE -d easy");
	}
	elsif ($menuselection eq "2")
	{
		# Run the easy game
		system("$GameEXE -d normal");
	}
	elsif ($menuselection eq "3")
	{
		# Run the easy game
		system("$GameEXE -d hard");
	}
}

exit 0;
