requires 'File::Share';
requires 'Moo';
requires 'YAML::XS';
requires 'feature';
requires 'version', '0.77';

on configure => sub {
    requires 'Module::Build::Tiny', '0.035';
    requires 'perl', '5.010_001';
};

on test => sub {
    requires 'Test::More', '0.98';
};
