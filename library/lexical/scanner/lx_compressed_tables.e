indexing

	description:

		"Compressed tables for scanners"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_COMPRESSED_TABLES

inherit

	LX_TABLES

creation

	make_from_tables

feature -- Tables

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

feature -- Constants

	yyJam_state: INTEGER
			-- State id corresponding to "jam" state

	yyJam_base: INTEGER
			-- Position in `yy_nxt'/`yy_chk' tables where
			-- default jam table starts

	yyTemplate_mark: INTEGER
			-- Mark between normal states and templates

	yyReject_used: BOOLEAN
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN
			-- Is there a regular expression with both leading
			-- and trailing parts having variable length?
	
feature -- Conversion

	from_tables (other: like to_tables) is
			-- Set current tables with those of `other'.
		do
			yy_nxt := other.yy_nxt
			yy_chk := other.yy_chk
			yy_base := other.yy_base
			yy_def := other.yy_def
			yy_accept := other.yy_accept
			yy_acclist := other.yy_acclist
			yy_ec := other.yy_ec
			yy_meta := other.yy_meta
			yy_rules := other.yy_rules
			yy_eof_rules := other.yy_eof_rules
			yy_start_conditions := other.yy_start_conditions
			yyJam_state := other.yyJam_state
			yyJam_base := other.yyJam_base
			yyTemplate_mark := other.yyTemplate_mark
			yyNull_equiv_class := other.yyNull_equiv_class
			yyReject_used := other.yyReject_used
			yyVariable_trail_context := other.yyVariable_trail_context
			yyNb_rules := other.yyNb_rules
			yyEnd_of_buffer := other.yyEnd_of_buffer
			yyLine_used := other.yyLine_used
			yyPosition_used := other.yyPosition_used
		end

	to_tables: LX_COMPRESSED_TABLES is
			-- New compressed tables made from current tables
		do
			!! Result.make_from_tables (Current)
		end

invariant

	yy_nxt_not_void: yy_nxt /= Void
	yy_chk_not_void: yy_chk /= Void
	yy_base_not_void: yy_base /= Void
	yy_def_not_void: yy_def /= Void

end -- class LX_COMPRESSED_TABLES
