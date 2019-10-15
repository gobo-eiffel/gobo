# Gobo Eiffel Lexical Example: Unicode scanner unicode mode

This folder contains the source code for a simple scanner which can
read either ISO-8859-1 input files (with no BOM) or UTF-8 input files
(with a BOM). The tokens are either spaces (as defined in Unicode) and
newlines, the symbols `-+∀∃`, or words made up of Unicode characters
other than those already used in spaces/newlines and symbols.

It uses `gelex` to generate class `UNICODE_MODE` from a scanner description
where the regular expressions are made up of the expected Unicode characters.
There is no internal conversion to UTF-8 byte sequences. The input buffer 
used for this scanner is a `YY_UNICODE_FILE_BUFFER` which converts (if
needed) the characters or UTF-8 byte sequences read from the input files
to `CHARACTER_32` Unicode characters.

**To compile and run this example:**

1. Use the script `geant scanner` to generate class `UNICODE_MODE`
   if necessary.

2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided ECF file. Alternatively you can use `geant` to launch 
   the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

3. Execute the Unicode scanner using:

        unicode_mode input_filename output_filename

    Examples of input and output files can be found in `data` subfolder.

## Authors

Copyright (c) 2019, Eric Bezault and others
