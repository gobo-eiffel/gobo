%{
indexing

	description:

		"Scanners for a simple calculator";

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class CALC_SCANNER

inherit

	YY_INTERACTIVE_SCANNER_SKELETON
		rename
			make as make_interactive_scanner_skeleton,
			reset as reset_interactive_scanner_skeleton
		end

	CALC_PARSER
		rename
			make as make_parser,
			reset as reset_parser
		end

creation

	make
%}

%option nodefault outfile="calc_scanner.e"

DIGIT		[0-9]+
WS			[ \t\r]+

%%

{WS}		-- Ignore whitespaces.
\n			-- Ignore newlines.
{DIGIT}	{
			last_value := text.to_integer
			last_token := Token_digit
		}

.			last_token := text_item (1).code

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

end -- class CALC_SCANNER
