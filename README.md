
# Package Compiler Issue Demonstration

This repo demonstrates an issue with `PackageCompiler.jl` on Julia v1.6 Beta 1
with the following environment:

```
Status `~/Documents/src/package-compiler-issue/Project.toml`
  [4f18b42c] BusinessDays v0.9.12
  [09453d48] InterestRates v0.4.5
  [9b87118b] PackageCompiler v1.2.5
```

## Create a system image

```
julia gen_sysimg.jl
```

As a result, a `sysimg.so` file will be created at user's home dir.
The file location is printed by the script.

## Start julia with

The following command yields an error:

```
julia --sysimage=$HOMEDIR/sysimg.so
```

## Results

### macOS

Version Info:

```
julia> versioninfo()
Julia Version 1.6.0-beta1
Commit b84990e1ac (2021-01-08 12:42 UTC)
Platform Info:
  OS: macOS (x86_64-apple-darwin19.6.0)
  CPU: Intel(R) Core(TM) i7-4960HQ CPU @ 2.60GHz
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.0 (ORCJIT, haswell)
```

Error message:

```
➜  ~ julia-1.6 sysimage.so
ERROR: LoadError: syntax: invalid UTF-8 sequence
Stacktrace:
 [1] top-level scope
   @ ~/sysimage.so:1
in expression starting at /Users/felipenoris/sysimage.so:1
```

### Linux
