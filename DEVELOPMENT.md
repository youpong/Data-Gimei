# DEVELOPMENT

We use `Minilla` as our authoring tool.

## Development Environment
```bash
$ cpanm -n --with-develop --installdeps .
```

## How to Test
```bash
$ perl Build.PL
$ ./Build build
$ ./Build test
```

## How to Format
```bash
$ author/format.sh
```
