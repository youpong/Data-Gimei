requires 'perl', '5.010';

requires 'Class::Tiny';
requires 'File::Share';
requires 'version';
requires 'YAML::XS';

on configure => sub {
    requires 'Module::Build::Tiny';
};

on develop => sub {
    requires 'CPAN::Uploader';
    requires 'Minilla';
    requires 'Perl::Tidy';
    requires 'Software::License::MIT';
    requires 'Version::Next';
};

on test => sub {
    requires 'Test2::Bundle::More';
};
