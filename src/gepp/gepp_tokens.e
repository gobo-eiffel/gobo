indexing

	description:

		"Token codes for parsers for 'gepp' preprocessors"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class GEPP_TOKENS

feature -- Access

	P_IFDEF: INTEGER is 257
	P_IFNDEF: INTEGER is 258
	P_INCLUDE: INTEGER is 259
	P_DEFINE: INTEGER is 260
	P_UNDEF: INTEGER is 261
	P_NAME: INTEGER is 262
	P_DEF_VALUE: INTEGER is 263
	P_ELSE: INTEGER is 264
	P_ENDIF: INTEGER is 265
	P_EOL: INTEGER is 266
	P_OR: INTEGER is 267
	P_AND: INTEGER is 268

end -- class GEPP_TOKENS
