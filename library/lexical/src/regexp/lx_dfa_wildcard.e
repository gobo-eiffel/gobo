note

	description:
	"[
		Wildcards implemented with DFA engines.
		See note clause in class LX_PATTERN_MATCHER
		about Unicode vs. byte (8-bit character) modes.
		See note clause in class LX_WILDCARD about
		pattern syntax.
	]"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision:   "$Revision$"

class LX_DFA_WILDCARD

inherit

	LX_WILDCARD
		undefine
			matches,
			recognizes,
			unicode_matches,
			unicode_recognizes
		end

	LX_DFA_PATTERN_MATCHER

create

	make,
	compile,
	compile_case_insensitive,
	compile_case_sensitive,
	compile_unicode,
	compile_with_options

feature -- Element change

	compile_with_options (a_pattern: READABLE_STRING_GENERAL; i, u: BOOLEAN)
			-- Compile `a_pattern'.
			-- Make the matching engine case-insensitive if `i' is set.
			-- Enable Unicode mode if `u' is set.
			-- Set `compiled' to True after successful compilation.
		local
			a_parser: LX_WILDCARD_PARSER
			a_description: LX_DESCRIPTION
			an_error_handler: UT_ERROR_HANDLER
			a_dfa: LX_FULL_DFA
			a_full_tables: LX_FULL_TABLES
		do
			wipe_out
			pattern := a_pattern
			is_case_insensitive := i
			create an_error_handler.make_null
			create a_description.make
			a_description.set_equiv_classes_used (False)
			a_description.set_meta_equiv_classes_used (False)
			a_description.set_full_table (True)
			a_description.set_case_insensitive (i)
			create a_parser.make_from_description (a_description, an_error_handler)
			a_parser.parse_unicode_string (a_pattern)
			if a_parser.successful then
				create a_dfa.make (a_description)
				a_full_tables := a_dfa
				yy_nxt := a_full_tables.yy_nxt
				yy_accept := a_full_tables.yy_accept
				yyNb_rows := a_full_tables.yyNb_rows
				yyNull_equiv_class := a_full_tables.yyNull_equiv_class
			else
				yy_nxt := Void
				yy_accept := Void
				yyNb_rows := 0
				yyNull_equiv_class := 0
			end
		end

end
