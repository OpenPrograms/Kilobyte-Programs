# Config Parser Library

An option is a keyword, followed by any amount of whitespace seperated arguments and optionally a block. if no block is supplied, the option has to be terminated with a semicolon

Example options:

```
foo bar; # with 1 argument
debug;   # no arguments
```

Examples with blocks:

```
do {
    stuff;
}

filter mystuff {
    hello world;
}
```