Gobo Eiffel Yacc (geyacc) is an adaptation of GNU Bison (version 1.25),
distributed by the Free Software Foundation, so that it can generate
Eiffel classes instead of C files.

The original version of GNU Bison (version 1.25) can be downloaded from
"ftp://prep.ai.mit.edu/pub/gnu". The following files have been modified:

	files.c
	getargs.c
	lex.c
	output.c
	reader.c
	symtab.c
	version.c

and the following files have been removed:

	bison.info*
	bison.texinfo
	texinfo.tex

The HTML documentation provided with geyacc in "$GOBO\doc\geyacc" is
also an adaptation of the manual for GNU Bison.

Geyacc is distributed under the same terms and conditions as GNU Bison.
See COPYING file for details.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE.

--
Eric Bezault <eric@gobo.demon.co.uk>
