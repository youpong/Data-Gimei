requires 'File::Share';
requires 'Gimei';
requires 'Moo';
requires 'YAML';
requires 'feature';
requires 'version', '0.77';

on configure => sub {
    requires 'Module::Build::Tiny', '0.035';
    requires 'perl', '5.008_001';
};

on test => sub {
    requires 'Test::More', '0.98';
};
