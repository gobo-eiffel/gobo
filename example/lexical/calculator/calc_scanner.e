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

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		do
			yy_nxt := yy_nxt_
			yy_chk := yy_chk_
			yy_base := yy_base_
			yy_def := yy_def_
			yy_ec := yy_ec_
			yy_meta := yy_meta_
			yy_accept := yy_accept_
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 45
-- Ignore whitespaces.
else
--|#line 46
last_token := Token_EOL
end
else
--|#line 48

			last_value := text.to_integer
			last_token := Token_NUMBER
		
end
else
if yy_act = 4 then
--|#line 53
	last_token := text_item (1).code
		
else
--|#line 0
fatal_error ("scanner jammed")
end
end
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			inspect yy_sc
			else
				terminate
			end
		end

feature {NONE} -- Tables

	yy_nxt_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    4,    5,    6,    7,    9,    8,   10,    3,   10,
			   10,   10,   10>>, 0)
		end

	yy_chk_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    1,    1,    1,    1,   12,   11,    3,   10,   10,
			   10,   10,   10>>, 0)
		end

	yy_base_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    0,    0,    7,    8,    0,    8,    0,    0,    0,
			    8,    4,    2>>, 0)
		end

	yy_def_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,   10,    1,   10,   10,   11,   10,   12,   11,   12,
			    0,   10,   10>>, 0)
		end

	yy_ec_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    4,    4,
			    4,    4,    4,    4,    4,    4,    4,    4,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1>>, 0)
		end

	yy_meta_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    1,    2,    1,    3>>, 0)
		end

	yy_accept_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    0,    0,    6,    4,    1,    2,    3,    1,    3,
			    0>>, 0)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 8
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 10
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 11
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER is 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN is false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN is false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN is false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER is 5
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 6
			-- End of buffer rule code

	INITIAL: INTEGER is 0
			-- Start condition codes

feature -- User-defined features



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
