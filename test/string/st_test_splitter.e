indexing

	description:
	
		"Test ST_SPLITTER"
	
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
deferred class ST_TEST_SPLITTER

inherit
	
	TS_TEST_CASE

feature -- Testing

	test_simple is
			-- Simple test case.
		do
			create split.make
			assert_split ("abc", "a b c", <<"a", "b", "c">>)
			assert_split ("aabbcc", "aa bb cc", <<"aa", "bb","cc">>)
		end
		
	test_single is
			-- Single token cases.
		do
			create split.make
			assert_split ("single", "a", <<"a">>)
			assert_split ("right_separator", "   a", <<"a">>)
			assert_split ("left_separator", "a %T%R", <<"a">>)
		end
		
	test_no_escape is
			-- Test default no escape with common escape chars.
		do
			create split.make
			assert_split ("backslash", "a\ b", << "a\", "b">>)
			assert_split ("percent", "a%% b", << "a%%", "b">>) 
		end
		
	test_escape is
			-- Test handling of escape character.
		do
			create split.make
			split.set_escape_character ('\')
			
			assert_split ("single", "\a", <<"a">>)	
			assert_split ("single_with_sep", "a\ b", <<"a b">>)
			assert_split ("at_end", "ab\", <<"ab\">>)
			assert_split ("only_escape", "\", <<"\">>)
			assert_split ("escape_escape", "\\", <<"\">>)
			assert_split ("escape_escape_and_end", "\\\", <<"\\">>)
			assert_split ("escape_escape_twice", "\\\\", <<"\\">>)
		end
		
	test_empty is
			-- Empty case.
		local
			a_list: DS_LINKED_LIST [STRING]
		do
			create split.make
			split.set_escape_character ('\')
			
			assert ("empty", split.split ("").is_empty)
			create a_list.make
			assert_equal ("empty_join", "", split.join (a_list))
		end
		
	test_join is
			-- Test join operation.
		do
			create split.make
			split.set_escape_character ('\')
			
			assert_join ("single", <<"ab">>, "ab")
			assert_join ("join", <<"a","b">>, "a b")
		end
		
	test_join_escape is
			-- Test join operation with escaping.
		do
			create split.make
			split.set_escape_character ('\')
			
			assert_join ("space", <<"a b","c">>, "a\ b c")
			assert_join ("escape", <<"a\b","c">>, "a\\b c")
			assert_join ("escape", <<"a","c\\\">>, "a c\\\\\\")
		end
		
feature {NONE} -- Implementation

	split: ST_SPLITTER
			-- Object being tested.
			
	assert_split (a_tag: STRING; a_in: STRING; a_result: ARRAY [STRING]) is
			-- Test case.
		require
			a_tag_not_void: a_tag /= Void
			a_in_not_void: a_in /= Void
			a_result_not_void: a_result /= Void
		local
			a_list: DS_LIST [STRING]
			a_cursor: DS_LINEAR_CURSOR [STRING]
			i: INTEGER
		do
			a_list := split.split (a_in)
			assert_equal (a_tag + "_size", a_result.count, a_list.count)
			
			from
				a_cursor := a_list.new_cursor
				a_cursor.start
				i := a_result.lower
			variant
				a_result.upper - i + 1
			until
				a_cursor.after
			loop
				assert_equal (a_tag + "_item_equal_at_" + i.out, a_result.item (i), a_cursor.item)
				a_cursor.forth
				i := i + 1
			end
		end
		
	assert_join (a_tag: STRING; an_array: ARRAY [STRING]; a_result: STRING) is
			-- To list.
		require
			a_tag_not_void: a_tag /= Void
			not_void: an_array /= Void
			a_result_not_void: a_result /= Void
		local
			a_list: DS_LINKED_LIST [STRING]
		do
			create a_list.make_from_array (an_array)
		end
		
end
