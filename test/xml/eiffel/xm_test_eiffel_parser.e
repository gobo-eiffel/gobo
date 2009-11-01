indexing

	description:

		"Test features of class XM_EIFFEL_PARSER"

	test_status: "ok_to_run"
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TEST_EIFFEL_PARSER

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_parse_empty_string is
			-- Test feature `parse_from_string' with an empty input string.
		do
			create parser.make
			parser.parse_from_string ("")
			assert ("not_correct", not parser.is_correct)
			assert_strings_equal ("no_element", "STRING:1:1:parse error", parser.last_error_extended_description)
		end

	test_entity_quoted_quote is
			--Test quote/apos in quote.
		do
			create parser.make
			parser.parse_from_string ("<!DOCTYPE doc [ <!ENTITY t '%" %"'> ]> <doc>&t;</doc>")
			assert ("quote_in_apos", parser.is_correct)

			create parser.make
			parser.parse_from_string ("<!DOCTYPE doc [ <!ENTITY t %"' '%"> ]> <doc>&t;</doc>")
			assert ("apos_in_quote", parser.is_correct)
		end

	test_entity_error is
			-- Test entity error.
		do
			create parser.make
			parser.parse_from_string ("<!DOCTYPE doc [ <!ELEMENT doc ANY> <!ENTITY h '<<zork'> ]><doc>&h;</doc>")
			assert ("not_correct", not parser.is_correct)
			assert_strings_equal ("error_message", "h:1:2:Misformed start tag", parser.last_error_extended_description)
		end

	test_position is
			-- Test feature `position' with erroneous input string.
		local
			a_position: XM_DEFAULT_POSITION
		do
			create parser.make
			parser.parse_from_string ("%N%N  <a?>")
			a_position ?= parser.position
			assert ("position_not_void", a_position /= Void)
			assert_integers_equal ("row_correct", 3, a_position.row)
			assert_integers_equal ("column_correct", 5, a_position.column)
			assert_integers_equal ("byte_index_correct", 7, a_position.byte_index)
		end

	test_end_tag is
			-- Test end tag checking is enabled.
		do
			create parser.make
			parser.parse_from_string ("<a></b>")
			assert ("not_correct", not parser.is_correct)
		end

feature {NONE} -- Implementation

	parser: XM_EIFFEL_PARSER
			-- Tested parser

end
