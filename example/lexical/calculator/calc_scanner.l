%{
indexing

	description:

		"Scanners for a simple calculator"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class CALC_SCANNER

inherit

	YY_INTERACTIVE_SCANNER_SKELETON
		rename
			make as make_interactive_scanner_skeleton,
			reset as reset_interactive_scanner_skeleton
		redefine
			last_token
		end

	CALC_PARSER
		rename
			make as make_parser,
			reset as reset_parser
		redefine
			last_token
		end

creation

	make
%}

%option nodefault outfile="calc_scanner.e"

DIGIT		[0-9]+
WS			[ \t\r]+

%%

{WS}		-- Ignore whitespaces.
\n			last_token := Token_EOL
		
{DIGIT}	{
			last_value := text.to_integer
			last_token := Token_NUMBER
		}

.		{	last_token := text_item (1).code
		}

%%

feature {NONE} -- Initialization

	make is
		do
			make_interactive_scanner_skeleton
			make_parser
		end

feature -- Initialization

	reset is
		do
			reset_interactive_scanner_skeleton
			reset_parser
		end

feature -- Access

	last_token: INTEGER
			-- Last token read by the scanner

end -- class CALC_SCANNER
