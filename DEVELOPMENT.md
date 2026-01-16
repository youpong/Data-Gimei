# DEVELOPMENT

We use `Minilla` as our authoring tool.

## Development Environment
```bash
$ cpanm -n --with-confiugre --with-develop --with-test --installdeps .
```

## How to Test
```bash
$ ./Build.PL
$ ./Build test
```

## How to Format
```bash
$ author/format.sh
```
