indexing

	description:

		"Test features of class XM_EIFFEL_PARSER"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
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
			!! a_parser.make
			a_parser.parse_from_string ("")
			assert ("not_correct", not a_parser.is_correct)
			assert_equal ("no_element", "parse error ( ln: 1 cl: 1 byte: 1 -> STRING)", a_parser.last_error_extended_description)
		end

end
