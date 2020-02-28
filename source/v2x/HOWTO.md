# Notes to v2x Source
These versions are based almost entirely on Babett's hard work. I have made
some changes to the source code to make the output files conform to CTAN
requirements and to make it simpler to work with GitHub. See [CHANGELOG.md](v2x/CHANGELOG.md) for details.

## File manifest

### Markdown
- README.md: This file will be included in the submission to CTAN.
- CHANGELOG.md: a changelog.

## LaTeX
- accessibility.dtx: The accessibility package, which will be included in the submission to CTAN
- compatability.tex:
- anleitung-DE.tex: instructions (in German)

### Scripts
- make_accessibility.sh:
- run_tests:
- prepare_for_CTAN:

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

This is implemented in the [`make_accessibility.sh`](make_accessibility.sh) script.

## Testing `accessibility.sty`

### Automated testing
The basic test for `accessibility.sty` is to see if documents that use it compile.

The [`run_tests.sh`](run_tests.sh) script compiles example documents that use the `accessibility` package. These are included in the [`../tests`](../tests) directory in this repository.

These tests are also run automatically when a new commit is made on Github.

### Manual testing
You should also _manually_ check the structure of the PDF files generated using `accessibility` and confirm that they are OK.

You can test the PDF files using e.g.:
- PDF Accessibility Checker (Windows only): https://www.access-for-all.ch/ch/pdf-werkstatt/pdf-accessibility-checker-pac.html
- The Tingtun Checker (web-based, makes tests without modifying): http://checkers.eiii.eu/en/pdfcheck/
- PAVE (web-based, makes makes changes automatically): http://pave-pdf.org/index.en.html
- Acrobat Pro: https://helpx.adobe.com/acrobat/using/create-verify-pdf-accessibility.html
- Common Look's PDF validator (a plugin for Adobe Acrobat that tests against multiple standadrds): https://commonlook.com/accessibility-software/pdf-validator/


## Preparing for submission to CTAN
### 1. Update all version information
Version information is included in [`accessibility.dtx`](v2x/accessibility.dtx). This information should be updated for every new submission to CTAN.

There are 3 locations where version information is included: search for the text, `VERSION INFO` and modify the version information in the lines following that marker.

### 2. Update the README.md and CHANGELOG.md files
See [`README.md`](README.md) and [`CHANGELOG.md`](v2x/CHANGELOG.md).

### 3. Gather files
The [`prepare_for_CTAN.sh`](prepare_for_CTAN.sh) script prepares the `accessibility` package for CTAN using the `ctanify` perl script. `ctanify` is included in all latex distributions.

For more information about `ctanify`, see [the package notes on CTAN](http://ftp.fau.de/ctan/support/ctanify/ctanify.pdf).

The `prepare_for_CTAN.sh` script creates a file, `v2x/accessibilty.tar.gz` that contains all of the files required for CTAN.

For more information about how to prepare files for upload to CTAN, see
- https://ctan.org/help/upload-pkg
- https://ctan.org/file/help/ctan/CTAN-upload-addendum.

### 4. Upload to CTAN
`accessibilty.tar.gz` should be submitted to CTAN through https://ctan.org/upload.

Note:
- The package location at CTAN is `macros/latex/contrib/accessibility/``

## Copyright and License

Copyright (C) 2007 Babett Schalitz
Copyright (C) 2019 Andrew Clifton

This work may be distributed and/or modified under the conditions of
the LaTeX Project Public License, either version 1.3c of this license
or (at your option) any later version.  The latest version of this
license is in

    http://www.latex-project.org/lppl.txt

and version 1.3c or later is part of all distributions of LaTeX version
2008/05/04 or later.
