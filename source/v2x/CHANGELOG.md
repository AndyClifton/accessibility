# CHANGELOG

2023 January 18 (Version 2.1.0):
    - -sty file recompiled with the MacTex-2022 distribution. 
    
    This version should be backward compatible with 2.0.x.

2023 January 17 (Version 2.0.5):
    - Modified the .dtx file to ...
      - remove naming conflicts with the lineno package as suggested by Teresa Pelinski in [PR49](https://github.com/AndyClifton/accessibility/pull/49). _That PR contained updates to the .sty file only, which had to be implemented in the .dtx file_
      - make minor updates to the way environment names are given in the _.dtx_ file due to changes in _.dtx_ file processing. These do not affect the package function or _.sty_ file.
    - Removed the _titlesec_ package from _anleitung-DE.tex_ to solve an incompatibility that only affected the accessibility package's documentation.

2019 Nov 2:
    - Fixed problems with with umlauts in german-language documentation (approx 600 changes made by hand. Thank you, file encodings...)

2019 Oct. 13:
    - split the version 1 code from the version 2 code.
    - renamed all version 2 files to work with the .ins / .dtx paradigm
    - borrowed a CTAN make file from the LNI Project (https://github.com/gi-ev/LNI) to correctly structure the .zip file that I will submit to CTAN
    - split the samples out into their own directories, separate from the source files
