indexing

	description:

		"Test features of class UC_UNICODE_ROUTINES"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2004-2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class UC_TEST_UNICODE_ROUTINES

inherit

	KL_TEST_CASE
	UC_IMPORTED_UNICODE_ROUTINES

feature

	test_valid_code is
			-- Test code range routines.
		do
			assert ("ascii_negative", not unicode.valid_ascii_code (-1))
			assert ("ascii_positive", not unicode.valid_ascii_code (128))
			assert ("unicode_negative", not unicode.valid_code (-1))
		end

	test_ascii_string is
			-- Test `is_ascii_string'.
		do
			assert ("ascii", unicode.is_ascii_string ("a"))
			assert ("not_ascii", not unicode.is_ascii_string ("%/130/"))
		end

	test_code_to_string is
			-- Test `code_to_string'.
		do
			assert ("code_to_string_ascii", unicode.code_to_string (97).item (1) = 'a')
			assert ("code_to_string_unicode", unicode.code_to_string (1000).item_code (1) = 1000)
		end

end
