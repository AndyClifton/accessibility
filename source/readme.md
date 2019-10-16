[![Build Status](https://travis-ci.org/AndyClifton/accessibility.svg?branch=master)](https://travis-ci.org/AndyClifton/accessibility)

# How to compile accessibility.sty

## Working versions
October 13, 2019: The current versions are kept in the `v2x` directory.

## How to modify the `accessibility.sty` file

Don't. You can't modify it directly. It's created from the `accessibility.ins` (configuration) and `accessibility.dtx` (content) files. So, to make a change to `accessibilty.sty`, you actually need to modify the `accessibility.dtx` file.

You can then update `accessibility.sty` by running `accessibility.ins` through latex:

```bash
latex accessibility.ins
```

## Testing `accessibility.sty`
The basic test for `accessibility.sty` is to see if documents that use it compile.

The `v2x/tests.sh` script compiles several demo documents that use the `accessibility` package. These tests have not been integrated with travis or any other CI service.

You should check the quality of the PDF files and confirm that they are OK.

## Preparing for submission to CTAN
### 1. Update all version information


### 2. Gather files
The `v2x/prepare_for_CTAN.sh` script prepares the `accessibility` package for CTAN using the `ctanify` perl script. `ctanify` is included in all latex distributions.

For more information about ctanify, see http://ftp.fau.de/ctan/support/ctanify/ctanify.pdf.

The `prepare_for_CTAN.sh` script creates a file, `v2x/accessibilty.tar.gz` that should / must contain all of the files required for CTAN.

For more information, see
- https://ctan.org/help/upload-pkg
- https://ctan.org/file/help/ctan/CTAN-upload-addendum.

### 3. Upload to CTAN
`v2x/accessibilty.tar.gz` should be submitted to CTAN through https://ctan.org/upload.

Note:
- The package location at CTAN should be `macros/latex/contrib/accessibility/``
