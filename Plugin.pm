package Plugins::PlayMKV::Plugin;

use strict;
use warnings;

use base qw(Slim::Plugin::Base);

use Slim::Utils::Log;
use Plugins::PlayMKV::Register;

my $log = Slim::Utils::Log->addLogCategory({
    category     => 'plugin.playmkv',
    defaultLevel => 'INFO',
    description  => 'PLUGIN_PLAYMKV',
});

sub initPlugin {
    my $class = shift;

    my $version = $class->_pluginDataFor('version') || 'unknown';
    $log->info("Initializing PlayMKV plugin $version");

    Plugins::PlayMKV::Register->registerFormatHandler();

    $class->SUPER::initPlugin(@_);
}

sub getDisplayName { 'PLUGIN_PLAYMKV' }

1;
