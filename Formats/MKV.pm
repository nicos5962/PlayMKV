package Plugins::PlayMKV::Formats::MKV;

# Matroska files are read like AVI files: see Plugins::PlayAVI::Formats::AVI
# for the tags (ffprobe, guessed from the path, Discogs id). This plugin needs
# the PlayAVI plugin.

use strict;
use warnings;
use base qw(Plugins::PlayAVI::Formats::AVI);

sub types       { qw(mkv) }
sub logCategory { 'plugin.playmkv' }
sub pluginName  { 'PlayMKV' }

1;
