indexing

	description:

		"Test features of class KL_INPUT_FILE"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class KL_TEST_INPUT_FILE

inherit

	TS_TEST_CASE

	KL_SHARED_FILE_SYSTEM
	KL_SHARED_EXECUTION_ENVIRONMENT

feature -- Test

	test_make is
			-- Test feature `make'.
		local
			a_file: KL_INPUT_FILE
			a_name: STRING
		do
			a_name := "gobo401.tmp"
			!! a_file.make (a_name)
			assert ("a_file_not_void", a_file /= Void)
			assert_same ("name_set", a_name, a_file.name)
			assert ("is_closed", a_file.is_closed)
		end

	test_open_read is
			-- Test feature `open_read'.
		local
			a_file: KL_INPUT_FILE
			a_name: STRING
		do
				-- Existing filename:
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data/gobo.txt")
			!! a_file.make (a_name)
			assert ("is_closed", a_file.is_closed)
			a_file.open_read
			assert ("is_opened", a_file.is_open_read)
			a_file.close
			assert ("is_closed2", a_file.is_closed)
				-- Dummy filename:
			a_name := "gobo123"
			!! a_file.make (a_name)
			assert ("is_closed3", a_file.is_closed)
			a_file.open_read
			assert ("not_opened", not a_file.is_open_read)
		end

	test_read_character is
			-- Test feature `read_character'.
		local
			a_file: KL_INPUT_FILE
			a_name: STRING
		do
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data/gobo.txt")
			!! a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
				a_file.read_character
				assert ("not_eof2", not a_file.end_of_file)
				assert_equal ("read1", 'T', a_file.last_character)
				assert ("not_eof3", not a_file.end_of_file)
				assert_equal ("read2", 'T', a_file.last_character)
				assert ("not_eof4", not a_file.end_of_file)
				a_file.read_character
				assert ("not_eof5", not a_file.end_of_file)
				assert_equal ("read3", 'h', a_file.last_character)
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_read_string is
			-- Test feature `read_string'.
		local
			a_file: KL_INPUT_FILE
			a_name: STRING
			last_string, last_string2: STRING
		do
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data/gobo.txt")
			!! a_file.make (a_name)
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
			a_file: KL_INPUT_FILE
			a_name: STRING
			last_string, last_string2: STRING
		do
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data/gobo.txt")
			!! a_file.make (a_name)
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
				assert ("eof1", a_file.end_of_file)
				last_string := a_file.last_string
				assert_equal ("read4", "#", last_string)
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_read_line2 is
			-- Test feature `read_line'.
			-- The last line has a line-separator.
		local
			a_file: KL_INPUT_FILE
			a_name: STRING
			last_string, last_string2: STRING
		do
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data/booleans.txt")
			!! a_file.make (a_name)
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
				last_string := a_file.last_string
				assert_equal ("read4", "", last_string)
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_read_line3 is
			-- Test feature `read_line'.
			-- Empty file.
		local
			a_file: KL_INPUT_FILE
			a_name: STRING
			last_string: STRING
		do
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data/empty.txt")
			!! a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
				a_file.read_line
				assert ("eof1", a_file.end_of_file)
				last_string := a_file.last_string
				assert_equal ("read1", "", last_string)
				assert ("eof2", a_file.end_of_file)
				assert_equal ("read2", "", a_file.last_string)
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_read_to_string is
			-- Test feature `read_to_string'.
		local
			a_file: KL_INPUT_FILE
			a_name: STRING
			a_string: STRING
			nb: INTEGER
		do
			a_string := "#######"
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data/gobo.txt")
			!! a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
				nb := a_file.read_to_string (a_string, 1, 7)
				assert ("not_eof2", not a_file.end_of_file)
				assert_equal ("nb_char1", 7, nb)
				assert_equal ("read1", "This is", a_string)
				nb := a_file.read_to_string (a_string, 3, 2)
				assert ("not_eof3", not a_file.end_of_file)
				assert_equal ("nb_char2", 2, nb)
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
			a_file: KL_INPUT_FILE
			a_name: STRING
			a_buffer: KL_CHARACTER_BUFFER
			nb: INTEGER
		do
			!! a_buffer.make (8)
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data/gobo.txt")
			!! a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
				nb := a_file.read_to_buffer (a_buffer, 1, 8)
				assert ("not_eof2", not a_file.end_of_file)
				assert_equal ("nb_char1", 8, nb)
				assert_equal ("read1", "This is ", a_buffer.to_string)
				nb := a_file.read_to_buffer (a_buffer, 3, 2)
				assert ("not_eof3", not a_file.end_of_file)
				assert_equal ("nb_char2", 2, nb)
				assert_equal ("read2", "Thth is ", a_buffer.to_string)
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_end_of_file is
			-- Test feature `end_of_file' with `read_character'.
		local
			a_file: KL_INPUT_FILE
			a_name: STRING
		do
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data/gobo.txt")
			!! a_file.make (a_name)
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
			a_file: KL_INPUT_FILE
			a_name: STRING
			last_string: STRING
		do
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data/gobo.txt")
			!! a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
				a_file.read_string (7)
				assert ("not_eof2", not a_file.end_of_file)
				assert_equal ("read", "This is", a_file.last_string)
				a_file.read_string (1000)
				assert ("eof", a_file.end_of_file)
				last_string := a_file.last_string
				assert ("not_empty", last_string.count > 0)
				assert_equal ("eof2", '#', last_string.item (last_string.count))
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_empty_end_of_file is
			-- Test feature `end_of_file' on empty file with `read_character'.
		local
			a_file: KL_INPUT_FILE
			a_name: STRING
		do
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data/empty.txt")
			!! a_file.make (a_name)
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
			a_file: KL_INPUT_FILE
			a_name: STRING
		do
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data/empty.txt")
			!! a_file.make (a_name)
			a_file.open_read
			if a_file.is_open_read then
				assert ("not_eof", not a_file.end_of_file)
				a_file.read_string (5)
				assert ("eof", a_file.end_of_file)
				assert_equal ("empty", "", a_file.last_string)
				a_file.close
				assert ("is_closed", a_file.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_rename_file1 is
			-- Test feature `rename_file'.
			-- Old file exists and new file does not exist.
		local
			a_file: KL_INPUT_FILE
			old_file: KL_OUTPUT_FILE
			old_name, new_name: STRING
		do
			old_name := "gobo402.tmp"
			new_name := "gobo403.tmp"
			!! old_file.make (old_name)
			old_file.open_write
			if old_file.is_open_write then
				old_file.put_string ("Hello gobo")
				old_file.close
				assert ("is_closed", old_file.is_closed)
				assert ("readable1", file_system.is_file_readable (old_name))
				assert ("not_readable1", not file_system.is_file_readable (new_name))
				!! a_file.make (old_name)
				a_file.rename_file (new_name)
				assert_same ("renamed", new_name, a_file.name)
				assert ("not_readable2", not file_system.is_file_readable (old_name))
				assert ("readable2", file_system.is_file_readable (new_name))
				assert_files_equal ("diff", "$GOBO/test/kernel/data/hello.txt", new_name)
				a_file.delete
				assert ("not_readable3", not file_system.is_file_readable (new_name))
			else
				assert ("is_opened", False)
			end
		end

	test_rename_file2 is
			-- Test feature `rename_file'.
			-- Old file and new file do not exist.
		local
			a_file: KL_INPUT_FILE
			old_name, new_name: STRING
		do
			old_name := "gobo404.tmp"
			new_name := "gobo405.tmp"
			assert ("not_readable1", not file_system.is_file_readable (old_name))
			assert ("not_readable2", not file_system.is_file_readable (new_name))
			!! a_file.make (old_name)
			a_file.rename_file (old_name)
			assert_same ("not_renamed", old_name, a_file.name)
			assert ("not_readable3", not file_system.is_file_readable (old_name))
			assert ("not_readable4", not file_system.is_file_readable (new_name))
		end

	test_rename_file3 is
			-- Test feature `rename_file'.
			-- Old file does not exist and new file exists.
		local
			a_file: KL_INPUT_FILE
			old_name, new_name: STRING
			new_file: KL_OUTPUT_FILE
		do
			old_name := "gobo406.tmp"
			new_name := "gobo407.tmp"
			!! new_file.make (new_name)
			new_file.open_write
			if new_file.is_open_write then
				new_file.put_string ("Hello gobo")
				new_file.close
				assert ("is_closed", new_file.is_closed)
				assert ("not_readable1", not file_system.is_file_readable (old_name))
				assert ("readable1", file_system.is_file_readable (new_name))
				!! a_file.make (old_name)
				a_file.rename_file (new_name)
				assert_same ("not_renamed", old_name, a_file.name)
				assert ("not_readable2", not file_system.is_file_readable (old_name))
				assert ("readable2", file_system.is_file_readable (new_name))
				assert_files_equal ("diff", "$GOBO/test/kernel/data/hello.txt", new_name)
				new_file.delete
				assert ("not_readable3", not file_system.is_file_readable (new_name))
			else
				assert ("is_opened", False)
			end
		end

	test_rename_file4 is
			-- Test feature `rename_file'.
			-- Old file and new file exist.
		local
			a_file: KL_INPUT_FILE
			old_name, new_name: STRING
			out_file: KL_OUTPUT_FILE
		do
			old_name := "gobo408.tmp"
			new_name := "gobo409.tmp"
			!! out_file.make (new_name)
			out_file.open_write
			if out_file.is_open_write then
				out_file.put_string ("Hello gobo")
				out_file.close
				assert ("is_closed1", out_file.is_closed)
				!! out_file.make (old_name)
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
					!! a_file.make (old_name)
					a_file.rename_file (new_name)
					assert_same ("renamed", new_name, a_file.name)
					assert ("not_readable1", not file_system.is_file_readable (old_name))
					assert ("readable3", file_system.is_file_readable (new_name))
					assert_files_equal ("diff", "$GOBO/test/kernel/data/gobo.txt", new_name)
					a_file.delete
					assert ("not_readable2", not file_system.is_file_readable (new_name))
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
			a_file: KL_INPUT_FILE
			out_file: KL_OUTPUT_FILE
			a_name: STRING
		do
			a_name := "gobo410.tmp"
			!! out_file.make (a_name)
			out_file.open_write
			if out_file.is_open_write then
				out_file.put_string ("Hello gobo")
				out_file.close
				assert ("is_closed", out_file.is_closed)
				assert ("readable", file_system.is_file_readable (a_name))
				assert_files_equal ("diff", "$GOBO/test/kernel/data/hello.txt", a_name)
				!! a_file.make (a_name)
				a_file.delete
				assert ("not_readable", not file_system.is_file_readable (a_name))
			else
				assert ("is_opened", False)
			end
		end

end -- class KL_TEST_INPUT_FILE
