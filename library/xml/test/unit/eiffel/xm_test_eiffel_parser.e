note

	description:

		"Test features of class XM_EIFFEL_PARSER"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2018, Eric Bezault and others"
	license: "MIT License"

class XM_TEST_EIFFEL_PARSER

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_parse_empty_string
			-- Test feature `parse_from_string' with an empty input string.
		local
			l_parser: XM_EIFFEL_PARSER
		do
			create l_parser.make
			l_parser.parse_from_string ("")
			assert ("not_correct", not l_parser.is_correct)
			assert_strings_equal ("no_element", "STRING:1:1:parse error", l_parser.last_error_extended_description)
		end

	test_entity_quoted_quote
			-- Test quote/apos in quote.
		local
			l_parser: XM_EIFFEL_PARSER
		do
			create l_parser.make
			l_parser.parse_from_string ("<!DOCTYPE doc [ <!ENTITY t '%" %"'> ]> <doc>&t;</doc>")
			assert ("quote_in_apos", l_parser.is_correct)

			create l_parser.make
			l_parser.parse_from_string ("<!DOCTYPE doc [ <!ENTITY t %"' '%"> ]> <doc>&t;</doc>")
			assert ("apos_in_quote", l_parser.is_correct)
		end

	test_entity_error
			-- Test entity error.
		local
			l_parser: XM_EIFFEL_PARSER
		do
			create l_parser.make
			l_parser.parse_from_string ("<!DOCTYPE doc [ <!ELEMENT doc ANY> <!ENTITY h '<<zork'> ]><doc>&h;</doc>")
			assert ("not_correct", not l_parser.is_correct)
			assert_strings_equal ("error_message", "h:1:2:Misformed start tag", l_parser.last_error_extended_description)
		end

	test_position
			-- Test feature `position' with erroneous input string.
		local
			l_parser: XM_EIFFEL_PARSER
		do
			create l_parser.make
			l_parser.parse_from_string ("%N%N  <a?>")
			if not attached {XM_DEFAULT_POSITION} l_parser.position as a_position then
				assert ("position_not_void", False)
			else
				assert_integers_equal ("row_correct", 3, a_position.row)
				assert_integers_equal ("column_correct", 5, a_position.column)
				assert_integers_equal ("byte_index_correct", 7, a_position.byte_index)
			end
		end

	test_end_tag
			-- Test end tag checking is enabled.
		local
			l_parser: XM_EIFFEL_PARSER
		do
			create l_parser.make
			l_parser.parse_from_string ("<a></b>")
			assert ("not_correct", not l_parser.is_correct)
		end

end
