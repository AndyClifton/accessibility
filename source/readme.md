[![Build Status](https://travis-ci.org/AndyClifton/accessibility.svg?branch=master)](https://travis-ci.org/AndyClifton/accessibility)

# How to use the source code repository for `accessibility.sty`

The following notes are intended for anyone who has forked this repository and is looking to modify the accessibility package.

## Contents
This directory contains two subdirectories, `v1` and `v2x`.

- `v1` is the original source code for the `accessibility` package. It is provided here for reference and to conform with the licensing requirements.
- `v2x` contains the development versions of the package and associated scripts.

## How to modify the `accessibility.sty` file
### The quick and dirty way
You could just modify `accessibility.sty` directly. This is fine for testing new ideas, but has the disadvantage that it is not how you are _supposed_ to do it (see following).

### The proper way
`accessibility.sty` is actually created from the `accessibility.ins` (configuration) and `accessibility.dtx` (content) files.

So, to make a change to `accessibilty.sty`, you need to first modify the `accessibility.dtx` file.

You can then update `accessibility.sty` by running `accessibility.ins` through latex:

```bash
latex accessibility.ins
```

This is implemented in the [`v2x/make_accessibility.sh`](v2x/make_accessibility.sh) script.

## Testing `accessibility.sty`
The basic test for `accessibility.sty` is to see if documents that use it compile.

The [`v2x/run_tests.sh`](v2x/run_tests.sh) script compiles several example documents that use the `accessibility` package. These are included in the [`../samples`](../samples) directory in the accessibility repository. These tests have not been integrated with travis or any other CI service.

You should check the structure of the PDF files and confirm that they are OK.

## Preparing for submission to CTAN
### 1. Update all version information
Version information is included in [`accessibility.dtx`](v2x/accessibility.dtx). This information should be updated for every new submission to CTAN.

There are 3 locations where version information is included: search for the text, `VERSION INFO` and modify the version information in the lines following that marker.

### 2. Update the README.md and CHANGELOG.md files
See [`v2x/README.md`](v2x/README.md) and [`v2x/CHANGELOG.md`](v2x/CHANGELOG.md).

### 3. Gather files
The [`v2x/prepare_for_CTAN.sh`](v2x/prepare_for_CTAN.sh) script prepares the `accessibility` package for CTAN using the `ctanify` perl script. `ctanify` is included in all latex distributions.

For more information about `ctanify`, see [the package notes on CTAN](http://ftp.fau.de/ctan/support/ctanify/ctanify.pdf).

The `prepare_for_CTAN.sh` script creates a file, `v2x/accessibilty.tar.gz` that contains all of the files required for CTAN.

For more information about how to prepare files for upload to CTAN, see
- https://ctan.org/help/upload-pkg
- https://ctan.org/file/help/ctan/CTAN-upload-addendum.

### 4. Upload to CTAN
`v2x/accessibilty.tar.gz` should be submitted to CTAN through https://ctan.org/upload.

Note:
- The package location at CTAN is `macros/latex/contrib/accessibility/``
