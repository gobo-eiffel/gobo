indexing
	
	description:
	
		"Test unicode character checking"
		
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_TEST_UNICODE_CHARACTERS

inherit

	TS_TEST_CASE

	XM_SHARED_UNICODE_CHARACTERS
		export {NONE} all end
		
feature -- Test

	test_empty is
			-- Empty tests.
		do
			assert_empty (characters_1_0)
			assert_empty (characters_1_1)
		end
		
	test_name is
			-- Name tests.
		do
			assert_name (characters_1_0)
			assert_name (characters_1_1)
		end
		
feature {NONE} -- Test

	assert_empty (a_characters: XM_UNICODE_CHARACTERS) is
			-- Test assertions with empty names.
		require
			a_characters_not_void: a_characters /= Void
		do
			assert ("empty_string", a_characters.is_string (""))
			assert ("empty_name", not a_characters.is_name (""))			
			assert ("empty_ncname", not a_characters.is_ncname (""))			
			
		end
		
	assert_name (a_characters: XM_UNICODE_CHARACTERS) is
			-- Test trivial names.
		require
			a_characters_not_void: a_characters /= Void
		do
			assert ("name", a_characters.is_name ("abc-de"))
			assert ("ncname", a_characters.is_ncname ("abc-de"))
			assert ("colon", a_characters.is_name ("abc:de"))
			assert ("colon_ncname", not a_characters.is_ncname ("ab:c-de"))
		end
		
end
