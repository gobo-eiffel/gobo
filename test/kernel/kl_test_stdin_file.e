indexing

	description:

		"Test features of class KL_STDIN_FILE"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_TEST_STDIN_FILE

inherit

	KL_TEST_CASE
	KL_SHARED_STANDARD_FILES

create

	make_default

feature -- Status report

	read_from_console: BOOLEAN is False
			-- Set this boolean to true to have this
			-- test actually read from the console.

feature -- Test

	test_make is
			-- Test feature `make'.
		local
			a_file: KL_STDIN_FILE
		do
			create a_file.make
			assert ("a_file_not_void", a_file /= Void)
			assert_equal ("name_set", "stdin", a_file.name)
			assert ("is_open", a_file.is_open_read)
			assert ("not_eof", not a_file.end_of_file)
		end

	test_eol is
			-- Test feature `eol'.
		local
			a_file: KL_STDIN_FILE
		do
			create a_file.make
			assert_equal ("eol", "%N", a_file.eol)
		end

	test_read_character is
			-- Test feature `read_character'.
		local
			a_file: KL_STDIN_FILE
		do
			if read_from_console then
				create a_file.make
				assert ("is_open", a_file.is_open_read)
				assert ("not_eof", not a_file.end_of_file)
				std.output.put_string ("Type 'Th': ")
				std.output.flush
				a_file.read_character
				assert ("not_eof2", not a_file.end_of_file)
				assert_characters_equal ("read1", 'T', a_file.last_character)
				assert ("not_eof3", not a_file.end_of_file)
				assert_characters_equal ("read2", 'T', a_file.last_character)
				assert ("not_eof4", not a_file.end_of_file)
				a_file.read_character
				assert ("not_eof5", not a_file.end_of_file)
				assert_characters_equal ("read3", 'h', a_file.last_character)
					-- Read new-line.
				a_file.read_new_line
			end
		end

	test_unread_character1 is
			-- Test feature `unread_character'.
		local
			a_file: KL_STDIN_FILE
		do
			if read_from_console then
				create a_file.make
				assert ("is_open", a_file.is_open_read)
				assert ("not_eof", not a_file.end_of_file)
				std.output.put_string ("Type 'Th': ")
				std.output.flush
				a_file.read_character
				assert ("not_eof2", not a_file.end_of_file)
				assert_characters_equal ("read1", 'T', a_file.last_character)
				a_file.unread_character ('G')
				assert ("not_eof3", not a_file.end_of_file)
				assert_characters_equal ("read2", 'G', a_file.last_character)
				assert ("not_eof4", not a_file.end_of_file)
				a_file.read_character
				assert ("not_eof5", not a_file.end_of_file)
				assert_characters_equal ("read3", 'G', a_file.last_character)
				a_file.read_character
				assert ("not_eof6", not a_file.end_of_file)
				assert_characters_equal ("read4", 'h', a_file.last_character)
					-- Read new-line.
				a_file.read_new_line
			end
		end

	test_unread_character2 is
			-- Test feature `unread_character'.
		local
			a_file: KL_STDIN_FILE
		do
			if read_from_console then
				create a_file.make
				assert ("is_open", a_file.is_open_read)
				assert ("not_eof", not a_file.end_of_file)
				std.output.put_string ("Type 'This': ")
				std.output.flush
				a_file.read_character
				assert ("not_eof2", not a_file.end_of_file)
				assert_characters_equal ("read1", 'T', a_file.last_character)
				a_file.unread_character ('o')
				assert ("not_eof3", not a_file.end_of_file)
				assert_characters_equal ("read2", 'o', a_file.last_character)
				a_file.unread_character ('b')
				assert ("not_eof4", not a_file.end_of_file)
				assert_characters_equal ("read3", 'b', a_file.last_character)
				a_file.unread_character ('o')
				assert ("not_eof5", not a_file.end_of_file)
				assert_characters_equal ("read4", 'o', a_file.last_character)
				a_file.unread_character ('g')
				assert ("not_eof6", not a_file.end_of_file)
				assert_characters_equal ("read5", 'g', a_file.last_character)
				a_file.read_line
				assert ("not_eof7", not a_file.end_of_file)
				assert_equal ("read6", "gobohis", a_file.last_string)
			end
		end

	test_read_string is
			-- Test feature `read_string'.
		local
			a_file: KL_STDIN_FILE
			last_string, last_string2: STRING
		do
			if read_from_console then
				create a_file.make
				assert ("is_open", a_file.is_open_read)
				assert ("not_eof", not a_file.end_of_file)
				std.output.put_string ("Type 'This is the': ")
				std.output.flush
				a_file.read_string (5)
				assert ("not_eof2", not a_file.end_of_file)
				last_string := a_file.last_string
				assert_equal ("read1", "This ", last_string)
				assert ("not_eof3", not a_file.end_of_file)
				assert_equal ("read2", "This ", a_file.last_string)
				assert ("not_eof4", not a_file.end_of_file)
				a_file.read_string (6)
				last_string2 := a_file.last_string
				assert ("not_eof5", not a_file.end_of_file)
				assert_equal ("read3", "is the", last_string2)
				assert_same ("same_last_string", last_string, last_string2)
					-- Read new-line.
				a_file.read_new_line
			end
		end

	test_read_line is
			-- Test feature `read_line'.
		local
			a_file: KL_STDIN_FILE
			last_string, last_string2: STRING
		do
			if read_from_console then
				create a_file.make
				assert ("is_open", a_file.is_open_read)
				assert ("not_eof", not a_file.end_of_file)
				std.output.put_string ("Type 'gobo': ")
				std.output.flush
				a_file.read_line
				assert ("not_eof2", not a_file.end_of_file)
				last_string := a_file.last_string
				assert_equal ("read1", "gobo", last_string)
				assert ("not_eof3", not a_file.end_of_file)
				assert_equal ("read2", "gobo", a_file.last_string)
				assert ("not_eof4", not a_file.end_of_file)
				std.output.put_string ("Type 'foobar': ")
				std.output.flush
				a_file.read_line
				last_string2 := a_file.last_string
				assert ("not_eof5", not a_file.end_of_file)
				assert_equal ("read3", "foobar", last_string2)
				assert_same ("same_last_string", last_string, last_string2)
			end
		end

	test_read_new_line is
			-- Test feature `read_new_line'.
		local
			a_file: KL_STDIN_FILE
			last_string: STRING
		do
			if read_from_console then
				create a_file.make
				assert ("is_open", a_file.is_open_read)
				assert ("not_eof", not a_file.end_of_file)
				std.output.put_string ("Type 'gobo': ")
				std.output.flush
				a_file.read_string (4)
				assert ("not_eof2", not a_file.end_of_file)
				last_string := a_file.last_string
				assert_equal ("read1", "gobo", last_string)
				a_file.read_new_line
				assert ("not_eof3", not a_file.end_of_file)
				assert_equal ("read2", a_file.eol, a_file.last_string)
				assert ("not_eof4", not a_file.end_of_file)
				std.output.put_string ("Type 'foobar': ")
				std.output.flush
				a_file.read_character
				assert ("not_eof5", not a_file.end_of_file)
				assert_characters_equal ("read3", 'f', a_file.last_character)
				a_file.read_new_line
				assert ("not_eof6", not a_file.end_of_file)
				assert_equal ("not_read1", "", a_file.last_string)
				a_file.read_line
				assert ("not_eof7", not a_file.end_of_file)
				assert_equal ("read4", "oobar", a_file.last_string)
			end
		end

	test_read_to_string is
			-- Test feature `read_to_string'.
		local
			a_file: KL_STDIN_FILE
			a_string: STRING
			nb: INTEGER
		do
			if read_from_console then
				a_string := "#######"
				create a_file.make
				assert ("is_open", a_file.is_open_read)
				assert ("not_eof", not a_file.end_of_file)
				std.output.put_string ("Type 'This is t': ")
				std.output.flush
				nb := a_file.read_to_string (a_string, 1, 7)
				assert ("not_eof2", not a_file.end_of_file)
				assert_integers_equal ("nb_char1", 7, nb)
				assert_equal ("read1", "This is", a_string)
				nb := a_file.read_to_string (a_string, 3, 2)
				assert ("not_eof3", not a_file.end_of_file)
				assert_integers_equal ("nb_char2", 2, nb)
				assert_equal ("read2", "Th t is", a_string)
					-- Read new-line.
				a_file.read_new_line
			end
		end

	test_read_to_buffer is
			-- Test feature `read_to_buffer'.
		local
			a_file: KL_STDIN_FILE
			a_buffer: KL_CHARACTER_BUFFER
			nb: INTEGER
		do
			if read_from_console then
				create a_buffer.make (8)
				create a_file.make
				assert ("is_open", a_file.is_open_read)
				assert ("not_eof", not a_file.end_of_file)
				std.output.put_string ("Type 'This is th': ")
				std.output.flush
				nb := a_file.read_to_buffer (a_buffer, 1, 8)
				assert ("not_eof2", not a_file.end_of_file)
				assert_integers_equal ("nb_char1", 8, nb)
				assert_equal ("read1", "This is ", a_buffer.to_text)
				nb := a_file.read_to_buffer (a_buffer, 3, 2)
				assert ("not_eof3", not a_file.end_of_file)
				assert_integers_equal ("nb_char2", 2, nb)
				assert_equal ("read2", "Thth is ", a_buffer.to_text)
					-- Read new-line.
				a_file.read_new_line
			end
		end

	test_end_of_file1 is
			-- Test feature `end_of_file' with `read_character'.
		local
			a_file: KL_STDIN_FILE
		do
			if read_from_console then
				create a_file.make
				assert ("is_open", a_file.is_open_read)
				assert ("not_eof", not a_file.end_of_file)
				std.output.put_string ("Type '#': ")
				std.output.flush
				a_file.read_character
				assert ("not_eof2", not a_file.end_of_file)
				assert_characters_equal ("read", '#', a_file.last_character)
					-- Read new-line.
				a_file.read_new_line
			end
		end

	test_end_of_file2 is
			-- Test feature `end_of_file' with `read_string'.
		local
			a_file: KL_STDIN_FILE
		do
			if read_from_console then
				create a_file.make
				assert ("is_open", a_file.is_open_read)
				assert ("not_eof", not a_file.end_of_file)
				std.output.put_string ("Type 'gobo': ")
				std.output.flush
				a_file.read_string (4)
				assert ("not_eof2", not a_file.end_of_file)
				assert_equal ("read", "gobo", a_file.last_string)
					-- Read new-line.
				a_file.read_new_line
			end
		end

end
