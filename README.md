![Status](https://img.shields.io/badge/Prototype-Not%20suitable%20from%20production%20-red)

# The `Accessibility` LaTeX package

Authors: Babett Schalitz, Andrew (Andy) Clifton

This repository contains the files required to build and test the `accessibility` LaTeX package.

`Accessibility` was written as a proof-of-concept showing how to improve the structure and tagging of PDF files generated from LaTeX. These features make PDF documents machine readable and thus enable document readers (e.g. the Adobe Acrobat series) to automatically process and present the document.

This package is predominantly targeted at documents produced using the [KOMA-Script document classes](https://ctan.org/pkg/koma-script). **It is not suitable for general production use with LaTeX Documents**


## News
25 June 2020: We need help to improve the  package, and potentially tie some of its ideas into core LaTeX. Do you have ideas for how we could fund a professional software developer to support us? Please contribute your ideas to https://github.com/AndyClifton/accessibility/issues/42. 

## History

The package was originally created as part of a diploma thesis by Babett Schalitz in 2007. The thesis was called 'Accessibility-Erhöhung von LATEX-Dokumenten'. More information can be found at [her home page](http://babs.gmxhome.de/da_start.htm).

Andy Clifton took on maintenance of the package in May 2019 with permission and support from Babett Schalitz. Babett provided copies of the original files from 2007, not all of which were available online before. Those files can be found in the [source/v1](/source/v1) directory and as [release v0.2](releases/tag/v0.2-beta).

The immediate goal was to get `accessibility` on to [CTAN](http://www.ctan.org). It is now available there and as of November 2019 it is included in the TEXLive and MIKTEX distributions.

Several changes were required to the source code to make it CTAN compliant. The updated source code for `accessibility` can be found in [source/v2](/source/v2) directory. More information can also be found in that directory.

## What's in this repository
This repository contains all of the files required to build and test the accessibility.sty file. **It is not intended to be used directly in LaTeX.**

## Using the `accessibility` packge

** Please note that the package was a proof of concept and has significant problems. Notably, it fails when structures include page breaks, which makes it unusable for most applications. **

If you want to see how it works anyway, keep reading.

### Installation 
#### ... from CTAN

If all you want is to use `accessibility` on one of your documents, then this is not the repository you are looking for.

You can obtain the `accessibility` package [through CTAN](https://ctan.org/pkg/accessibility). That distribution has all of the files that you might require to install accessibility on your system. I suggest installation using an appropriate package manager.

#### ... from source (not recommended)
If you really want to download the `accessibility` package from here, please download the current release from [releases/](https://github.com/AndyClifton/accessibility/releases). You can then install it on your own system. I cannot provide any help for this. Please see [the 'Tex stackexchange for more information on the installation process](https://tex.stackexchange.com/questions/1137/where-do-i-place-my-own-sty-or-cls-files-to-make-them-available-to-all-my-te).

###  Using the package
Include

`\usepackage[tagged, _options_]{accessibility}`

in your preamble, where options should include either `highstructure` or `flatstructure`. Compile as normal.

### Checking the output
You should use a tool such as Adobe Acrobat or [PAC3](https://www.access-for-all.ch/ch/pdf-werkstatt/pdf-accessibility-checker-pac.html) to check the output. Please see the manuals for those tools for more information.

### Support, bugs, errors, and feedback
This package is experimental.

This style file might or might not work. The PDF output might be junk. Or you might have a document that needs something more. You might also have a suggestion on how to fix something.

Please report all problems and ideas to [the accessibility package issue tracker on Github](https://github.com/AndyClifton/accessibility/issues). Also, please note that I cannot enter into detailed discussions about individual documents, but am happy to address anything that might impact all users.

## Licence

This material is subject to the [LaTeX Project Public License](https://ctan.org/license/lppl1.3c).

## Cooperation and Collaboration
Now that the licensing for this package is clearly defined, I hope people will consider collaborating on maintaining and improving the package. If you are interested, please just get on and do whatever, or raise an issue to discuss.

