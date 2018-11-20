note

	description:

		"Test XML parser string modes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TEST_STRING_MODE

inherit

	TS_TEST_CASE

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

	UC_UNICODE_FACTORY
		export {NONE} all end

create

	make_default

feature {NONE} -- Test case

	Ascii_content: STRING = "<doc>{</doc>"
	Utf8_latin1_content: STRING = "<doc>%/195/%/188/</doc>"
	Utf8_large_content: STRING = "<doc>%/196/%/137/</doc>"

	Ascii_char: CHARACTER = '{'
	Latin1_char: INTEGER = 252
	Large_char: INTEGER = 265

feature -- Tests

	test_default
			-- Test default string mode.
		local
			l_parser: XM_EIFFEL_PARSER
			l_content: XM_RESULT_FILTER
		do
			create l_parser.make
			create l_content.make_null
			l_parser.set_callbacks (l_content)

			l_parser.parse_from_string (Ascii_content)
			assert ("ascii ok", l_parser.is_correct)
			assert_string_type (l_content.content, True)
			assert_integers_equal ("ascii output", Ascii_char.code, l_content.content.item (1).code)

			l_parser.parse_from_string (new_unicode_string_from_utf8 (Utf8_latin1_content))
			assert ("latin1 ok", l_parser.is_correct)
			assert_string_type (l_content.content, True)
			assert_integers_equal ("latin1 output", Latin1_char, l_content.content.item_code (1))

			l_parser.parse_from_string (new_unicode_string_from_utf8 (Utf8_large_content))
			assert ("latin1 fail", not l_parser.is_correct)
		end

	test_ascii
			-- Test ascii string mode.
		local
			l_parser: XM_EIFFEL_PARSER
			l_content: XM_RESULT_FILTER
		do
			create l_parser.make
			create l_content.make_null
			l_parser.set_callbacks (l_content)
			l_parser.set_string_mode_ascii

			l_parser.parse_from_string (Ascii_content)
			assert ("ascii ok", l_parser.is_correct)
			assert_string_type (l_content.content, True)
			assert_integers_equal ("ascii output", Ascii_char.code, l_content.content.item (1).code)

			l_parser.parse_from_string (new_unicode_string_from_utf8 (Utf8_latin1_content))
			assert ("latin1 fail", not l_parser.is_correct)

			l_parser.parse_from_string (new_unicode_string_from_utf8 (Utf8_large_content))
			assert ("large fail", not l_parser.is_correct)
		end

	test_mixed
			-- Test mixed string mode.
		local
			l_parser: XM_EIFFEL_PARSER
			l_content: XM_RESULT_FILTER
		do
			create l_parser.make
			create l_content.make_null
			l_parser.set_callbacks (l_content)
			l_parser.set_string_mode_mixed

			l_parser.parse_from_string (Ascii_content)
			assert ("ascii ok", l_parser.is_correct)
			assert_integers_equal ("ascii output", Ascii_char.code, l_content.content.item (1).code)
			assert_string_type (l_content.content, True)

			l_parser.parse_from_string (new_unicode_string_from_utf8 (Utf8_latin1_content))
			assert ("latin1 ok", l_parser.is_correct)
			assert_integers_equal ("latin1 output", Latin1_char, l_content.content.item_code (1))
			assert_string_type (l_content.content, False)

			l_parser.parse_from_string (new_unicode_string_from_utf8 (Utf8_large_content))
			assert ("large ok", l_parser.is_correct)
			assert_integers_equal ("large output", Large_char, l_content.content.item_code (1))

			assert_string_type (l_content.content, False)
		end

feature {NONE} -- Implementation

	assert_string_type (a_string: STRING; is_string: BOOLEAN)
			-- Check `a_string' of type STRING or not.
		require
			not_void: a_string /= Void
		local
			a_test: BOOLEAN
		do
			a_test := ANY_.same_types (a_string, "")
			if is_string then
				assert ("dynamic string type", a_test)
			else
				assert ("dynamic large string type", not a_test)
			end
		end

end
