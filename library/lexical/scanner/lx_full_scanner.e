indexing

	description:

		"Scanners implemented with full tables"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_FULL_SCANNER

inherit

	LX_SCANNER
		undefine
			reset
		redefine
			yy_accept, yy_ec
		end

	YY_FULL_SCANNER_SKELETON
		rename
			make as make_scanner_skeleton,
			make_with_file as make_scanner_with_file_skeleton,
			make_with_buffer as make_scanner_with_buffer_skeleton
		redefine
			yy_accept, yy_ec,
			yy_nxt
		end

	LX_FULL_TABLES
		export
			{LX_FULL_TABLES} all;
			{ANY} to_tables, from_tables
		redefine
			yy_accept, yy_ec,
			yy_nxt
		end

creation

	make, make_with_file, make_with_buffer

feature {LX_FULL_TABLES} -- Tables

	yy_nxt: ARRAY [INTEGER]
			-- States to enter upon reading symbol;
			-- indexed by (current_state_id * yyNb_rows + symbol)

	yy_ec: ARRAY [INTEGER]
			-- Equivalence classes;
			-- Void if equivalence classes are not used

	yy_accept: ARRAY [INTEGER]
			-- Accepting ids indexed by state ids

end -- class LX_FULL_SCANNER
