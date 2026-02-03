# DEVELOPMENT

We use `Minilla` as our authoring tool and `Carton` for managing module
dependencies.

We considered using `App::Yath`, a test harness CLI, but it does not support
Windows and was therefore not adopted.

## Development Environment

### Install modules
```bash
$ cpanm -n Carton@v1.0.35
$ carton install
```

### Build

Create a ./Build script.
Once the ./Build script is created, it does not need to be recreated.
```bash
$ carton exec perl Build.PL
```

Build using the ./Build script.
```bash
$ carton exec perl Build build
```

### Test
```bash
$ carton exec perl Build test
```

The `prove` command is also available. 
```
$ carton exec -- prove -b -j8
```
Using the `-j` option appropriately for your system can improve throughput. 

The `-b` option includes `blib/lib` and `blib/arch` in the path. It tests
against the built artifacts.(this project does not generate blib/arch)

#### How to Test only the specified test files
```bash
$ carton exec -- prove -bv t/address.t
```
`-v` option print all test lines.

### perldoc modules in local/
```bash
$ carton exec perldoc Module::Name
```

### How to REPL(Read-Eval-Print-Loop)
```bash
$ carton exec -- reply -Iblib/lib
```

### How to Debug
```bash
$ carton exec -- perl -Iblib/lib -d t/address.t
```

You can stop execution by adding the following line.
```perl
$DB::single = 1;
```

### How to Format
```bash
$ carton exec perl author/format.pl
```

### How to Release to CPAN
```bash
$ carton exec minil test
$ carton exec -- minil release --dry-run
$ carton exec minil release
```

## Docker
```bash
$ docker build -t gimei .
$ docker run --rm -it -v$PWD:/gimei gimei bash -l
```
