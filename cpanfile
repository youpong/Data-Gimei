requires 'File::Share';
requires 'Moo';
requires 'YAML::XS';
requires 'feature';
requires 'namespace::clean';
requires 'version';

on configure => sub {
    requires 'Module::Build::Tiny', '0.035';
    requires 'perl', '5.008_001';
};

on develop => sub {
    requires 'Perl::Tidy';
};

on test => sub {
    requires 'Test::More';
};
