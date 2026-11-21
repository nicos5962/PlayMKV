package Plugins::PlayMKV::Importer;

use strict;
use warnings;

use Plugins::PlayMKV::Register;

sub initPlugin {
    my $class = shift;

    Plugins::PlayMKV::Register->registerFormatHandler();
    return 1;
}

sub startScan {
    my $class = shift;
    return;
}

1;
