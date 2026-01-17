# DEVELOPMENT

We use `Minilla` as our authoring tool and `Carton` for managing module
dependencies.

## Development Environment
```bash
$ cpanm Carton
$ carton install --deployment
```

## How to Test
```bash
$ carton exec perl Build.PL
$ carton exec ./Build build
$ carton exec ./Build test
```

## How to Format
```bash
$ author/format.sh
```
