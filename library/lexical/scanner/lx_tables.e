indexing

	description:

		"Tables for scanners"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class LX_TABLES

inherit

	KL_IMPORTED_ARRAY_ROUTINES

feature {NONE} -- Initialization

	make_from_tables (other: like to_tables) is
			-- Make new scanner tables from `other'.
		require
			other_not_void: other /= Void
		do
			from_tables (other)
		ensure
			-- set: forall attribute, attribute = other.attribute
		end

feature -- Tables

	yy_accept: ARRAY [INTEGER]
			-- Accepting ids indexed by state ids

	yy_ec: ARRAY [INTEGER]
			-- Equivalence classes;
			-- Void if equivalence classes are not used

	yy_rules: ARRAY [LX_RULE]
			-- Rules with associated semantic actions

	yy_eof_rules: ARRAY [LX_RULE]
			-- End-of-file rules with associated semantic actions

	yy_start_conditions: ARRAY [STRING]
			-- Start condition names, indexed by start condition ids

feature -- Constants

	yyNb_rules: INTEGER
			-- Number of rules

	yyEnd_of_buffer: INTEGER
			-- End of buffer rule code

	yyNull_equiv_class: INTEGER
			-- Equivalence code for NULL character

	yyLine_used: BOOLEAN
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN
			-- Is `position' used?

feature -- Conversion

	from_tables (other: like to_tables) is
			-- Set current tables with those of `other'.
		require
			other_not_void: other /= Void
		deferred
		ensure
			-- set: forall attribute, attribute = other.attribute
		end

	to_tables: LX_TABLES is
			-- New scanner tables made from current tables
		deferred
		ensure
			tables_not_void: Result /= Void
			-- set: forall attribute, Result.attribute = attribute
		end

invariant

	yy_accept_not_void: yy_accept /= Void
	yy_rules_not_void: yy_rules /= Void
	no_void_rules: not ANY_ARRAY_.has (yy_rules, Void)
	yy_eof_rules_not_void: yy_eof_rules /= Void
	yy_start_conditions_not_void: yy_start_conditions /= Void
	no_void_start_condition: not ANY_ARRAY_.has (yy_start_conditions, Void)

end -- class LX_TABLES
