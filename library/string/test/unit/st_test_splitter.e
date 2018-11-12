note

	description:

		"Test features of class ST_SPLITTER"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2018, Eric Bezault and others"
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
		local
			l_split: ST_SPLITTER
		do
			create l_split.make
			assert_split ("abc", l_split, "a b c", <<"a", "b", "c">>)
			assert_split ("aabbcc", l_split, "aa bb cc", <<"aa", "bb","cc">>)
		end

	test_single
			-- Single token cases.
		local
			l_split: ST_SPLITTER
		do
			create l_split.make
			assert_split ("single", l_split, "a", <<"a">>)
			assert_split ("right_separator", l_split, "   a", <<"a">>)
			assert_split ("left_separator", l_split, "a %T%R", <<"a">>)
		end

	test_no_escape
			-- Test default no escape with common escape chars.
		local
			l_split: ST_SPLITTER
		do
			create l_split.make
			assert_split ("backslash", l_split, "a\ b", << "a\", "b">>)
			assert_split ("percent", l_split, "a%% b", << "a%%", "b">>)
		end

	test_escape
			-- Test handling of escape character.
		local
			l_split: ST_SPLITTER
		do
			create l_split.make
			l_split.set_escape_character ('\')

			assert_split ("single", l_split, "\a", <<"a">>)
			assert_split ("single_with_sep", l_split, "a\ b", <<"a b">>)
			assert_split ("at_end", l_split, "ab\", <<"ab\">>)
			assert_split ("only_escape", l_split, "\", <<"\">>)
			assert_split ("escape_escape", l_split, "\\", <<"\">>)
			assert_split ("escape_escape_and_end", l_split, "\\\", <<"\\">>)
			assert_split ("escape_escape_twice", l_split, "\\\\", <<"\\">>)
			assert_split ("escape_escape_before_separator", l_split, "a\\ b", <<"a\", "b">>)
		end

	test_empty
			-- Empty case.
		local
			l_split: ST_SPLITTER
			a_list: DS_LINKED_LIST [STRING]
		do
			create l_split.make
			l_split.set_escape_character ('\')

			assert ("empty", l_split.split ("").is_empty)
			create a_list.make
			assert_equal ("empty_join", "", l_split.join (a_list))
		end

	test_split_single
			-- Split were single character considered separator.
		local
			l_split: ST_SPLITTER
		do
			create l_split.make
			l_split.set_separators (",;")
			assert_split_greedy ("single", l_split, "a", <<"a">>)
			assert_split_greedy ("simple", l_split, "a,b", <<"a", "b">>)
			assert_split_greedy ("multi", l_split, "a,;b", <<"a", "", "b">>)
			assert_split_greedy ("start", l_split, ",a", <<"", "a">>)
			assert_split_greedy ("end", l_split, "a;", <<"a", "">>)
			assert_split_greedy ("single_separator", l_split, ",", <<"", "">>)
		end

	test_join
			-- Test join operation.
		local
			l_split: ST_SPLITTER
		do
			create l_split.make
			l_split.set_escape_character ('\')

			assert_join ("single", l_split, <<"ab">>, "ab")
			assert_join ("join", l_split, <<"a", "b">>, "a b")
		end

	test_join_escape
			-- Test join operation with escaping.
		local
			l_split: ST_SPLITTER
		do
			create l_split.make
			l_split.set_escape_character ('\')

			assert_join ("space", l_split, <<"a b", "c">>, "a\ b c")
			assert_join ("escape", l_split, <<"a\b", "c">>, "a\\b c")
			assert_join ("escape", l_split, <<"a", "c\\\">>, "a c\\\\\\")
		end

	test_join_unescaped
			-- Test join unescaped.
		local
			l_split: ST_SPLITTER
		do
			create l_split.make

			assert_join_unescaped ("space", l_split, <<"a b", "c">>, "a b c")
			assert_join_unescaped ("empty_items", l_split, <<"", "">>, " ")

			l_split.set_escape_character ('\')
			assert_join_unescaped ("escape_set", l_split, <<"a  b", "c">>, "a  b c")
		end

feature {NONE} -- Implementation

	assert_split (a_tag: STRING; split: ST_SPLITTER; a_in: STRING; a_result: ARRAY [STRING])
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
			assert_list_equal (a_tag, split, a_list, a_result)
		end

	assert_split_greedy (a_tag: STRING; split: ST_SPLITTER; a_in: STRING; a_result: ARRAY [STRING])
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
			assert_list_equal (a_tag, split, a_list, a_result)
		end

	assert_list_equal (a_tag: STRING; split: ST_SPLITTER; a_list: DS_LIST [STRING]; a_result: ARRAY [STRING])
			-- Assert list equal result.
		require
			a_tag_not_void: a_tag /= Void
			a_list_not_void: a_list /= Void
			no_void_item: not a_list.has_void
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

	assert_join (a_tag: STRING; split: ST_SPLITTER; an_array: ARRAY [STRING]; a_result: STRING)
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

	assert_join_unescaped (a_tag: STRING; split: ST_SPLITTER; an_array: ARRAY [STRING]; a_result: STRING)
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
