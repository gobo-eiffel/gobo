note

	description:

		"Test features of class KL_CHARACTER_BUFFER"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_TEST_CHARACTER_BUFFER

inherit

	KL_TEST_CASE

	KL_SHARED_EXECUTION_ENVIRONMENT

create

	make_default

feature -- Test

	test_make
			-- Test feature `make'.
		local
			a_buffer: KL_CHARACTER_BUFFER
		do
			create a_buffer.make (5)
			assert ("a_buffer_not_void", a_buffer /= Void)
			assert_integers_equal ("count_set", 5, a_buffer.count)
		end

	test_make_from_string
			-- Test feature `make_from_string'.
		local
			a_buffer: KL_CHARACTER_BUFFER
		do
			create a_buffer.make_from_string ("my buffer")
			assert ("a_buffer_not_void", a_buffer /= Void)
			assert_integers_equal ("count_set", 9, a_buffer.count)
			assert_equal ("characters_set", "my buffer", a_buffer.to_text)
		end

	test_put
			-- Test feature `put'.
		local
			a_buffer: KL_CHARACTER_BUFFER
		do
			create a_buffer.make_from_string ("gobo")
			a_buffer.put ('y', 4)
			assert_equal ("put1", "goby", a_buffer.to_text)
			a_buffer.put ('f', 1)
			assert_equal ("put2", "foby", a_buffer.to_text)
			a_buffer.put ('u', 2)
			assert_equal ("put3", "fuby", a_buffer.to_text)
		end

	test_item
			-- Test feature `item'.
		local
			a_buffer: KL_CHARACTER_BUFFER
		do
			create a_buffer.make_from_string ("gobo")
			assert_characters_equal ("item1", 'g', a_buffer.item (1))
			assert_characters_equal ("item2", 'o', a_buffer.item (2))
			assert_characters_equal ("item3", 'b', a_buffer.item (3))
			assert_characters_equal ("item4", 'o', a_buffer.item (4))
		end

	test_substring
			-- Test feature `substring'.
		local
			a_buffer: KL_CHARACTER_BUFFER
		do
			create a_buffer.make_from_string ("gobo")
			assert_equal ("sub1", "gobo", a_buffer.substring (1, 4))
			assert_equal ("sub2", "gob", a_buffer.substring (1, 3))
			assert_equal ("sub3", "obo", a_buffer.substring (2, 4))
			assert_equal ("sub4", "ob", a_buffer.substring (2, 3))
			assert_equal ("sub5", "", a_buffer.substring (2, 1))
		end

	test_to_text
			-- Test feature `to_text'.
		local
			a_buffer: KL_CHARACTER_BUFFER
		do
			create a_buffer.make_from_string ("gobo")
			assert_equal ("to_text", "gobo", a_buffer.to_text)
		end

	test_append_substring_to_string
			-- Test feature `append_substring_to_string'.
		local
			a_buffer: KL_CHARACTER_BUFFER
			a_string: STRING
		do
			create a_buffer.make_from_string ("one two three")
			a_string := "gobo "
			a_buffer.append_substring_to_string (4, 3, a_string)
			assert_equal ("appended1", "gobo ", a_string)
			a_buffer.append_substring_to_string (1, 0, a_string)
			assert_equal ("appended2", "gobo ", a_string)
			a_buffer.append_substring_to_string (14, 13, a_string)
			assert_equal ("appended3", "gobo ", a_string)
			a_buffer.append_substring_to_string (1, 3, a_string)
			assert_equal ("appended4", "gobo one", a_string)
			a_buffer.append_substring_to_string (4, 7, a_string)
			assert_equal ("appended5", "gobo one two", a_string)
			a_buffer.append_substring_to_string (8, 13, a_string)
			assert_equal ("appended6", "gobo one two three", a_string)
			a_buffer.append_substring_to_string (1, 13, a_string)
			assert_equal ("appended7", "gobo one two threeone two three", a_string)
		end

	test_fill_from_string
			-- Test feature `fill_from_string'.
		local
			a_buffer: KL_CHARACTER_BUFFER
		do
			create a_buffer.make (8)
			a_buffer.fill_from_string ("gobogobo", 1)
			assert_equal ("filled", "gobogobo", a_buffer.to_text)
			a_buffer.fill_from_string ("bar", 6)
			assert_equal ("filled", "gobogbar", a_buffer.to_text)
			a_buffer.fill_from_string ("foo", 3)
			assert_equal ("filled", "gofoobar", a_buffer.to_text)
		end

	test_fill_from_stream
			-- Test feature `fill_from_stream'.
		local
			a_file: KL_TEXT_INPUT_FILE
			a_name: STRING
			a_buffer: KL_CHARACTER_BUFFER
			nb: INTEGER
		do
			create a_buffer.make (11)
			a_name := Execution_environment.interpreted_string (gobo_filename)
			create a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
				nb := a_buffer.fill_from_stream (a_file, 1, 11)
				assert ("not_eof2", not a_file.end_of_file)
				assert_integers_equal ("nb_char1", 11, nb)
				assert_equal ("read1", "This is the", a_buffer.to_text)
				nb := a_buffer.fill_from_stream (a_file, 5, 3)
				assert ("not_eof3", not a_file.end_of_file)
				assert_integers_equal ("nb_char2", 3, nb)
				assert_equal ("read2", "This fi the", a_buffer.to_text)
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_move_left
			-- Test feature `move_left'.
		local
			a_buffer: KL_CHARACTER_BUFFER
		do
			create a_buffer.make_from_string ("gobo eiffel")
			a_buffer.move_left (6, 1, 6)
			assert_equal ("moved", "eiffeliffel", a_buffer.to_text)
		end

	test_move_right
			-- Test feature `move_right'.
		local
			a_buffer: KL_CHARACTER_BUFFER
		do
			create a_buffer.make_from_string ("gobo eiffel")
			a_buffer.move_right (2, 6, 3)
			assert_equal ("moved", "gobo obofel", a_buffer.to_text)
		end

	test_resize
			-- Test feature `resize'.
		local
			a_buffer: KL_CHARACTER_BUFFER
		do
			create a_buffer.make_from_string ("gobo")
			assert_integers_equal ("count_set", 4, a_buffer.count)
			a_buffer.resize (6)
			assert_integers_equal ("new_count", 6, a_buffer.count)
			a_buffer.put ('#', 5)
			a_buffer.put ('#', 6)
			assert_equal ("resized", "gobo##", a_buffer.to_text)
		end

end
