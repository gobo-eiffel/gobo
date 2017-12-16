note

	description:

		"Test XML parser string modes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
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
		do
			make_parser

			parser.parse_from_string (Ascii_content)
			assert ("ascii ok", parser.is_correct)
			assert_content_string_static
			assert_integers_equal ("ascii output", Ascii_char.code, content.content.item (1).code)

			parser.parse_from_string (new_unicode_string_from_utf8 (Utf8_latin1_content))
			assert ("latin1 ok", parser.is_correct)
			assert_content_string_static
			assert_integers_equal ("latin1 output", Latin1_char, content.content.item_code (1))

			parser.parse_from_string (new_unicode_string_from_utf8 (Utf8_large_content))
			assert ("latin1 fail", not parser.is_correct)
		end

	test_ascii
			-- Test ascii string mode.
		do
			make_parser
			parser.set_string_mode_ascii

			parser.parse_from_string (Ascii_content)
			assert ("ascii ok", parser.is_correct)
			assert_content_string_static
			assert_integers_equal ("ascii output", Ascii_char.code, content.content.item (1).code)

			parser.parse_from_string (new_unicode_string_from_utf8 (Utf8_latin1_content))
			assert ("latin1 fail", not parser.is_correct)

			parser.parse_from_string (new_unicode_string_from_utf8 (Utf8_large_content))
			assert ("large fail", not parser.is_correct)
		end

	test_mixed
			-- Test mixed string mode.
		do
			make_parser
			parser.set_string_mode_mixed

			parser.parse_from_string (Ascii_content)
			assert ("ascii ok", parser.is_correct)
			assert_integers_equal ("ascii output", Ascii_char.code, content.content.item (1).code)
			assert_content_string_static

			parser.parse_from_string (new_unicode_string_from_utf8 (Utf8_latin1_content))
			assert ("latin1 ok", parser.is_correct)
			assert_integers_equal ("latin1 output", Latin1_char, content.content.item_code (1))
			assert_string_type (content.content, False)

			parser.parse_from_string (new_unicode_string_from_utf8 (Utf8_large_content))
			assert ("large ok", parser.is_correct)
			assert_integers_equal ("large output", Large_char, content.content.item_code (1))

			assert_string_type (content.content, False)
		end

feature {NONE} -- Implementation

	parser: XM_EIFFEL_PARSER
		-- Tested parser

	content: XM_RESULT_FILTER
		-- Filter collecting output

	make_parser
			-- Create parser.
		do
			create parser.make
			create content.make_null
			parser.set_callbacks (content)
		ensure
			parser_not_void: parser /= Void
			content_not_void: content /= Void
		end


feature {NONE} -- Implementation

	assert_content_string_static
			-- Check output string is of type STRING.
		do
			assert_string_type (content.content, True)
		end

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
