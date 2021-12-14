requires 'perl', '5.010_001';
requires 'File::Share';
requires 'Moo';
requires 'YAML';
requires 'feature';
requires 'version', '0.77';

on configure => sub {
    requires 'Module::Build::Tiny', '0.035';
};

on test => sub {
    requires 'Test::More', '0.98';
};
