indexing

	description:

		"Scanners implemented with compressed tables"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_COMPRESSED_SCANNER

inherit

	LX_SCANNER
		undefine
			reset
		redefine
			yy_accept, yy_ec, -- yy_null_trans,
			yy_initialize
		end

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_scanner_skeleton,
			make_with_file as make_scanner_with_file_skeleton,
			make_with_buffer as make_scanner_with_buffer_skeleton
		redefine
			yy_accept, yy_ec, -- yy_null_trans,
			yy_nxt, yy_chk, yy_base, yy_def,
			yy_acclist, yy_meta,
			yy_initialize
		end

	LX_COMPRESSED_TABLES
		export
			{LX_COMPRESSED_TABLES} all
			{ANY} to_tables, from_tables
		redefine
			yy_accept, yy_ec, -- yy_null_trans,
			yy_nxt, yy_chk, yy_base, yy_def,
			yy_acclist, yy_meta
		end

creation

	make, make_with_file, make_with_buffer

feature {NONE} -- Initialization

	yy_initialize is
			-- Initialize lexical analyzer.
		do
			yy_build_tables
			yy_start_state := 1
			if yyReject_used or yyVariable_trail_context then
				yyReject_or_variable_trail_context := True
				!! yy_state_stack.make (1, yyBuffer_capacity + 1)
			end
		end

feature {LX_COMPRESSED_TABLES} -- Tables

	yy_nxt: ARRAY [INTEGER]
			-- States to enter upon reading symbol

	yy_chk: ARRAY [INTEGER]
			-- Check value to see if `yy_nxt' applies

	yy_base: ARRAY [INTEGER]
			-- Offsets into `yy_nxt' for given states

	yy_def: ARRAY [INTEGER]
			-- Where to go if `yy_chk' disallows `yy_nxt' entry

	yy_acclist: ARRAY [INTEGER]
			-- Accepting id list, used when `reject' is called 
			-- or when there is a variable length trailing context;
			-- Void otherwise

	yy_meta: ARRAY [INTEGER]
			-- Meta equivalence classes which are sets of classes
			-- with identical transitions out of templates;
			-- Void if meta equivalence classes are not used

	yy_ec: ARRAY [INTEGER]
			-- Equivalence classes;
			-- Void if equivalence classes are not used

	yy_accept: ARRAY [INTEGER]
			-- Accepting ids indexed by state ids

--	yy_null_trans: ARRAY [INTEGER]
--			-- Null transition table
--			--| Note: this table is not used in the current implementation.

feature {NONE} -- Constants

	yyReject_or_variable_trail_context: BOOLEAN
			-- Is `reject' called or is there a regular expression with
			-- both leading and trailing parts having variable length?
	
end -- class LX_COMPRESSED_SCANNER
