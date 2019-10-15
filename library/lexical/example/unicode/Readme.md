# Gobo Eiffel Lexical Example: Unicode scanner

This folder is made up of three subfolders containing the source code
for a simple scanner which can read either ISO-8859-1 input files (with
no BOM) or UTF-8 input files (with a BOM). The tokens are either spaces
(as defined in Unicode) and newlines, the symbols `-+∀∃`, or words made
up of Unicode characters other than those already used in spaces/newlines
and symbols.

* `byte_mode`: the regular expressions in the scanner description
  are made up of the UTF-8 byte sequences of the expected Unicode
  characters. The input buffer used for this scanner is a 
  `YY_UTF8_FILE_BUFFER` which converts (if needed) the characters
  read from the input files to UTF-8 byte sequences.

* `utf8_mode`: the regular expressions in the scanner description
  are made up of the expected Unicode characters
  which are internally converted to their equivalent UTF-8 byte sequences
  thanks to the option `%option utf8`. The input buffer used for this scanner
  is a `YY_UTF8_FILE_BUFFER` which converts (if needed) the characters
  read from the input files to UTF-8 byte sequences.

* `unicode_mode`: the regular expressions in the scanner description
  are made up of the expected Unicode characters.
  There is no internal conversion to UTF-8 byte sequences. The input buffer 
  used for this scanner is a `YY_UNICODE_FILE_BUFFER` which converts (if
  needed) the characters or UTF-8 byte sequences read from the input files
  to `CHARACTER_32` Unicode characters.

In real programs, such as the parser of the Gobo Eiffel compiler, the
`utf8_mode` should produce scanners which have the same size and speed
as the `byte_mode`. The `byte_mode` is more error-prone to write and
maintain, whereas `gelex` takes more time to generate the scanner from
the `utf8_mode`. The `unicode_mode` is as user-friendly as the `utf8_mode`
when writing and maintaining the scanner, but `gelex` is as fast as
the `byte_mode` to generate the scanner. With the `unicode_mode`, the
generated scanner is smaller (smaller Eiffel tables, smaller executable
files) with no visible speed penalty.

## Authors

Copyright (c) 2019, Eric Bezault and others
