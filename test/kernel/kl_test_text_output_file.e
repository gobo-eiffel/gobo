indexing

	description:

		"Test features of class KL_TEXT_OUTPUT_FILE"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class KL_TEST_TEXT_OUTPUT_FILE

inherit

	KL_TEST_CASE

feature -- Test

	test_make is
			-- Test feature `make'.
		local
			a_file: KL_TEXT_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			!! a_file.make (a_name)
			assert ("a_file_not_void", a_file /= Void)
			assert_same ("name_set", a_name, a_file.name)
			assert ("is_closed", a_file.is_closed)
		end

	test_eol is
			-- Test feature `eol'.
		local
			a_file: KL_TEXT_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			!! a_file.make (a_name)
			assert_equal ("eol", "%N", a_file.eol)
		end

	test_open_write is
			-- Test feature `open_write'.
		local
			a_file: KL_TEXT_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			!! a_file.make (a_name)
			assert ("is_closed", a_file.is_closed)
			a_file.open_write
			assert ("is_opened", a_file.is_open_write)
			a_file.close
			assert ("is_closed2", a_file.is_closed)
			assert_files_equal ("empty", empty_filename, a_name)
			file_system.delete_file (a_name)
		end

	test_put_character is
			-- Test feature `put_character'.
		local
			a_file: KL_TEXT_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			!! a_file.make (a_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_character ('H')
				a_file.put_character ('e')
				a_file.put_character ('l')
				a_file.put_character ('l')
				a_file.put_character ('o')
				a_file.put_character (' ')
				a_file.put_character ('g')
				a_file.put_character ('o')
				a_file.put_character ('b')
				a_file.put_character ('o')
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert_files_equal ("diff", hello_filename, a_name)
				file_system.delete_file (a_name)
			else
				assert ("is_opened", False)
			end
		end

	test_put_string is
			-- Test feature `put_string'.
		local
			a_file: KL_TEXT_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			!! a_file.make (a_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello")
				a_file.put_character (' ')
				a_file.put_string ("gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert_files_equal ("diff", hello_filename, a_name)
				file_system.delete_file (a_name)
			else
				assert ("is_opened", False)
			end
		end

	test_put_line is
			-- Test feature `put_line'.
		local
			a_file: KL_TEXT_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			!! a_file.make (a_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_line ("This is the first line,")
				a_file.put_line ("this is the second line.")
				a_file.put_character ('#')
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert_files_equal ("diff", gobo_filename, a_name)
				file_system.delete_file (a_name)
			else
				assert ("is_opened", False)
			end
		end

	test_put_new_line is
			-- Test feature `put_new_line'.
		local
			a_file: KL_TEXT_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			!! a_file.make (a_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("This is the first line,")
				a_file.put_new_line
				a_file.put_string ("this is the second line.")
				a_file.put_new_line
				a_file.put_character ('#')
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert_files_equal ("diff", gobo_filename, a_name)
				file_system.delete_file (a_name)
			else
				assert ("is_opened", False)
			end
		end

	test_put_integer is
			-- Test feature `put_integer'.
		local
			a_file: KL_TEXT_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			!! a_file.make (a_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_integer (0)
				a_file.put_new_line
				a_file.put_integer (-123)
				a_file.put_new_line
				a_file.put_integer (5674)
				a_file.put_new_line
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert_files_equal ("diff", integers_filename, a_name)
				file_system.delete_file (a_name)
			else
				assert ("is_opened", False)
			end
		end

	test_put_boolean is
			-- Test feature `put_boolean'.
		local
			a_file: KL_TEXT_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			!! a_file.make (a_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_boolean (True)
				a_file.put_new_line
				a_file.put_boolean (False)
				a_file.put_new_line
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert_files_equal ("diff", booleans_filename, a_name)
				file_system.delete_file (a_name)
			else
				assert ("is_opened", False)
			end
		end

	test_flush is
			-- Test feature `flush'.
		local
			a_file: KL_TEXT_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			!! a_file.make (a_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.flush
				a_file.put_string ("Hello")
				a_file.flush
				a_file.put_character (' ')
				a_file.put_string ("gobo")
				a_file.flush
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert_files_equal ("diff", hello_filename, a_name)
				file_system.delete_file (a_name)
			else
				assert ("is_opened", False)
			end
		end

	test_rename_file1 is
			-- Test feature `rename_file'.
			-- Old file exists and new file does not exist.
		local
			a_file: KL_TEXT_OUTPUT_FILE
			old_name, new_name: STRING
		do
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
			!! a_file.make (old_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert ("readable1", file_system.is_file_readable (old_name))
				assert ("not_readable1", not file_system.is_file_readable (new_name))
				a_file.rename_file (new_name)
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

	test_rename_file2 is
			-- Test feature `rename_file'.
			-- Old file and new file do not exist.
		local
			a_file: KL_TEXT_OUTPUT_FILE
			old_name, new_name: STRING
		do
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
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
			a_file: KL_TEXT_OUTPUT_FILE
			old_name, new_name: STRING
			new_file: KL_TEXT_OUTPUT_FILE
		do
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
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
				assert_files_equal ("diff", hello_filename, new_name)
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
			a_file: KL_TEXT_OUTPUT_FILE
			new_file: KL_TEXT_OUTPUT_FILE
			old_name, new_name: STRING
		do
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
			!! new_file.make (new_name)
			new_file.open_write
			if new_file.is_open_write then
				new_file.put_string ("Hello gobo")
				new_file.close
				assert ("is_closed1", new_file.is_closed)
				!! a_file.make (old_name)
				a_file.open_write
				if a_file.is_open_write then
					a_file.put_string ("This is the first line,")
					a_file.put_new_line
					a_file.put_string ("this is the second line.")
					a_file.put_new_line
					a_file.put_character ('#')
					a_file.close
					assert ("is_closed2", a_file.is_closed)
					assert ("readable1", file_system.is_file_readable (old_name))
					assert ("readable2", file_system.is_file_readable (new_name))
					a_file.rename_file (new_name)
					assert_same ("not_renamed", old_name, a_file.name)
					assert ("readable3", file_system.is_file_readable (old_name))
					assert ("readable4", file_system.is_file_readable (new_name))
					assert_files_equal ("diff1", gobo_filename, old_name)
					assert_files_equal ("diff2", hello_filename, new_name)
					a_file.delete
					assert ("not_readable2", not file_system.is_file_readable (old_name))
					!! a_file.make (new_name)
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
			a_file: KL_TEXT_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			!! a_file.make (a_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert ("readable", file_system.is_file_readable (a_name))
				assert_files_equal ("diff", hello_filename, a_name)
				a_file.delete
				assert ("not_readable", not file_system.is_file_readable (a_name))
			else
				assert ("is_opened", False)
			end
		end

end -- class KL_TEST_TEXT_OUTPUT_FILE
