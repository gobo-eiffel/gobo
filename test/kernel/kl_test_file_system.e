indexing

	description:

		"Test features of class KL_FILE_SYSTEM"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class KL_TEST_FILE_SYSTEM

inherit

	TS_TEST_CASE

	KL_SHARED_EXECUTION_ENVIRONMENT

feature -- Test

	test_make is
			-- Test feature `make'.
		local
			a_file_system: KL_FILE_SYSTEM
		do
			!! a_file_system.make
			assert ("a_file_system_not_void", a_file_system /= Void)
		end

	test_is_file_readable is
			-- Test feature `is_file_readable'.
		local
			a_file_system: KL_FILE_SYSTEM
			a_name: STRING
		do
			!! a_file_system.make
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data/gobo.txt")
			assert ("readable1", a_file_system.is_file_readable (a_name))
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data/empty.txt")
			assert ("readable2", a_file_system.is_file_readable (a_name))
			assert ("not_readable1", not a_file_system.is_file_readable ("gobo123"))
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data/gobo.txt oops")
			assert ("not_readable2", not a_file_system.is_file_readable (a_name))
		end

	test_is_directory_readable is
			-- Test feature `is_directory_readable'.
		local
			a_file_system: KL_FILE_SYSTEM
			a_name: STRING
		do
			!! a_file_system.make
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data")
			assert ("readable1", a_file_system.is_directory_readable (a_name))
			a_name := Execution_environment.interpreted_string (".")
			assert ("readable2", a_file_system.is_directory_readable (a_name))
			assert ("not_readable1", not a_file_system.is_directory_readable ("gobo123"))
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data oops")
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
		end

	test_rename_file1 is
			-- Test feature `rename_file'.
			-- Old file exists and new file does not exist.
		local
			a_file_system: KL_FILE_SYSTEM
			a_file: KL_OUTPUT_FILE
			old_name, new_name: STRING
		do
			!! a_file_system.make
			old_name := "gobo201.tmp"
			new_name := "gobo202.tmp"
			!! a_file.make (old_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert ("readable1", a_file_system.is_file_readable (old_name))
				assert ("not_readable1", not a_file_system.is_file_readable (new_name))
				a_file_system.rename_file (old_name, new_name)
				assert ("not_readable2", not a_file_system.is_file_readable (old_name))
				assert ("readable2", a_file_system.is_file_readable (new_name))
				assert_files_equal ("diff", "$GOBO/test/kernel/data/hello.txt", new_name)
				a_file_system.delete_file (new_name)
				assert ("not_readable3", not a_file_system.is_file_readable (new_name))
			else
				assert ("is_opened", False)
			end
		end

	test_rename_file2 is
			-- Test feature `rename_file'.
			-- Old file and new file do not exist.
		local
			a_file_system: KL_FILE_SYSTEM
			old_name, new_name: STRING
		do
			!! a_file_system.make
			old_name := "gobo203.tmp"
			new_name := "gobo204.tmp"
			assert ("not_readable1", not a_file_system.is_file_readable (old_name))
			assert ("not_readable2", not a_file_system.is_file_readable (new_name))
			a_file_system.rename_file (old_name, new_name)
			assert ("not_readable3", not a_file_system.is_file_readable (old_name))
			assert ("not_readable4", not a_file_system.is_file_readable (new_name))
		end

	test_rename_file3 is
			-- Test feature `rename_file'.
			-- Old file does not exist and new file exists.
		local
			a_file_system: KL_FILE_SYSTEM
			old_name, new_name: STRING
			a_file: KL_OUTPUT_FILE
		do
			!! a_file_system.make
			old_name := "gobo205.tmp"
			new_name := "gobo206.tmp"
			!! a_file.make (new_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert ("not_readable1", not a_file_system.is_file_readable (old_name))
				assert ("readable1", a_file_system.is_file_readable (new_name))
				a_file_system.rename_file (old_name, new_name)
				assert ("not_readable2", not a_file_system.is_file_readable (old_name))
				assert ("readable2", a_file_system.is_file_readable (new_name))
				assert_files_equal ("diff", "$GOBO/test/kernel/data/hello.txt", new_name)
				a_file_system.delete_file (new_name)
				assert ("not_readable3", not a_file_system.is_file_readable (new_name))
			else
				assert ("is_opened", False)
			end
		end

	test_rename_file4 is
			-- Test feature `rename_file'.
			-- Old file and new file exist.
		local
			a_file_system: KL_FILE_SYSTEM
			old_name, new_name: STRING
			a_file: KL_OUTPUT_FILE
		do
			!! a_file_system.make
			old_name := "gobo207.tmp"
			new_name := "gobo208.tmp"
			!! a_file.make (new_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed1", a_file.is_closed)
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
					assert ("readable1", a_file_system.is_file_readable (old_name))
					assert ("readable2", a_file_system.is_file_readable (new_name))
					a_file_system.rename_file (old_name, new_name)
					assert ("not_readable1", not a_file_system.is_file_readable (old_name))
					assert ("readable3", a_file_system.is_file_readable (new_name))
					assert_files_equal ("diff", "$GOBO/test/kernel/data/gobo.txt", new_name)
					a_file_system.delete_file (new_name)
					assert ("not_readable2", not a_file_system.is_file_readable (new_name))
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
			a_file_system: KL_FILE_SYSTEM
			a_file: KL_OUTPUT_FILE
			a_name: STRING
		do
			!! a_file_system.make
			a_name := "gobo209.tmp"
			!! a_file.make (a_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert ("readable", a_file_system.is_file_readable (a_name))
				assert_files_equal ("diff", "$GOBO/test/kernel/data/hello.txt", a_name)
				a_file_system.delete_file (a_name)
				assert ("not_readable", not a_file_system.is_file_readable (a_name))
			else
				assert ("is_opened", False)
			end
		end

	test_create_directory1 is
			-- Test feature `create_directory'.
			-- Create non-existing directory.
		local
			a_file_system: KL_FILE_SYSTEM
			a_name: STRING
		do
			!! a_file_system.make
			a_name := "gobo2001"
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_name)
			assert ("readable1", a_file_system.is_directory_readable (a_name))
			a_file_system.delete_directory (a_name)
			assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
		end

	test_create_directory2 is
			-- Test feature `create_directory'.
			-- Create existing directory.
		local
			a_file_system: KL_FILE_SYSTEM
			a_name, a_filename: STRING
			a_file: KL_OUTPUT_FILE
		do
			!! a_file_system.make
			a_name := "gobo2002"
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_name)
			assert ("readable1", a_file_system.is_directory_readable (a_name))
			a_filename := "gobo2002/gobo210.tmp"
			!! a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert ("readable2", a_file_system.is_file_readable (a_filename))
				assert_files_equal ("diff1", "$GOBO/test/kernel/data/hello.txt", a_filename)
				a_file_system.create_directory (a_name)
				assert ("still_there", a_file_system.is_directory_readable (a_name))
				assert ("readable3", a_file_system.is_file_readable (a_filename))
				assert_files_equal ("diff2", "$GOBO/test/kernel/data/hello.txt", a_filename)
				a_file_system.delete_file (a_filename)
				assert ("not_readable2", not a_file_system.is_file_readable (a_filename))
				a_file_system.delete_directory (a_name)
				assert ("not_readable3", not a_file_system.is_directory_readable (a_name))
			else
				assert ("is_opened", False)
			end
		end

	test_create_directory3 is
			-- Test feature `create_directory'.
			-- Create nested directory.
		local
			a_file_system: KL_FILE_SYSTEM
			a_name, a_parent: STRING
		do
			!! a_file_system.make
			a_name := "gobo2003/gobo211"
			a_parent := "gobo2003"
			assert ("not_readable1", not a_file_system.is_directory_readable (a_parent))
			assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_name)
			assert ("not_readable3", not a_file_system.is_directory_readable (a_parent))
			assert ("not_readable4", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_parent)
			assert ("readable1", a_file_system.is_directory_readable (a_parent))
			assert ("not_readable5", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_name)
			assert ("readable2", a_file_system.is_directory_readable (a_parent))
			assert ("readable3", a_file_system.is_directory_readable (a_name))
			a_file_system.delete_directory (a_name)
			assert ("readable4", a_file_system.is_directory_readable (a_parent))
			assert ("not_readable6", not a_file_system.is_directory_readable (a_name))
			a_file_system.delete_directory (a_parent)
			assert ("not_readable7", not a_file_system.is_directory_readable (a_parent))
			assert ("not_readable8", not a_file_system.is_directory_readable (a_name))
		end

	test_delete_directory1 is
			-- Test feature `delete_directory'.
			-- Empty directory.
		local
			a_file_system: KL_FILE_SYSTEM
			a_name: STRING
		do
			!! a_file_system.make
			a_name := "gobo2004"
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_name)
			assert ("readable1", a_file_system.is_directory_readable (a_name))
			a_file_system.delete_directory (a_name)
			assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
		end

	test_delete_directory2 is
			-- Test feature `delete_directory'.
			-- Non-existing directory.
		local
			a_file_system: KL_FILE_SYSTEM
			a_name: STRING
		do
			!! a_file_system.make
			a_name := "gobo2005"
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
			a_file_system.delete_directory (a_name)
			assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
		end

	test_delete_directory3 is
			-- Test feature `delete_directory'.
			-- Non-empty directory.
		local
			a_file_system: KL_FILE_SYSTEM
			a_name, a_filename: STRING
			a_file: KL_OUTPUT_FILE
		do
			!! a_file_system.make
			a_name := "gobo2006"
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_name)
			assert ("readable1", a_file_system.is_directory_readable (a_name))
			a_filename := "gobo2006/gobo212.tmp"
			!! a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert ("readable2", a_file_system.is_file_readable (a_filename))
				assert_files_equal ("diff", "$GOBO/test/kernel/data/hello.txt", a_filename)
				a_file_system.delete_directory (a_name)
				assert ("cannot_delete", a_file_system.is_directory_readable (a_name))
				a_file_system.delete_file (a_filename)
				assert ("not_readable2", not a_file_system.is_file_readable (a_filename))
				a_file_system.delete_directory (a_name)
				assert ("not_readable3", not a_file_system.is_directory_readable (a_name))
			else
				assert ("is_opened", False)
			end
		end

	test_delete_directory4 is
			-- Test feature `delete_directory'.
			-- Nested directory.
		local
			a_file_system: KL_FILE_SYSTEM
			a_name, a_parent: STRING
		do
			!! a_file_system.make
			a_name := "gobo2007/gobo213"
			a_parent := "gobo2007"
			assert ("not_readable1", not a_file_system.is_directory_readable (a_parent))
			assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_parent)
			assert ("readable1", a_file_system.is_directory_readable (a_parent))
			assert ("not_readable3", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_name)
			assert ("readable2", a_file_system.is_directory_readable (a_parent))
			assert ("readable3", a_file_system.is_directory_readable (a_name))
			a_file_system.delete_directory (a_name)
			assert ("readable4", a_file_system.is_directory_readable (a_parent))
			assert ("not_readable4", not a_file_system.is_directory_readable (a_name))
			a_file_system.delete_directory (a_parent)
			assert ("not_readable5", not a_file_system.is_directory_readable (a_parent))
			assert ("not_readable6", not a_file_system.is_directory_readable (a_name))
		end

	test_current_working_directory is
			-- Test feature `current_working_directory'.
		local
			a_file_system: KL_FILE_SYSTEM
			a_name: STRING
			old_cwd: STRING
		do
			!! a_file_system.make
			old_cwd := a_file_system.current_working_directory
			assert ("readable0", a_file_system.is_directory_readable (old_cwd))
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel")
			assert ("readable1", a_file_system.is_directory_readable (a_name))
			a_file_system.set_current_working_directory (a_name)
			assert ("readable2", a_file_system.is_directory_readable (a_name))
			assert ("readable3", a_file_system.is_directory_readable (a_file_system.current_working_directory))
			assert_filenames_equal ("cwd1", a_name, a_file_system.current_working_directory)
			a_name := "data"
			a_file_system.set_current_working_directory (a_name)
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
			assert ("readable4", a_file_system.is_directory_readable (a_file_system.current_working_directory))
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data")
			assert ("readable5", a_file_system.is_directory_readable (a_name))
			assert_filenames_equal ("cwd2", a_name, a_file_system.current_working_directory)
			assert ("readable6", a_file_system.is_directory_readable (old_cwd))
			a_file_system.set_current_working_directory (old_cwd)
			assert_filenames_equal ("cwd3", old_cwd, a_file_system.current_working_directory)
		end

	test_set_current_working_directory1 is
			-- Test feature `set_current_working_directory'.
			-- Existing directory.
		local
			a_file_system: KL_FILE_SYSTEM
			old_cwd: STRING
			a_name: STRING
		do
			!! a_file_system.make
			old_cwd := a_file_system.current_working_directory
			assert ("readable0", a_file_system.is_directory_readable (old_cwd))
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel")
			assert ("readable1", a_file_system.is_directory_readable (a_name))
			a_file_system.set_current_working_directory (a_name)
			assert ("readable2", a_file_system.is_directory_readable (a_name))
			assert ("readable3", a_file_system.is_directory_readable (a_file_system.current_working_directory))
			assert_filenames_equal ("cwd1", a_name, a_file_system.current_working_directory)
			a_name := "data"
			assert ("readable4", a_file_system.is_directory_readable (a_name))
			a_file_system.set_current_working_directory (a_name)
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
			assert ("readable5", a_file_system.is_directory_readable (a_file_system.current_working_directory))
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data")
			assert_filenames_equal ("cwd2", a_name, a_file_system.current_working_directory)
			a_name := "."
			assert ("readable6", a_file_system.is_directory_readable (a_name))
			a_file_system.set_current_working_directory (a_name)
			assert ("readable7", a_file_system.is_directory_readable (a_file_system.current_working_directory))
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data")
			assert_filenames_equal ("cwd3", a_name, a_file_system.current_working_directory)
			a_name := ".."
			assert ("readable8", a_file_system.is_directory_readable (a_name))
			a_file_system.set_current_working_directory (a_name)
			assert ("readable9", a_file_system.is_directory_readable (a_file_system.current_working_directory))
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel")
			assert_filenames_equal ("cwd4", a_name, a_file_system.current_working_directory)
			a_name := "data"
			assert ("readable10", a_file_system.is_directory_readable (a_name))
			a_file_system.set_current_working_directory (a_name)
			assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
			assert ("readable11", a_file_system.is_directory_readable (a_file_system.current_working_directory))
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data")
			assert_filenames_equal ("cwd2", a_name, a_file_system.current_working_directory)
			assert ("readable10", a_file_system.is_directory_readable (old_cwd))
			a_file_system.set_current_working_directory (old_cwd)
			assert_filenames_equal ("cwd5", old_cwd, a_file_system.current_working_directory)
		end

	test_set_current_working_directory2 is
			-- Test feature `set_current_working_directory'.
			-- Non-existing directory.
		local
			a_file_system: KL_FILE_SYSTEM
			old_cwd: STRING
			a_name: STRING
		do
			!! a_file_system.make
			old_cwd := a_file_system.current_working_directory
			assert ("readable1", a_file_system.is_directory_readable (old_cwd))
			a_name := "gobo2008"
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
			a_file_system.set_current_working_directory (a_name)
			assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
			assert ("readable1", a_file_system.is_directory_readable (a_file_system.current_working_directory))
			assert_filenames_equal ("not_changed", old_cwd, a_file_system.current_working_directory)
		end

	test_parent_directory1 is
			-- Test feature `parent_directory'.
			-- Absolute directory name.
		local
			a_file_system: KL_FILE_SYSTEM
			cwd: STRING
			a_name, a_parent: STRING
		do
			!! a_file_system.make
			cwd := a_file_system.current_working_directory
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel")
			assert ("readable1", a_file_system.is_directory_readable (a_name))
			a_parent := a_file_system.parent_directory (a_name)
			a_name := Execution_environment.interpreted_string ("$GOBO/test")
			assert_filenames_equal ("parent1", a_name, a_parent)
			assert_filenames_equal ("cwd1", cwd, a_file_system.current_working_directory)
		end

	test_parent_directory2 is
			-- Test feature `parent_directory'.
			-- Relative directory name.
		local
			a_file_system: KL_FILE_SYSTEM
			cwd: STRING
			a_name, a_parent: STRING
		do
			!! a_file_system.make
			cwd := a_file_system.current_working_directory
			a_name := Execution_environment.interpreted_string ("$GOBO/test")
			assert ("readable1", a_file_system.is_directory_readable (a_name))
			a_file_system.set_current_working_directory (a_name)
			a_name := "kernel/data"
			assert ("readable2", a_file_system.is_directory_readable (a_name))
			a_parent := a_file_system.parent_directory (a_name)
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel")
			assert_filenames_equal ("parent1", a_name, a_parent)
			a_file_system.set_current_working_directory (cwd)
			assert_filenames_equal ("back", cwd, a_file_system.current_working_directory)
		end

	test_parent_directory3 is
			-- Test feature `parent_directory'.
			-- Non-existing directory name.
		local
			a_file_system: KL_FILE_SYSTEM
			cwd: STRING
			a_name, a_parent: STRING
		do
			!! a_file_system.make
			cwd := a_file_system.current_working_directory
			a_name := "gobo2009"
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
			a_parent := a_file_system.parent_directory (a_name)
			assert ("parent1", a_parent = Void)
			assert_filenames_equal ("not_moved", cwd, a_file_system.current_working_directory)
		end

end -- class KL_TEST_FILE_SYSTEM
