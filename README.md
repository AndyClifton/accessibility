![Status](https://img.shields.io/badge/Prototype-Not%20suitable%20from%20production%20-red)

# The `Accessibility` LaTeX package

Authors: Babett Schalitz, Andrew (Andy) Clifton

`Accessibility` was written as a proof-of-concept showing how to improve the structure and tagging of PDF files generated from LaTeX. These features would make PDF documents machine readable and thus enable document readers (e.g. the Adobe Acrobat series) to automatically process and present the document.

## What's in this repository
This repository contains all of the files required to build and test the accessibility.sty file. **It is not intended to be used directly in LaTeX.**

## News
- 23 Feb 2021: The question of accessibility in PDFs has now been taken up by the LaTeX project in a multiyear project and as a result **I am stopping all work on this package and it should be considered "not maintained"**. See https://www.latex-project.org/publications/indexbytopic/pdf/ for news about progress by the LaTeX project. The article, ["LaTeX Tagged PDF — A blueprint for a large project"](https://www.latex-project.org/publications/2020-FMi-TUB-tb129mitt-tagpdf.pdf) may be particularly useful as an overview.
- Nov 2019: The `accessibility` package is now available [through CTAN](https://ctan.org/pkg/accessibility).

## What the package did
`Accessibility` was written as a proof-of-concept showing how to improve the structure and tagging of PDF files generated from LaTeX. These features would make PDF documents machine readable and thus enable document readers (e.g. the Adobe Acrobat series) to automatically process and present the document.

This package was predominantly targeted at documents produced using the [KOMA-Script document classes](https://ctan.org/pkg/koma-script).

## Using the `accessibility` packge

`accessibility` should be considered broken and unusable for any application. If you want to see how it sort-of-works anyway, keep reading.

### Installation 
#### ... from CTAN
You can obtain the `accessibility` package [through CTAN](https://ctan.org/pkg/accessibility). That distribution has all of the files that you might require to install accessibility on your system. I suggest installation using an appropriate package manager.

#### ... from source (not recommended)
If you really want to download the `accessibility` package from here, please download the current release from [releases/](https://github.com/AndyClifton/accessibility/releases). You can then install it on your own system. I cannot provide any help for this. Please see [the 'Tex stackexchange for more information on the installation process](https://tex.stackexchange.com/questions/1137/where-do-i-place-my-own-sty-or-cls-files-to-make-them-available-to-all-my-te).

###  Using the package in a document
Include

`\usepackage[tagged, _options_]{accessibility}`

in your preamble, where options should include either `highstructure` or `flatstructure`. Compile as normal.

### Checking the output
You should use a tool such as Adobe Acrobat or [PAC3](https://www.access-for-all.ch/ch/pdf-werkstatt/pdf-accessibility-checker-pac.html) to check the output. Please see the manuals for those tools for more information.

## Known problems
- Changes to the LaTeX distribution since `acccessibility` was first released appear to have broken the package quite comprehensively. It is no longer recommended for use at all.
- `acccessibility` fails when sections cross page boundaries
- `acccessibility` was designed for KOMA-script documents.

See [the issue tracker](https://github.com/AndyClifton/accessibility/issues) for more.

## Support, bugs, errors, and feedback
This package was experimental and is no longer maintained.

This style file might or might not work. The PDF output might be junk. Or you might have a document that needs something more. You might also have a suggestion on how to fix something.

Please report all problems and ideas to [the accessibility package issue tracker on Github](https://github.com/AndyClifton/accessibility/issues). Please provide a minimum working example.

## History

The package was originally created as part of a diploma thesis by Babett Schalitz in 2007. The thesis was called 'Accessibility-Erhöhung von LATEX-Dokumenten'. More information can be found at [her home page](http://babs.gmxhome.de/da_start.htm).

Andy Clifton took on maintenance of the package in May 2019 with permission and support from Babett Schalitz. Babett provided copies of the original files from 2007, not all of which were available online before. Those files can be found in the [source/v1](/source/v1) directory and as [release v0.2](releases/tag/v0.2-beta).

My immediate goal was to get `accessibility` on to [CTAN](http://www.ctan.org). It is now available there and as of November 2019 it is included in the TEXLive and MIKTEX distributions.

Several changes were required to the source code to make it CTAN compliant. The updated source code for `accessibility` can be found in [source/v2](/source/v2) directory. More information can also be found in that directory.

## Cooperation and Collaboration
Now that the licensing for this package is clearly defined, I hope people will consider collaborating on maintaining and improving the package. If you are interested, please just get on and do whatever, or raise an issue to discuss.

### Licence

This material is subject to the [LaTeX Project Public License](https://ctan.org/license/lppl1.3c).
