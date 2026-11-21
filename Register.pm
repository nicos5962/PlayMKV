package Plugins::PlayMKV::Register;

# Registers the PlayMKV tag handler. Kept free of any web/UI dependency so it
# can be used by both the server plugin and the scanner importer.

use strict;
use warnings;

use Slim::Formats;
use Slim::Utils::Log;

use constant HANDLER => 'Plugins::PlayMKV::Formats::MKV';

my $log = logger('plugin.playmkv');

# Server types of the plugin (see custom-types.conf)
my @types = qw(mkv);

sub registerFormatHandler {
    my ($class, $tagClasses) = @_;

    Slim::Formats->init();

    $tagClasses ||= \%Slim::Formats::tagClasses;

    return 0 unless ref($tagClasses) eq 'HASH';

    for my $type (@types) {
        next if defined $tagClasses->{$type} && $tagClasses->{$type} eq HANDLER;

        $tagClasses->{$type} = HANDLER;

        main::DEBUGLOG && $log->is_debug && $log->debug("PlayMKV: registered $type tag handler");
    }

    return 1;
}

1;
