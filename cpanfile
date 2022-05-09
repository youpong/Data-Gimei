requires 'perl', '5.022001';
requires 'Carp';
requires 'Class::Tiny';
requires 'File::Share';
requires 'YAML::XS';
requires 'feature';
requires 'version';

on configure => sub {
    requires 'Module::Build::Tiny';
};

on develop => sub {
    requires 'Perl::Tidy';
};

on test => sub {
    requires 'Test::More';
};
