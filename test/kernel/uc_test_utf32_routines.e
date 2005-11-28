indexing

	description:

		"Test features of class UC_UTF32_ROUTINES"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class UC_TEST_UTF32_ROUTINES

inherit

	KL_TEST_CASE
	UC_IMPORTED_UTF32_ROUTINES

feature

	test_valid is
			-- Test feature `valid_utf32' when valid.
		do
			assert ("empty", utf32.valid_utf32 (""))
			assert ("valid_big_endian", utf32.valid_utf32 (utf32.bom_be + "%/0/%/0/%/0/M"))
			assert ("valid_little_endian", utf32.valid_utf32 (utf32.bom_le + "M%/0/%/0/%/0/"))
			assert ("valid_no_byte_order_marker", utf32.valid_utf32 ("%/0/%/0/%/0/M"))
		end

	test_invalid is
			-- Test feature `valid_utf32' when invalid.
		do
			assert ("only_3_bytes_be", not utf32.valid_utf32 (utf32.bom_be + "%/0/%/0/M"))
			assert ("only_3_bytes_le", not utf32.valid_utf32 (utf32.bom_le + "M%/0/%/0/"))
			assert ("surrogate", not utf32.valid_utf32 (utf32.bom_be + "%/0/%/0/%/216/%/223/"))
			assert ("code_too_large", not utf32.valid_utf32 (utf32.bom_be + "%/127/%/0/%/0/%/0/"))
		end

end
