note

	description:

		"Test features of class KL_UNIX_INPUT_FILE"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_TEST_UNIX_INPUT_FILE

inherit

	KL_TEST_CASE

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	DT_SHARED_SYSTEM_CLOCK
		export {NONE} all end

create

	make_default

feature -- Test

	test_make is
			-- Test feature `make'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
			assert ("a_file_not_void", a_file /= Void)
			assert_same ("name_set", a_name, a_file.name)
			assert ("is_closed", a_file.is_closed)
		end

	test_exists is
			-- Test feature `exists'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
			a_directory: KL_DIRECTORY
			out_file: KL_TEXT_OUTPUT_FILE
		do
				-- The following two files, whose pathnames have a non-empty
				-- dirname, exist.
			a_name := gobo_filename
			a_name := Execution_environment.interpreted_string (a_name)
			create a_file.make (a_name)
			assert ("exists1", a_file.exists)
			a_name := empty_filename
			a_name := Execution_environment.interpreted_string (a_name)
			create a_file.make (a_name)
			assert ("exists2", a_file.exists)
				-- The following file, whose pathname has a non-empty
				-- dirname, does not exist.
			a_name := file_system.pathname (data_dirname, "gobo.txtoops")
			a_name := Execution_environment.interpreted_string (a_name)
			create a_file.make (a_name)
			assert ("not_exists1", not a_file.exists)
				-- The following file, whose pathname has a non-empty
				-- dirname and a basename containing a space, does not exist.
			a_name := file_system.pathname (data_dirname, "gobo.txt oops")
			a_name := Execution_environment.interpreted_string (a_name)
			create a_file.make (a_name)
			assert ("not_exists2", not a_file.exists)
				-- A file with an empty name does not exist.
			create a_file.make ("")
			assert ("not_exists3", not a_file.exists)
				-- The following pathname exists, but it is a
				-- directory and hence is not an existing file.
			a_name := data_dirname
			a_name := Execution_environment.interpreted_string (a_name)
			create a_directory.make (a_name)
			assert ("directory_exists", a_directory.exists)
			create a_file.make (a_name)
			assert ("not_exists4", not a_file.exists)
				-- Create a file in the current directory and then
				-- check that this file, whose pathname has an empty
				-- dirname, does exist. Then delete this newly created
				-- file and check than it does not exist anymore.
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
			assert ("not_exists5", not a_file.exists)
			create out_file.make (a_name)
			out_file.open_write
			if out_file.is_open_write then
				out_file.put_string ("Hello gobo")
				out_file.close
				assert ("is_closed", out_file.is_closed)
				create a_file.make (a_name)
				assert ("exists3", a_file.exists)
				a_file.delete
				assert ("not_exists6", not a_file.exists)
			else
				assert ("is_opened", False)
			end
		end

	test_is_readable is
			-- Test feature `is_readable'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
			a_directory: KL_DIRECTORY
			out_file: KL_TEXT_OUTPUT_FILE
		do
				-- The following two files, whose pathnames have a non-empty
				-- dirname, are readable.
			a_name := gobo_filename
			a_name := Execution_environment.interpreted_string (a_name)
			create a_file.make (a_name)
			assert ("readable1", a_file.is_readable)
			a_name := empty_filename
			a_name := Execution_environment.interpreted_string (a_name)
			create a_file.make (a_name)
			assert ("readable2", a_file.is_readable)
				-- The following file, whose pathname has a non-empty
				-- dirname, is not readable.
			a_name := file_system.pathname (data_dirname, "gobo.txtoops")
			a_name := Execution_environment.interpreted_string (a_name)
			create a_file.make (a_name)
			assert ("not_readable1", not a_file.is_readable)
				-- The following file, whose pathname has a non-empty
				-- dirname and a basename containing a space, is not readable.
			a_name := file_system.pathname (data_dirname, "gobo.txt oops")
			a_name := Execution_environment.interpreted_string (a_name)
			create a_file.make (a_name)
			assert ("not_readable2", not a_file.is_readable)
				-- A file with an empty name is not readable.
			create a_file.make ("")
			assert ("not_readable3", not a_file.is_readable)
				-- The following pathname exists, but it is a
				-- directory and hence is not a readable file.
			a_name := data_dirname
			a_name := Execution_environment.interpreted_string (a_name)
			create a_directory.make (a_name)
			assert ("directory_readable", a_directory.is_readable)
			create a_file.make (a_name)
			assert ("not_readable4", not a_file.is_readable)
				-- Create a file in the current directory and then
				-- check that this file, whose pathname has an empty
				-- dirname, is readable. Then delete this newly created
				-- file and check than it is not readable anymore.
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
			assert ("not_readable5", not a_file.is_readable)
			create out_file.make (a_name)
			out_file.open_write
			if out_file.is_open_write then
				out_file.put_string ("Hello gobo")
				out_file.close
				assert ("is_closed", out_file.is_closed)
				create a_file.make (a_name)
				assert ("readable3", a_file.is_readable)
				a_file.delete
				assert ("not_readable6", not a_file.is_readable)
			else
				assert ("is_opened", False)
			end
		end

	test_eol is
			-- Test feature `eol'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
			assert_equal ("eol", "%N", a_file.eol)
		end

	test_count is
			-- Test feature `count'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
		do
				-- Non-existing file.
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
			assert_integers_equal ("count1", -1, a_file.count)
				-- Empty file.
			a_name := Execution_environment.interpreted_string (empty_filename)
			create a_file.make (a_name)
			assert_integers_equal ("count2", 0, a_file.count)
				-- Non-empty file.
			a_name := Execution_environment.interpreted_string (hello_filename)
			create a_file.make (a_name)
			assert_integers_equal ("count3", 10, a_file.count)
				-- Non-empty file with 2 new-lines.
			a_name := Execution_environment.interpreted_string (gobo_filename)
			create a_file.make (a_name)
			assert_integers_equal ("count4", 48 + 2 * file_system.eol.count, a_file.count)
		end

	test_time_stamp is
			-- Test feature `time_stamp'.
		local
			a_file: KL_UNIX_INPUT_FILE
			out_file: KL_UNIX_OUTPUT_FILE
			a_name: STRING
			dt1, dt2, dt3: DT_DATE_TIME
		do
				-- Non-existing file.
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
			assert_integers_equal ("time_stamp1", -1, a_file.time_stamp)
				-- Existing file.
			a_name := Execution_environment.interpreted_string (hello_filename)
			create a_file.make (a_name)
			assert ("time_stamp2", a_file.time_stamp > 0)
				-- Create a file a check its time stamp.
			a_name := new_filename ("gobo", ".tmp")
			create out_file.make (a_name)
			out_file.open_write
			assert ("is_opened", out_file.is_open_write)
			out_file.put_string ("Hello gobo")
			out_file.close
			dt1 := utc_system_clock.date_time_now
			assert ("is_closed", out_file.is_closed)
			dt3 := dt1.cloned_object
			dt1.add_seconds (-5)
			dt3.add_seconds (5)
			create a_file.make (a_name)
			create dt2.make_from_epoch (a_file.time_stamp)
			assert ("time_stamp3", dt1 < dt2)
			assert ("time_stamp4", dt2 < dt3)
			out_file.delete
		end

	test_open_read is
			-- Test feature `open_read'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
		do
				-- Existing filename:
			a_name := Execution_environment.interpreted_string (gobo_filename)
			create a_file.make (a_name)
			assert ("is_closed", a_file.is_closed)
			a_file.open_read
			assert ("is_opened", a_file.is_open_read)
			a_file.close
			assert ("is_closed2", a_file.is_closed)
				-- Dummy filename:
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
			assert ("is_closed3", a_file.is_closed)
			a_file.open_read
			assert ("not_opened", not a_file.is_open_read)
		end

	test_read_character is
			-- Test feature `read_character'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
		do
			a_name := Execution_environment.interpreted_string (gobo_filename)
			create a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
				a_file.read_character
				assert ("not_eof2", not a_file.end_of_file)
				assert_characters_equal ("read1", 'T', a_file.last_character)
				assert ("not_eof3", not a_file.end_of_file)
				assert_characters_equal ("read2", 'T', a_file.last_character)
				assert ("not_eof4", not a_file.end_of_file)
				a_file.read_character
				assert ("not_eof5", not a_file.end_of_file)
				assert_characters_equal ("read3", 'h', a_file.last_character)
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_unread_character1 is
			-- Test feature `unread_character'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
		do
			a_name := Execution_environment.interpreted_string (gobo_filename)
			create a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
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
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_unread_character2 is
			-- Test feature `unread_character'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
		do
			a_name := Execution_environment.interpreted_string (gobo_filename)
			create a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
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
				a_file.read_string (26)
				assert ("not_eof7", not a_file.end_of_file)
				assert_equal ("read6", "gobohis is the first line,", a_file.last_string)
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_unread_character3 is
			-- Test feature `unread_character'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
		do
			a_name := Execution_environment.interpreted_string (empty_filename)
			create a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof1", not a_file.end_of_file)
				a_file.read_character
				assert ("eof1", a_file.end_of_file)
				a_file.unread_character ('G')
				assert ("not_eof2", not a_file.end_of_file)
				assert_characters_equal ("read1", 'G', a_file.last_character)
				a_file.unread_character ('B')
				assert ("not_eof3", not a_file.end_of_file)
				assert_characters_equal ("read2", 'B', a_file.last_character)
				a_file.read_character
				assert ("not_eof4", not a_file.end_of_file)
				assert_characters_equal ("read3", 'B', a_file.last_character)
				a_file.read_character
				assert ("not_eof5", not a_file.end_of_file)
				assert_characters_equal ("read4", 'G', a_file.last_character)
				a_file.read_character
				assert ("eof2", a_file.end_of_file)
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_read_string is
			-- Test feature `read_string'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
			last_string, last_string2: STRING
		do
			a_name := Execution_environment.interpreted_string (gobo_filename)
			create a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
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
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_read_line1 is
			-- Test feature `read_line'.
			-- The last line has no line-separator.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
			last_string, last_string2: STRING
		do
			a_name := Execution_environment.interpreted_string (gobo_filename)
			create a_file.make (a_name)
			if a_file.eol.is_equal (file_system.eol) then
				a_file.open_read
				if a_file.is_open_read then
					assert ("not_eof", not a_file.end_of_file)
					a_file.read_line
					assert ("not_eof2", not a_file.end_of_file)
					last_string := a_file.last_string
					assert_equal ("read1", "This is the first line,", last_string)
					assert ("not_eof3", not a_file.end_of_file)
					assert_equal ("read2", "This is the first line,", a_file.last_string)
					assert ("not_eof4", not a_file.end_of_file)
					a_file.read_line
					last_string2 := a_file.last_string
					assert ("not_eof5", not a_file.end_of_file)
					assert_equal ("read3", "this is the second line.", last_string2)
					assert_same ("same_last_string", last_string, last_string2)
					a_file.read_line
					assert ("not_eof6", not a_file.end_of_file)
					last_string := a_file.last_string
					assert_equal ("read4", "#", last_string)
					a_file.read_line
					assert ("eof1", a_file.end_of_file)
					a_file.close
					assert ("is_closed", a_file.is_closed)
				else
					assert ("is_opened", False)
				end
			end
		end

	test_read_line2 is
			-- Test feature `read_line'.
			-- The last line has a line-separator.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
			last_string, last_string2: STRING
		do
			a_name := Execution_environment.interpreted_string (booleans_filename)
			create a_file.make (a_name)
			if a_file.eol.is_equal (file_system.eol) then
				a_file.open_read
				if a_file.is_open_read then
					assert ("not_eof", not a_file.end_of_file)
					a_file.read_line
					assert ("not_eof2", not a_file.end_of_file)
					last_string := a_file.last_string
					assert_equal ("read1", "True", last_string)
					assert ("not_eof3", not a_file.end_of_file)
					assert_equal ("read2", "True", a_file.last_string)
					assert ("not_eof4", not a_file.end_of_file)
					a_file.read_line
					last_string2 := a_file.last_string
					assert ("not_eof5", not a_file.end_of_file)
					assert_equal ("read3", "False", last_string2)
					assert_same ("same_last_string", last_string, last_string2)
					a_file.read_line
					assert ("eof1", a_file.end_of_file)
					a_file.close
					assert ("is_closed", a_file.is_closed)
				else
					assert ("is_opened", False)
				end
			end
		end

	test_read_line3 is
			-- Test feature `read_line'.
			-- Empty file.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
		do
			a_name := Execution_environment.interpreted_string (empty_filename)
			create a_file.make (a_name)
			if a_file.eol.is_equal (file_system.eol) then
				a_file.open_read
				if a_file.is_open_read then
					assert ("not_eof1", not a_file.end_of_file)
					a_file.read_line
					assert ("eof", a_file.end_of_file)
					a_file.close
					assert ("is_closed", a_file.is_closed)
				else
					assert ("is_opened", False)
				end
			end
		end

	test_read_new_line is
			-- Test feature `read_new_line'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
			last_string: STRING
		do
			a_name := Execution_environment.interpreted_string (gobo_filename)
			create a_file.make (a_name)
			if a_file.eol.is_equal (file_system.eol) then
				a_file.open_read
				if a_file.is_open_read then
					assert ("not_eof", not a_file.end_of_file)
					a_file.read_string (23)
					assert ("not_eof2", not a_file.end_of_file)
					last_string := a_file.last_string
					assert_equal ("read1", "This is the first line,", last_string)
					a_file.read_new_line
					assert ("not_eof3", not a_file.end_of_file)
					assert_equal ("read2", a_file.eol, a_file.last_string)
					a_file.read_character
					assert ("not_eof4", not a_file.end_of_file)
					assert_characters_equal ("read3", 't', a_file.last_character)
					a_file.read_new_line
					assert ("not_eof5", not a_file.end_of_file)
					assert_equal ("not_read1", "", a_file.last_string)
					a_file.close
					assert ("is_closed", a_file.is_closed)
				else
					assert ("is_opened", False)
				end
			end
		end

	test_read_to_string is
			-- Test feature `read_to_string'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
			a_string: STRING
			nb: INTEGER
		do
			a_string := "#######"
			a_name := Execution_environment.interpreted_string (gobo_filename)
			create a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
				nb := a_file.read_to_string (a_string, 1, 7)
				assert ("not_eof2", not a_file.end_of_file)
				assert_integers_equal ("nb_char1", 7, nb)
				assert_equal ("read1", "This is", a_string)
				nb := a_file.read_to_string (a_string, 3, 2)
				assert ("not_eof3", not a_file.end_of_file)
				assert_integers_equal ("nb_char2", 2, nb)
				assert_equal ("read2", "Th t is", a_string)
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_read_to_buffer is
			-- Test feature `read_to_buffer'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
			a_buffer: KL_CHARACTER_BUFFER
			nb: INTEGER
		do
			create a_buffer.make (8)
			a_name := Execution_environment.interpreted_string (gobo_filename)
			create a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
				nb := a_file.read_to_buffer (a_buffer, 1, 8)
				assert ("not_eof2", not a_file.end_of_file)
				assert_integers_equal ("nb_char1", 8, nb)
				assert_equal ("read1", "This is ", a_buffer.to_text)
				nb := a_file.read_to_buffer (a_buffer, 3, 2)
				assert ("not_eof3", not a_file.end_of_file)
				assert_integers_equal ("nb_char2", 2, nb)
				assert_equal ("read2", "Thth is ", a_buffer.to_text)
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_end_of_file is
			-- Test feature `end_of_file' with `read_character'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
		do
			a_name := Execution_environment.interpreted_string (gobo_filename)
			create a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
				from
					a_file.read_character
					assert ("not_eof2", not a_file.end_of_file)
				until
					a_file.last_character = '#'
				loop
					a_file.read_character
					assert ("not_eof3", not a_file.end_of_file)
				end
				a_file.read_character
				assert ("eof", a_file.end_of_file)
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_end_of_file2 is
			-- Test feature `end_of_file' with `read_string'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
			last_string: STRING
		do
			a_name := Execution_environment.interpreted_string (gobo_filename)
			create a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
				a_file.read_string (7)
				assert ("not_eof2", not a_file.end_of_file)
				assert_equal ("read", "This is", a_file.last_string)
				a_file.read_string (1000)
				assert ("not_eof3", not a_file.end_of_file)
				last_string := a_file.last_string
				assert ("not_empty", last_string.count > 0)
				assert_characters_equal ("all_read", '#', last_string.item (last_string.count))
				a_file.read_string (1000)
				assert ("eof", a_file.end_of_file)
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_empty_end_of_file is
			-- Test feature `end_of_file' on empty file with `read_character'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
		do
			a_name := Execution_environment.interpreted_string (empty_filename)
			create a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
				a_file.read_character
				assert ("eof", a_file.end_of_file)
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_empty_end_of_file2 is
			-- Test feature `end_of_file' on empty file with `read_string'.
		local
			a_file: KL_UNIX_INPUT_FILE
			a_name: STRING
		do
			a_name := Execution_environment.interpreted_string (empty_filename)
			create a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
				a_file.read_string (5)
				assert ("eof", a_file.end_of_file)
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_change_name1 is
			-- Test feature `change_name'.
			-- Old file exists and new file does not exist.
		local
			a_file: KL_UNIX_INPUT_FILE
			old_file: KL_UNIX_OUTPUT_FILE
			old_name, new_name: STRING
		do
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
			create old_file.make (old_name)
			old_file.open_write
			if old_file.is_open_write then
				old_file.put_string ("Hello gobo")
				old_file.close
				assert ("is_closed", old_file.is_closed)
				assert ("readable1", file_system.is_file_readable (old_name))
				assert ("not_readable1", not file_system.is_file_readable (new_name))
				create a_file.make (old_name)
				a_file.change_name (new_name)
				assert_same ("renamed", new_name, a_file.name)
				assert ("not_readable2", not file_system.is_file_readable (old_name))
				assert ("readable2", file_system.is_file_readable (new_name))
				assert_files_equal ("diff", hello_filename, new_name)
				a_file.delete
				assert ("not_readable3", not file_system.is_file_readable (new_name))
			else
				assert ("is_opened", False)
			end
		end

	test_change_name2 is
			-- Test feature `change_name'.
			-- Old file and new file do not exist.
		local
			a_file: KL_UNIX_INPUT_FILE
			old_name, new_name: STRING
		do
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
			assert ("not_readable1", not file_system.is_file_readable (old_name))
			assert ("not_readable2", not file_system.is_file_readable (new_name))
			create a_file.make (old_name)
			a_file.change_name (old_name)
			assert_same ("not_renamed", old_name, a_file.name)
			assert ("not_readable3", not file_system.is_file_readable (old_name))
			assert ("not_readable4", not file_system.is_file_readable (new_name))
		end

	test_change_name3 is
			-- Test feature `change_name'.
			-- Old file does not exist and new file exists.
		local
			a_file: KL_UNIX_INPUT_FILE
			old_name, new_name: STRING
			new_file: KL_UNIX_OUTPUT_FILE
		do
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
			create new_file.make (new_name)
			new_file.open_write
			if new_file.is_open_write then
				new_file.put_string ("Hello gobo")
				new_file.close
				assert ("is_closed", new_file.is_closed)
				assert ("not_readable1", not file_system.is_file_readable (old_name))
				assert ("readable1", file_system.is_file_readable (new_name))
				create a_file.make (old_name)
				a_file.change_name (new_name)
				assert_same ("not_renamed", old_name, a_file.name)
				assert ("not_readable2", not file_system.is_file_readable (old_name))
				assert ("readable2", file_system.is_file_readable (new_name))
				assert_files_equal ("diff", hello_filename, new_name)
				new_file.delete
				assert ("not_readable3", not file_system.is_file_readable (new_name))
			else
				assert ("is_opened", False)
			end
		end

	test_change_name4 is
			-- Test feature `change_name'.
			-- Old file and new file exist.
		local
			a_file: KL_UNIX_INPUT_FILE
			old_name, new_name: STRING
			out_file: KL_UNIX_OUTPUT_FILE
		do
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
			create out_file.make (new_name)
			out_file.open_write
			if out_file.is_open_write then
				out_file.put_string ("Hello gobo")
				out_file.close
				assert ("is_closed1", out_file.is_closed)
				create out_file.make (old_name)
				out_file.open_write
				if out_file.is_open_write then
					out_file.put_string ("This is the first line,")
					out_file.put_new_line
					out_file.put_string ("this is the second line.")
					out_file.put_new_line
					out_file.put_character ('#')
					out_file.close
					assert ("is_closed2", out_file.is_closed)
					assert ("readable1", file_system.is_file_readable (old_name))
					assert ("readable2", file_system.is_file_readable (new_name))
					create a_file.make (old_name)
					a_file.change_name (new_name)
					assert_same ("renamed", new_name, a_file.name)
					assert ("not_readable2", not file_system.is_file_readable (old_name))
					assert ("readable3", file_system.is_file_readable (new_name))
					assert_files_equal ("diff1", gobo_filename, new_name)
					a_file.delete
					assert ("not_readable3", not file_system.is_file_readable (new_name))
				else
					assert ("is_opened2", False)
				end
			else
				assert ("is_opened1", False)
			end
		end

	test_delete_file is
			-- Test feature `delete_file'.
		local
			a_file: KL_UNIX_INPUT_FILE
			out_file: KL_UNIX_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			create out_file.make (a_name)
			out_file.open_write
			if out_file.is_open_write then
				out_file.put_string ("Hello gobo")
				out_file.close
				assert ("is_closed", out_file.is_closed)
				assert ("readable", file_system.is_file_readable (a_name))
				assert_files_equal ("diff", hello_filename, a_name)
				create a_file.make (a_name)
				a_file.delete
				assert ("not_readable", not file_system.is_file_readable (a_name))
			else
				assert ("is_opened", False)
			end
		end

	test_unix is
			-- Test that file is a unix file.
		local
			a_file: KL_UNIX_INPUT_FILE
			out_file: KL_BINARY_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			create out_file.make (a_name)
			out_file.open_write
			if out_file.is_open_write then
				out_file.put_character ('%N')
				out_file.close
				assert ("is_closed1", out_file.is_closed)
				assert ("readable1", file_system.is_file_readable (a_name))
				create a_file.make (a_name)
				a_file.open_read
				if a_file.is_open_read then
					a_file.read_new_line
					assert ("not_eof1", not a_file.end_of_file)
					assert_equal ("new_line", "%N", a_file.last_string)
					a_file.read_character
					assert ("eof1", a_file.end_of_file)
					a_file.close
					assert ("is_closed2", a_file.is_closed)
				else
					assert ("is_opened2", False)
				end
				out_file.delete
				assert ("not_readable1", not file_system.is_file_readable (a_name))
			else
				assert ("is_opened1", False)
			end
		end

end
