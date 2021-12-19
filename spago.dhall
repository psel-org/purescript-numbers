{ name = "numbers"
, dependencies = [ "functions", "math", "maybe" ] # [ "assert", "effect", "prelude", "console" ]
, packages =
    https://raw.githubusercontent.com/psel-org/package-sets/main/src/el-0.14.5-20211116/packages.dhall
, backend = "psel"
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
