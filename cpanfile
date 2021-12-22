requires 'File::Share';
requires 'Lingua::JA::Kana';
requires 'Moo';
requires 'YAML::XS';
requires 'feature';
requires 'namespace::clean';
requires 'version', '0.77';

on configure => sub {
    requires 'Module::Build::Tiny', '0.035';
    requires 'perl', '5.008_001';
};

on test => sub {
    requires 'Test::More', '0.98';
};
