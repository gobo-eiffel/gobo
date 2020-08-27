note

	description:

		"Test features of class YY_UNICODE_BUFFER"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class YY_TEST_UNICODE_BUFFER

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_make_from_utf8_string_with_ascii_characters
			-- Test feature 'make_from_utf8_string' with ASCII characters.
		local
			l_buffer: YY_UNICODE_BUFFER
		do
			create l_buffer.make_from_utf8_string ("abc")
			assert_integers_equal ("count", 3, l_buffer.count)
			assert_characters_32_equal ("item_1", 'a', l_buffer.content.unicode_item (1))
			assert_characters_32_equal ("item_2", 'b', l_buffer.content.unicode_item (2))
			assert_characters_32_equal ("item_3", 'c', l_buffer.content.unicode_item (3))
		end

	test_make_from_utf8_string_with_non_ascii_characters
			-- Test feature 'make_from_utf8_string' with non-ASCII characters.
		local
			l_buffer: YY_UNICODE_BUFFER
		do
			create l_buffer.make_from_utf8_string ("a%/206/%/177/")
			assert_integers_equal ("count", 2, l_buffer.count)
			assert_characters_32_equal ("item_1", 'a', l_buffer.content.unicode_item (1))
			assert_characters_32_equal ("item_2", 'α', l_buffer.content.unicode_item (2))
		end

	test_set_utf8_string_with_ascii_characters
			-- Test feature 'set_utf8_string' with ASCII characters.
		local
			l_buffer: YY_UNICODE_BUFFER
		do
			create l_buffer.make ("")
			l_buffer.set_utf8_string ("abc")
			assert_integers_equal ("count", 3, l_buffer.count)
			assert_characters_32_equal ("item_1", 'a', l_buffer.content.unicode_item (1))
			assert_characters_32_equal ("item_2", 'b', l_buffer.content.unicode_item (2))
			assert_characters_32_equal ("item_3", 'c', l_buffer.content.unicode_item (3))
		end

	test_set_utf8_string_with_non_ascii_characters
			-- Test feature 'set_utf8_string' with non-ASCII characters.
		local
			l_buffer: YY_UNICODE_BUFFER
		do
			create l_buffer.make ("")
			l_buffer.set_utf8_string ("a%/206/%/177/")
			assert_integers_equal ("count", 2, l_buffer.count)
			assert_characters_32_equal ("item_1", 'a', l_buffer.content.unicode_item (1))
			assert_characters_32_equal ("item_2", 'α', l_buffer.content.unicode_item (2))
		end

end
