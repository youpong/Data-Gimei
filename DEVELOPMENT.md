# DEVELOPMENT

We use `Minilla` as our authoring tool and `Carton` for managing module
dependencies.

## Development Environment
```bash
$ cpanm -n Carton
$ carton install
```

## How to Test
```bash
$ carton exec perl Build.PL
$ carton exec perl Build build
$ carton exec perl Build test
```

## How to REPL(Read-Eval-Print-Loop)
```bash
$ carton exec reply
```

## How to Format
```bash
$ carton exec perl author/format.pl
```

## How to Release to CPAN
```bash
$ carton exec minil test
$ carton exec -- minil release --dry-run
$ carton exec minil release
```

```bash
$ docker build -t gimei .
$ docer run --rm -it -v$PWD:/gimei gimei
```

git clone https://github.com/tokuhirom/plenv.git ~/.plenv
echo 'export PATH="$HOME/.plenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(plenv init -)"' >> ~/.bash_profile
exec $SHELL -l
git clone https://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/
plenv install 5.18.0
