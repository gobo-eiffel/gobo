indexing

	description:

		"Full tables for scanners"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_FULL_TABLES

inherit

	LX_TABLES

creation

	make_from_tables

feature -- Tables

	yy_nxt: ARRAY [INTEGER]
			-- States to enter upon reading symbol;
			-- indexed by (current_state_id * yyNb_rows + symbol)

feature -- Constants

	yyNb_rows: INTEGER
			-- Number of rows in `yy_nxt'

	yyBacking_up: BOOLEAN
			-- Does the scanner back up?
			-- (i.e. does it have non-accepting states)

feature -- Conversion

	from_tables (other: like to_tables) is
			-- Set current tables with those of `other'.
		do
			yy_nxt := other.yy_nxt
			yy_accept := other.yy_accept
			yy_ec := other.yy_ec
			yy_rules := other.yy_rules
			yy_eof_rules := other.yy_eof_rules
			yy_start_conditions := other.yy_start_conditions
			yyNull_equiv_class := other.yyNull_equiv_class
			yyNb_rules := other.yyNb_rules
			yyEnd_of_buffer := other.yyEnd_of_buffer
			yyNb_rows := other.yyNb_rows
			yyBacking_up := other.yyBacking_up
		end

	to_tables: LX_FULL_TABLES is
			-- New full tables made from current tables
		do
			!! Result.make_from_tables (Current)
		end

invariant

	yy_nxt_not_void: yy_nxt /= Void

end -- class LX_FULL_TABLES
