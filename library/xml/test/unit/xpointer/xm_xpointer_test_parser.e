note

	description:

		"Test xpointer parser"

	library: "Gobo Eiffel XPointer Library"
	copyright: "Copyright (c) 2005-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPOINTER_TEST_PARSER

inherit

	TS_TEST_CASE

	KL_SHARED_STANDARD_FILES

create

	make_default

feature -- Test

	test_two_schemes
			-- Test parsing two schemes.
		local
			a_parser: XM_XPOINTER_PARSER
		do
			create a_parser.make
			a_parser.parse ("xpointer(id('boy-blue')/horn[1])element(boy-blue/3)")
			assert ("Parse successful", not a_parser.is_error)
			assert ("Not shorthand", not a_parser.is_shorthand)
			assert ("Two schemes", a_parser.scheme_sequence.count = 2)
			assert_strings_equal ("First scheme is xpointer", "xpointer", a_parser.scheme_sequence.item (1))
			assert_strings_equal ("First scheme data", "id('boy-blue')/horn[1]", a_parser.scheme_data.item (1))
			assert_strings_equal ("First scheme is element", "element", a_parser.scheme_sequence.item (2))
			assert_strings_equal ("Second scheme data", "boy-blue/3", a_parser.scheme_data.item (2))
		end

	test_two_schemes_with_white_space
			-- Test parsing two schemes separated by white space.
		local
			a_parser: XM_XPOINTER_PARSER
		do
			create a_parser.make
			a_parser.parse ("xpointer(id('boy-blue')/horn[1]) %T %R %N element(boy-blue/3)")
			assert ("Parse successful", not a_parser.is_error)
		end

	test_escaped_data
			-- Test parsing with escaped data.
		local
			a_parser: XM_XPOINTER_PARSER
		do
			create a_parser.make
			a_parser.parse ("xpointer(string-range(//P,%"my ^(favorite smiley :-^)%"))")
			assert ("Parse successful", not a_parser.is_error)
			assert ("Not shorthand", not a_parser.is_shorthand)
			assert ("One scheme", a_parser.scheme_sequence.count = 1)
			assert_strings_equal ("Unescaped scheme data", "string-range(//P,%"my (favorite smiley :-)%")", a_parser.scheme_data.item (1))
		end

	test_shorthand
			-- Test parsing shorthand pointer
		local
			a_parser: XM_XPOINTER_PARSER
		do
			create a_parser.make
			a_parser.parse ("fred")
			assert ("Parse successful", not a_parser.is_error)
			assert ("Shorthand", a_parser.is_shorthand)
			assert_strings_equal ("Shorthand is fred", "fred", a_parser.shorthand)
		end

	test_invalid_shorthand
			-- Test parsing shorthand pointer
		local
			a_parser: XM_XPOINTER_PARSER
		do
			create a_parser.make
			a_parser.parse ("fred:jim")
			assert ("Parse in error", a_parser.is_error)
		end

end

