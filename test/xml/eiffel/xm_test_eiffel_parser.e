indexing

	description:

		"Test features of class XM_EIFFEL_PARSER"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_TEST_EIFFEL_PARSER

inherit

	TS_TEST_CASE

feature -- Test

	test_parse_empty_string is
			-- Test feature `parse_from_string' with an empty input string.
		local
			a_parser: XM_EIFFEL_PARSER
		do
			create a_parser.make
			a_parser.parse_from_string ("")
			assert ("not_correct", not a_parser.is_correct)
			assert_strings_equal ("no_element", "STRING:1:1:parse error", a_parser.last_error_extended_description)
		end

	test_position is
			-- Test feature `position' with erroneous input string.
		local
			a_parser: XM_EIFFEL_PARSER
			a_position: XM_DEFAULT_POSITION
		do
			create a_parser.make
			a_parser.parse_from_string ("%N%N  <a?>")
			a_position ?= a_parser.position
			assert_not_equal ("position_exists", Void, a_position)
			assert_integers_equal ("row_correct", 3, a_position.row)
			assert_integers_equal ("column_correct", 5, a_position.column)
			assert_integers_equal ("byte_index_correct", 7, a_position.byte_index)
		end

	test_end_tag is
			-- Test end tag checking is enabled.
		local
			a_parser: XM_EIFFEL_PARSER
		do
			create a_parser.make
			a_parser.parse_from_string ("<a></b>")
			assert ("not_correct", not a_parser.is_correct)
		end
end
