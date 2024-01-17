note

	description:

		"Test features of class UC_UNICODE_ROUTINES"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2004-2022, Eric Bezault and others"
	license: "MIT License"

class UC_TEST_UNICODE_ROUTINES

inherit

	KL_TEST_CASE
	UC_IMPORTED_UNICODE_ROUTINES

create

	make_default

feature -- Tests

	test_valid_code
			-- Test code range routines.
		do
			assert ("ascii_negative", not unicode.valid_ascii_code (-1))
			assert ("ascii_positive", not unicode.valid_ascii_code (128))
			assert ("unicode_negative", not unicode.valid_code (-1))
		end

	test_ascii_string
			-- Test `is_ascii_string'.
		do
			assert ("ascii", unicode.is_ascii_string ("a"))
			assert ("not_ascii", not unicode.is_ascii_string ("%/130/"))
		end

	test_code_to_string
			-- Test `code_to_string'.
		do
			assert ("code_to_string_ascii", unicode.code_to_string (97).item (1) = 'a')
			assert ("code_to_string_unicode", unicode.code_to_string (1000).code (1) = 1000)
		end

end
