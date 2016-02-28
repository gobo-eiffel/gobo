note

	description:

		"Test features of class ST_SPLITTER"

	test_status: "ok_to_run"
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_TEST_SPLITTER

inherit

	TS_TEST_CASE

	KL_IMPORTED_ARRAY_ROUTINES

create

	make_default

feature -- Testing

	test_simple
			-- Simple test case.
		do
			create split.make
			assert_split ("abc", "a b c", <<"a", "b", "c">>)
			assert_split ("aabbcc", "aa bb cc", <<"aa", "bb","cc">>)
		end

	test_single
			-- Single token cases.
		do
			create split.make
			assert_split ("single", "a", <<"a">>)
			assert_split ("right_separator", "   a", <<"a">>)
			assert_split ("left_separator", "a %T%R", <<"a">>)
		end

	test_no_escape
			-- Test default no escape with common escape chars.
		do
			create split.make
			assert_split ("backslash", "a\ b", << "a\", "b">>)
			assert_split ("percent", "a%% b", << "a%%", "b">>)
		end

	test_escape
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
			assert_split ("escape_escape_before_separator", "a\\ b", <<"a\", "b">>)
		end

	test_empty
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

	test_split_single
			-- Split were single character considered separator.
		do
			create split.make
			split.set_separators (",;")
			assert_split_greedy ("single", "a", <<"a">>)
			assert_split_greedy ("simple", "a,b", <<"a", "b">>)
			assert_split_greedy ("multi", "a,;b", <<"a", "", "b">>)
			assert_split_greedy ("start", ",a", <<"", "a">>)
			assert_split_greedy ("end", "a;", <<"a", "">>)
			assert_split_greedy ("single_separator", ",", <<"", "">>)
		end

	test_join
			-- Test join operation.
		do
			create split.make
			split.set_escape_character ('\')

			assert_join ("single", <<"ab">>, "ab")
			assert_join ("join", <<"a", "b">>, "a b")
		end

	test_join_escape
			-- Test join operation with escaping.
		do
			create split.make
			split.set_escape_character ('\')

			assert_join ("space", <<"a b", "c">>, "a\ b c")
			assert_join ("escape", <<"a\b", "c">>, "a\\b c")
			assert_join ("escape", <<"a", "c\\\">>, "a c\\\\\\")
		end

	test_join_unescaped
			-- Test join unescaped.
		do
			create split.make

			assert_join_unescaped ("space", <<"a b", "c">>, "a b c")
			assert_join_unescaped ("empty_items", <<"", "">>, " ")

			split.set_escape_character ('\')
			assert_join_unescaped ("escape_set", <<"a  b", "c">>, "a  b c")
		end

feature {NONE} -- Implementation

	split: ST_SPLITTER
			-- Object being tested

	assert_split (a_tag: STRING; a_in: STRING; a_result: ARRAY [STRING])
			-- Test case for `split'.
		require
			a_tag_not_void: a_tag /= Void
			a_in_not_void: a_in /= Void
			a_result_not_void: a_result /= Void
			no_void_result: not STRING_ARRAY_.has (a_result, Void)
			split_not_void: split /= Void
		local
			a_list: DS_LIST [STRING]
		do
			a_list := split.split (a_in)
			assert_list_equal (a_tag, a_list, a_result)
		end

	assert_split_greedy (a_tag: STRING; a_in: STRING; a_result: ARRAY [STRING])
			-- Test case for `split_greedy'.
		require
			a_tag_not_void: a_tag /= Void
			a_in_not_void: a_in /= Void
			a_result_not_void: a_result /= Void
			no_void_result: not STRING_ARRAY_.has (a_result, Void)
			split_not_void: split /= Void
		local
			a_list: DS_LIST [STRING]
		do
			a_list := split.split_greedy (a_in)
			assert_list_equal (a_tag, a_list, a_result)
		end

	assert_list_equal (a_tag: STRING; a_list: DS_LIST [STRING]; a_result: ARRAY [STRING])
			-- Assert list equal result.
		require
			a_tag_not_void: a_tag /= Void
			a_list_not_void: a_list /= Void
			no_void_item: not a_list.has (Void)
			a_result_not_void: a_result /= Void
			no_void_result: not STRING_ARRAY_.has (a_result, Void)
			split_not_void: split /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [STRING]
			i: INTEGER
		do
			assert_integers_equal (a_tag + "_size", a_result.count, a_list.count)
			i := a_result.lower
			a_cursor := a_list.new_cursor
			from a_cursor.start until a_cursor.after loop
				assert_strings_equal (a_tag + "_item_equal_at_" + i.out, a_result.item (i), a_cursor.item)
				a_cursor.forth
				i := i + 1
			end
		end

	assert_join (a_tag: STRING; an_array: ARRAY [STRING]; a_result: STRING)
			-- Test case for `join'.
		require
			a_tag_not_void: a_tag /= Void
			an_array_not_void: an_array /= Void
			no_void_item: not STRING_ARRAY_.has (an_array, Void)
			-- no_empty_item: forall item in `an_array', not item.is_empty
			a_result_not_void: a_result /= Void
			split_not_void: split /= Void
		local
			a_list: DS_LINKED_LIST [STRING]
		do
			create a_list.make_from_array (an_array)
			assert_strings_equal (a_tag, a_result, split.join (a_list))
		end

	assert_join_unescaped (a_tag: STRING; an_array: ARRAY [STRING]; a_result: STRING)
			-- Test case for `join_unescaped'.
		require
			a_tag_not_void: a_tag /= Void
			an_array_not_void: an_array /= Void
			no_void_item: not STRING_ARRAY_.has (an_array, Void)
			a_result_not_void: a_result /= Void
			split_not_void: split /= Void
		local
			a_list: DS_LINKED_LIST [STRING]
		do
			create a_list.make_from_array (an_array)
			assert_equal (a_tag, a_result, split.join_unescaped (a_list))
		end

end
