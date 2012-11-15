note

	description:

		"Test features of class KL_WINDOWS_FILE_SYSTEM"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2012, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_TEST_WINDOWS_FILE_SYSTEM

inherit

	KL_TEST_CASE
	KL_SHARED_EXECUTION_ENVIRONMENT

create

	make_default

feature -- Creation

	test_make
			-- Test feature `make'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
				-- The file system has been created.
			assert ("a_file_system_not_void", a_file_system /= Void)
		end

feature -- File handling

	test_is_file_readable
			-- Test feature `is_file_readable'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_name: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			create a_file_system.make
				-- The following two files, whose pathnames have a non-empty
				-- dirname, are readable.
			a_name := gobo_filename
			a_name := Execution_environment.interpreted_string (a_name)
			assert ("readable1", a_file_system.is_file_readable (a_name))
			a_name := empty_filename
			a_name := Execution_environment.interpreted_string (a_name)
			assert ("readable2", a_file_system.is_file_readable (a_name))
				-- The following file, whose pathname has a non-empty
				-- dirname, is not readable.
			a_name := file_system.pathname (data_dirname, "gobo.txtoops")
			a_name := Execution_environment.interpreted_string (a_name)
			assert ("not_readable1", not a_file_system.is_file_readable (a_name))
				-- The following file, whose pathname has a non-empty
				-- dirname and a basename containing a space, is not readable.
			a_name := file_system.pathname (data_dirname, "gobo.txt oops")
			a_name := Execution_environment.interpreted_string (a_name)
			assert ("not_readable2", not a_file_system.is_file_readable (a_name))
				-- A file with an empty name is not readable.
			assert ("not_readable3", not a_file_system.is_file_readable (""))
				-- The following pathname exists, but it is a
				-- directory and hence is not a readable file.
			a_name := data_dirname
			a_name := Execution_environment.interpreted_string (a_name)
			assert ("directory_readable", a_file_system.is_directory_readable (a_name))
			assert ("not_readable4", not a_file_system.is_file_readable (a_name))
				-- Create a file in the current directory and then
				-- check that this file, whose pathname has an empty
				-- dirname, is readable. Then delete this newly created
				-- file and check than it is not readable anymore.
			a_name := new_filename ("gobo", ".tmp")
			assert ("not_readable5", not a_file_system.is_file_readable (a_name))
			create a_file.make (a_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert ("readable3", a_file_system.is_file_readable (a_name))
				a_file_system.delete_file (a_name)
				assert ("not_readable6", not a_file_system.is_file_readable (a_name))
			else
				assert ("is_opened", False)
			end
		end

	test_rename_file1
			-- Test feature `rename_file'.
			-- Old file exists and new file does not exist.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_file: KL_TEXT_OUTPUT_FILE
			old_name, new_name: STRING
		do
			create a_file_system.make
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
				-- Create old file.
			create a_file.make (old_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
					-- Old file exists and new file does not exist.
				assert ("readable1", a_file_system.is_file_readable (old_name))
				assert ("not_readable1", not a_file_system.is_file_readable (new_name))
					-- Rename file.
				a_file_system.rename_file (old_name, new_name)
					-- Old file does not exist anymore and new file
					-- holds the contents that used to be in old file.
				assert ("not_readable2", not a_file_system.is_file_readable (old_name))
				assert ("readable2", a_file_system.is_file_readable (new_name))
				assert_files_equal ("diff", hello_filename, new_name)
					-- Remove temporary files.
				a_file_system.delete_file (new_name)
				assert ("not_readable3", not a_file_system.is_file_readable (new_name))
			else
				assert ("is_opened", False)
			end
		end

	test_rename_file2
			-- Test feature `rename_file'.
			-- Old file and new file do not exist.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			old_name, new_name: STRING
		do
			create a_file_system.make
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
				-- Old file and new file do not exist.
			assert ("not_readable1", not a_file_system.is_file_readable (old_name))
			assert ("not_readable2", not a_file_system.is_file_readable (new_name))
				-- Try to rename file.
			a_file_system.rename_file (old_name, new_name)
				-- Old file and new file still do not exist.
			assert ("not_readable3", not a_file_system.is_file_readable (old_name))
			assert ("not_readable4", not a_file_system.is_file_readable (new_name))
		end

	test_rename_file3
			-- Test feature `rename_file'.
			-- Old file does not exist and new file exists.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			old_name, new_name: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			create a_file_system.make
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
				-- Create new file.
			create a_file.make (new_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
					-- Old file does not exist and new file exists.
				assert ("not_readable1", not a_file_system.is_file_readable (old_name))
				assert ("readable1", a_file_system.is_file_readable (new_name))
					-- Try to rename file.
				a_file_system.rename_file (old_name, new_name)
					-- Old file still does not exist and new file still exists.
				assert ("not_readable2", not a_file_system.is_file_readable (old_name))
				assert ("readable2", a_file_system.is_file_readable (new_name))
					-- The contents of new file has not been altered.
				assert_files_equal ("diff", hello_filename, new_name)
					-- Remove temporary files.
				a_file_system.delete_file (new_name)
				assert ("not_readable3", not a_file_system.is_file_readable (new_name))
			else
				assert ("is_opened", False)
			end
		end

	test_rename_file4
			-- Test feature `rename_file'.
			-- Old file and new file exist.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			old_name, new_name: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			create a_file_system.make
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
				-- Create new file.
			create a_file.make (new_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed1", a_file.is_closed)
					-- Create old file.
				create a_file.make (old_name)
				a_file.open_write
				if a_file.is_open_write then
					a_file.put_string ("This is the first line,")
					a_file.put_new_line
					a_file.put_string ("this is the second line.")
					a_file.put_new_line
					a_file.put_character ('#')
					a_file.close
					assert ("is_closed2", a_file.is_closed)
						-- Old file and new file exist.
					assert ("readable1", a_file_system.is_file_readable (old_name))
					assert ("readable2", a_file_system.is_file_readable (new_name))
						-- Try to rename file.
					a_file_system.rename_file (old_name, new_name)
						-- Old file does not exist anymore and new file
						-- now contains the old content of old file.
					assert ("not_readable1", not a_file_system.is_file_readable (old_name))
					assert ("readable3", a_file_system.is_file_readable (new_name))
					assert_files_equal ("diff1", gobo_filename, new_name)
						-- Remove temporary files.
					a_file_system.delete_file (new_name)
					assert ("not_readable2", not a_file_system.is_file_readable (new_name))
				else
					assert ("is_opened2", False)
				end
			else
				assert ("is_opened1", False)
			end
		end

	test_rename_file5
			-- Test feature `rename_file'.
			-- Old file exists and new file does not exist
			-- but has an empty name.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_file: KL_TEXT_OUTPUT_FILE
			old_name, new_name: STRING
		do
			create a_file_system.make
			old_name := new_filename ("gobo", ".tmp")
			new_name := ""
				-- Create old file.
			create a_file.make (old_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
					-- Old file exists and new file does not exist.
				assert ("readable1", a_file_system.is_file_readable (old_name))
				assert ("not_readable1", not a_file_system.is_file_readable (new_name))
					-- Try to rename file.
				a_file_system.rename_file (old_name, new_name)
					-- Old file still exists and new file still does not exist.
					-- We cannot rename when the new pathname is empty.
				assert ("readable2", a_file_system.is_file_readable (old_name))
				assert ("not_readable2", not a_file_system.is_file_readable (new_name))
					-- The contents of old file has not been altered.
				assert_files_equal ("diff", hello_filename, old_name)
					-- Remove temporary files.
				a_file_system.delete_file (old_name)
				assert ("not_readable3", not a_file_system.is_file_readable (old_name))
			else
				assert ("is_opened", False)
			end
		end

	test_rename_file6
			-- Test feature `rename_file'.
			-- Old file exists and new file does not exist
			-- but has a non-existing dirname in its pathname.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_file: KL_TEXT_OUTPUT_FILE
			old_name, new_name: STRING
		do
			create a_file_system.make
			old_name := new_filename ("gobo", ".tmp")
			new_name := file_system.pathname (new_dirname ("gobo"), new_filename ("gobo", ".tmp"))
				-- Create old file.
			create a_file.make (old_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
					-- Old file exists and new file does not exist.
				assert ("readable1", a_file_system.is_file_readable (old_name))
				assert ("not_readable1", not a_file_system.is_file_readable (new_name))
					-- Try to rename file.
				a_file_system.rename_file (old_name, new_name)
					-- Old file still exists and new file still does not exist.
					-- We cannot rename when the dirname of the new pathname
					-- does not exist.
				assert ("readable2", a_file_system.is_file_readable (old_name))
				assert ("not_readable2", not a_file_system.is_file_readable (new_name))
					-- The contents of old file has not been altered.
				assert_files_equal ("diff", hello_filename, old_name)
					-- Remove temporary files.
				a_file_system.delete_file (old_name)
				assert ("not_readable3", not a_file_system.is_file_readable (old_name))
			else
				assert ("is_opened", False)
			end
		end

	test_rename_file7
			-- Test feature `rename_file'.
			-- Old file exists and has the same pathname as new file.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_file: KL_TEXT_OUTPUT_FILE
			old_name, new_name: STRING
		do
			create a_file_system.make
			old_name := new_filename ("gobo", ".tmp")
			new_name := STRING_.cloned_string (old_name)
				-- Create old file.
			create a_file.make (old_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
					-- Old file and new file exist (they have the same pathname).
				assert ("readable1", a_file_system.is_file_readable (old_name))
				assert ("readable2", a_file_system.is_file_readable (new_name))
					-- Rename file.
				a_file_system.rename_file (old_name, new_name)
					-- Old file and new file still exist.
				assert ("readable3", a_file_system.is_file_readable (old_name))
				assert ("readable4", a_file_system.is_file_readable (new_name))
					-- The contents of old file has not been altered.
				assert_files_equal ("diff1", hello_filename, old_name)
				assert_files_equal ("diff2", hello_filename, new_name)
					-- Remove temporary files.
				a_file_system.delete_file (old_name)
				assert ("not_readable1", not a_file_system.is_file_readable (old_name))
				assert ("not_readable2", not a_file_system.is_file_readable (new_name))
			else
				assert ("is_opened", False)
			end
		end

	test_rename_file8
			-- Test feature `rename_file'.
			-- Old file exists and is the same file as new file
			-- although they don't have the same pathname.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_file: KL_TEXT_OUTPUT_FILE
			old_name, new_name: STRING
		do
			create a_file_system.make
			old_name := new_filename ("gobo", ".tmp")
			new_name := file_system.pathname (file_system.cwd, old_name)
				-- Create old file.
			create a_file.make (old_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
					-- Old file and new file exist (they are the same file).
				assert ("readable1", a_file_system.is_file_readable (old_name))
				assert ("readable2", a_file_system.is_file_readable (new_name))
					-- Rename file.
				a_file_system.rename_file (old_name, new_name)
					-- Old file and new file still exist.
				assert ("readable3", a_file_system.is_file_readable (old_name))
				assert ("readable4", a_file_system.is_file_readable (new_name))
					-- The contents of old file has not been altered.
				assert_files_equal ("diff1", hello_filename, old_name)
				assert_files_equal ("diff2", hello_filename, new_name)
					-- Remove temporary files.
				a_file_system.delete_file (old_name)
				assert ("not_readable1", not a_file_system.is_file_readable (old_name))
				assert ("not_readable2", not a_file_system.is_file_readable (new_name))
			else
				assert ("is_opened", False)
			end
		end

	test_rename_file9
			-- Test feature `rename_file'.
			-- Old file does not exist and has an empty name,
			-- and new file exists.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			old_name, new_name: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			create a_file_system.make
			old_name := ""
			new_name := new_filename ("gobo", ".tmp")
				-- Create new file.
			create a_file.make (new_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
					-- Old file does not exist and new file exists.
				assert ("not_readable1", not a_file_system.is_file_readable (old_name))
				assert ("readable1", a_file_system.is_file_readable (new_name))
					-- Try to rename file.
				a_file_system.rename_file (old_name, new_name)
					-- Old file still does not exist and new file still exists.
				assert ("not_readable2", not a_file_system.is_file_readable (old_name))
				assert ("readable2", a_file_system.is_file_readable (new_name))
					-- The contents of new file has not been altered.
				assert_files_equal ("diff", hello_filename, new_name)
					-- Remove temporary files.
				a_file_system.delete_file (new_name)
				assert ("not_readable3", not a_file_system.is_file_readable (new_name))
			else
				assert ("is_opened", False)
			end
		end

	test_copy_file1
			-- Test feature `copy_file'.
			-- Old file exists and new file does not exist.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_file: KL_TEXT_OUTPUT_FILE
			old_name, new_name: STRING
		do
			create a_file_system.make
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
				-- Create old file.
			create a_file.make (old_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
					-- Old file exists and new file does not exist.
				assert ("readable1", a_file_system.is_file_readable (old_name))
				assert ("not_readable1", not a_file_system.is_file_readable (new_name))
					-- Copy file.
				a_file_system.copy_file (old_name, new_name)
					-- Old file still exists anymore and new file
					-- has the same contents as old file.
				assert ("readable2", a_file_system.is_file_readable (old_name))
				assert ("readable3", a_file_system.is_file_readable (new_name))
				assert_files_equal ("diff1", hello_filename, old_name)
				assert_files_equal ("diff2", hello_filename, new_name)
					-- Remove temporary files.
				a_file_system.delete_file (old_name)
				assert ("not_readable2", not a_file_system.is_file_readable (old_name))
				a_file_system.delete_file (new_name)
				assert ("not_readable3", not a_file_system.is_file_readable (new_name))
			else
				assert ("is_opened", False)
			end
		end

	test_copy_file2
			-- Test feature `copy_file'.
			-- Old file and new file do not exist.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			old_name, new_name: STRING
		do
			create a_file_system.make
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
				-- Old file and new file do not exist.
			assert ("not_readable1", not a_file_system.is_file_readable (old_name))
			assert ("not_readable2", not a_file_system.is_file_readable (new_name))
				-- Try to copy file.
			a_file_system.copy_file (old_name, new_name)
				-- Old file and new file still do not exist.
			assert ("not_readable3", not a_file_system.is_file_readable (old_name))
			assert ("not_readable4", not a_file_system.is_file_readable (new_name))
		end

	test_copy_file3
			-- Test feature `copy_file'.
			-- Old file does not exist and new file exists.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			old_name, new_name: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			create a_file_system.make
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
				-- Create new file.
			create a_file.make (new_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
					-- Old file does not exist and new file exists.
				assert ("not_readable1", not a_file_system.is_file_readable (old_name))
				assert ("readable1", a_file_system.is_file_readable (new_name))
					-- Try to copy file.
				a_file_system.copy_file (old_name, new_name)
					-- Old file still does not exist and new file still exists.
				assert ("not_readable2", not a_file_system.is_file_readable (old_name))
				assert ("readable2", a_file_system.is_file_readable (new_name))
					-- The contents of new file has not been altered.
				assert_files_equal ("diff", hello_filename, new_name)
					-- Remove temporary files.
				a_file_system.delete_file (new_name)
				assert ("not_readable3", not a_file_system.is_file_readable (new_name))
			else
				assert ("is_opened", False)
			end
		end

	test_copy_file4
			-- Test feature `copy_file'.
			-- Old file and new file exist.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			old_name, new_name: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			create a_file_system.make
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
				-- Create new file.
			create a_file.make (new_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed1", a_file.is_closed)
					-- Create old file.
				create a_file.make (old_name)
				a_file.open_write
				if a_file.is_open_write then
					a_file.put_string ("This is the first line,")
					a_file.put_new_line
					a_file.put_string ("this is the second line.")
					a_file.put_new_line
					a_file.put_character ('#')
					a_file.close
					assert ("is_closed2", a_file.is_closed)
						-- Old file and new file exist.
					assert ("readable1", a_file_system.is_file_readable (old_name))
					assert ("readable2", a_file_system.is_file_readable (new_name))
						-- Copy file.
					a_file_system.copy_file (old_name, new_name)
						-- Old file still exists and has the same contents as before.
						-- New file still exists but has the same contents as old file.
					assert ("readable3", a_file_system.is_file_readable (old_name))
					assert ("readable4", a_file_system.is_file_readable (new_name))
					assert_files_equal ("diff1", gobo_filename, old_name)
					assert_files_equal ("diff2", old_name, new_name)
						-- Remove temporary files.
					a_file_system.delete_file (old_name)
					assert ("not_readable1", not a_file_system.is_file_readable (old_name))
					a_file_system.delete_file (new_name)
					assert ("not_readable2", not a_file_system.is_file_readable (new_name))
				else
					assert ("is_opened2", False)
				end
			else
				assert ("is_opened1", False)
			end
		end

	test_copy_file5
			-- Test feature `copy_file'.
			-- Old file exists and new file does not exist
			-- but has an empty name.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_file: KL_TEXT_OUTPUT_FILE
			old_name, new_name: STRING
		do
			create a_file_system.make
			old_name := new_filename ("gobo", ".tmp")
			new_name := ""
				-- Create old file.
			create a_file.make (old_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
					-- Old file exists and new file does not exist.
				assert ("readable1", a_file_system.is_file_readable (old_name))
				assert ("not_readable1", not a_file_system.is_file_readable (new_name))
					-- Try to copy file.
				a_file_system.copy_file (old_name, new_name)
					-- Old file still exists and new file still does not exist.
					-- We cannot rename when the new pathname is empty.
				assert ("readable2", a_file_system.is_file_readable (old_name))
				assert ("not_readable2", not a_file_system.is_file_readable (new_name))
					-- The contents of old file has not been altered.
				assert_files_equal ("diff", hello_filename, old_name)
					-- Remove temporary files.
				a_file_system.delete_file (old_name)
				assert ("not_readable3", not a_file_system.is_file_readable (old_name))
			else
				assert ("is_opened", False)
			end
		end

	test_copy_file6
			-- Test feature `copy_file'.
			-- Old file exists and new file does not exist
			-- but has a non-existing dirname in its pathname.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_file: KL_TEXT_OUTPUT_FILE
			old_name, new_name: STRING
		do
			create a_file_system.make
			old_name := new_filename ("gobo", ".tmp")
			new_name := file_system.pathname (new_dirname ("gobo"), new_filename ("gobo", ".tmp"))
				-- Create old file.
			create a_file.make (old_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
					-- Old file exists and new file does not exist.
				assert ("readable1", a_file_system.is_file_readable (old_name))
				assert ("not_readable1", not a_file_system.is_file_readable (new_name))
					-- Try to copy file.
				a_file_system.copy_file (old_name, new_name)
					-- Old file still exists and new file still does not exist.
					-- We cannot rename when the dirname of the new pathname
					-- does not exist.
				assert ("readable2", a_file_system.is_file_readable (old_name))
				assert ("not_readable2", not a_file_system.is_file_readable (new_name))
					-- The contents of old file has not been altered.
				assert_files_equal ("diff", hello_filename, old_name)
					-- Remove temporary files.
				a_file_system.delete_file (old_name)
				assert ("not_readable3", not a_file_system.is_file_readable (old_name))
			else
				assert ("is_opened", False)
			end
		end

	test_copy_file7
			-- Test feature `copy_file'.
			-- Old file exists and has the same pathname as new file.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_file: KL_TEXT_OUTPUT_FILE
			old_name, new_name: STRING
		do
			create a_file_system.make
			old_name := new_filename ("gobo", ".tmp")
			new_name := STRING_.cloned_string (old_name)
				-- Create old file.
			create a_file.make (old_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
					-- Old file and new file exist (they have the same pathname).
				assert ("readable1", a_file_system.is_file_readable (old_name))
				assert ("readable2", a_file_system.is_file_readable (new_name))
					-- Copy file.
				a_file_system.copy_file (old_name, new_name)
					-- Old file and new file still exist.
				assert ("readable3", a_file_system.is_file_readable (old_name))
				assert ("readable4", a_file_system.is_file_readable (new_name))
					-- The contents of old file has not been altered.
				assert_files_equal ("diff1", hello_filename, old_name)
				assert_files_equal ("diff2", hello_filename, new_name)
					-- Remove temporary files.
				a_file_system.delete_file (old_name)
				assert ("not_readable1", not a_file_system.is_file_readable (old_name))
				assert ("not_readable2", not a_file_system.is_file_readable (new_name))
			else
				assert ("is_opened", False)
			end
		end

	test_copy_file8
			-- Test feature `copy_file'.
			-- Old file exists and is the same file as new file
			-- although they don't have the same pathname.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_file: KL_TEXT_OUTPUT_FILE
			old_name, new_name: STRING
		do
			create a_file_system.make
			old_name := new_filename ("gobo", ".tmp")
			new_name := file_system.pathname (file_system.cwd, old_name)
				-- Create old file.
			create a_file.make (old_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
					-- Old file and new file exist (they are the same file).
				assert ("readable1", a_file_system.is_file_readable (old_name))
				assert ("readable2", a_file_system.is_file_readable (new_name))
					-- Copy file.
				a_file_system.copy_file (old_name, new_name)
					-- Old file and new file still exist.
				assert ("readable3", a_file_system.is_file_readable (old_name))
				assert ("readable4", a_file_system.is_file_readable (new_name))
					-- The contents of old file has not been altered.
				assert_files_equal ("diff1", hello_filename, old_name)
				assert_files_equal ("diff2", hello_filename, new_name)
					-- Remove temporary files.
				a_file_system.delete_file (old_name)
				assert ("not_readable1", not a_file_system.is_file_readable (old_name))
				assert ("not_readable2", not a_file_system.is_file_readable (new_name))
			else
				assert ("is_opened", False)
			end
		end

	test_copy_file9
			-- Test feature `copy_file'.
			-- Old file does not exist and has an empty name,
			-- and new file exists.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			old_name, new_name: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			create a_file_system.make
			old_name := ""
			new_name := new_filename ("gobo", ".tmp")
				-- Create new file.
			create a_file.make (new_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
					-- Old file does not exist and new file exists.
				assert ("not_readable1", not a_file_system.is_file_readable (old_name))
				assert ("readable1", a_file_system.is_file_readable (new_name))
					-- Try to copy file.
				a_file_system.copy_file (old_name, new_name)
					-- Old file still does not exist and new file still exists.
				assert ("not_readable2", not a_file_system.is_file_readable (old_name))
				assert ("readable2", a_file_system.is_file_readable (new_name))
					-- The contents of new file has not been altered.
				assert_files_equal ("diff", hello_filename, new_name)
					-- Remove temporary files.
				a_file_system.delete_file (new_name)
				assert ("not_readable3", not a_file_system.is_file_readable (new_name))
			else
				assert ("is_opened", False)
			end
		end

	test_delete_file
			-- Test feature `delete_file'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_file: KL_TEXT_OUTPUT_FILE
			a_name: STRING
		do
			create a_file_system.make
				-- Create a new file and then delete it.
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert ("readable", a_file_system.is_file_readable (a_name))
				assert_files_equal ("diff", hello_filename, a_name)
				a_file_system.delete_file (a_name)
				assert ("not_readable", not a_file_system.is_file_readable (a_name))
			else
				assert ("is_opened", False)
			end
				-- Try to delete a non-existing file.
			a_name := new_filename ("gobo", ".tmp")
			assert ("not_readable1", not a_file_system.is_file_readable (a_name))
			a_file_system.delete_file (a_name)
			assert ("not_readable2", not a_file_system.is_file_readable (a_name))
				-- Try to delete a file with an empty pathname.
			a_name := ""
			assert ("not_readable1", not a_file_system.is_file_readable (a_name))
			a_file_system.delete_file (a_name)
			assert ("not_readable2", not a_file_system.is_file_readable (a_name))
		end

	test_new_input_file
			-- Test feature `new_input_file'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_name: STRING
			a_file: KI_TEXT_INPUT_FILE
		do
			create a_file_system.make
			a_name := new_filename ("gobo", ".tmp")
			a_file := a_file_system.new_input_file (a_name)
			assert ("not_void", a_file /= Void)
			assert_equal ("name", a_name, a_file.name)
			assert ("is_closed", a_file.is_closed)
			assert ("is_windows", attached {KL_WINDOWS_INPUT_FILE} a_file)
		end

	test_new_output_file
			-- Test feature `new_output_file'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_name: STRING
			a_file: KI_TEXT_OUTPUT_FILE
		do
			create a_file_system.make
			a_name := new_filename ("gobo", ".tmp")
			a_file := a_file_system.new_output_file (a_name)
			assert ("not_void", a_file /= Void)
			assert_equal ("name", a_name, a_file.name)
			assert ("is_closed", a_file.is_closed)
			assert ("is_windows", attached {KL_WINDOWS_OUTPUT_FILE} a_file)
		end

	test_eol
			-- Test feature `eol'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			assert_equal ("eol", "%R%N", a_file_system.eol)
		end

feature -- Directory handling

	test_is_directory_readable
			-- Test feature `is_directory_readable'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_name: STRING
		do
			create a_file_system.make
				-- The following directory, whose pathname has a non-empty
				-- dirname, is readable.
			a_name := data_dirname
			a_name := Execution_environment.interpreted_string (a_name)
			assert ("readable1", a_file_system.is_directory_readable (a_name))
				-- The current directory is readable.
			a_name := file_system.relative_current_directory
			assert ("readable2", a_file_system.is_directory_readable (a_name))
				-- The following directory, whose pathname has a non-empty
				-- dirname, is not readable.
			a_name := file_system.nested_pathname ("$GOBO", <<"test", "kernel", "dataoops">>)
			a_name := Execution_environment.interpreted_string (a_name)
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
				-- The following directory, whose pathname has a non-empty
				-- dirname and a basename containing a space, is not readable.
			a_name := file_system.nested_pathname ("$GOBO", <<"test", "kernel", "data oops">>)
			a_name := Execution_environment.interpreted_string (a_name)
			assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
				-- A directory with an empty name is not readable.
			assert ("not_readable3", not a_file_system.is_directory_readable (""))
				-- The following pathname exists, but it is a
				-- file and hence is not a readable directory.
			a_name := gobo_filename
			a_name := Execution_environment.interpreted_string (a_name)
			assert ("file_readable", a_file_system.is_file_readable (a_name))
			assert ("not_readable4", not a_file_system.is_directory_readable (a_name))
				-- Create an empty directory in the current directory and then
				-- check that this directory, whose pathname has an empty
				-- dirname, is readable. Then delete this newly created
				-- directory and check than it is not readable anymore.
			a_name := new_dirname ("gobo")
			assert ("not_readable5", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_name)
			assert ("readable3", a_file_system.is_directory_readable (a_name))
			a_file_system.delete_directory (a_name)
			assert ("not_readable6", not a_file_system.is_directory_readable (a_name))
		end

	test_create_directory1
			-- Test feature `create_directory'.
			-- Create non-existing directory.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_name: STRING
		do
			create a_file_system.make
				-- Create a new directory, whose pathname has
				-- an empty dirname, and the delete it.
			a_name := new_dirname ("gobo")
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_name)
			assert ("readable1", a_file_system.is_directory_readable (a_name))
			a_file_system.delete_directory (a_name)
			assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
		end

	test_create_directory2
			-- Test feature `create_directory'.
			-- Create existing directory.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_name, a_filename: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			create a_file_system.make
				-- Create a new directory and create a file in it.
			a_name := new_dirname ("gobo")
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_name)
			assert ("readable1", a_file_system.is_directory_readable (a_name))
			a_filename := file_system.pathname (a_name, new_filename ("gobo", ".tmp"))
			create a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert ("readable2", a_file_system.is_file_readable (a_filename))
				assert_files_equal ("diff1", hello_filename, a_filename)
					-- Try to create a directory which already exists.
				a_file_system.create_directory (a_name)
					-- Creation failed and the old directory is
					-- still there which is contents not altered.
				assert ("still_there", a_file_system.is_directory_readable (a_name))
				assert ("readable3", a_file_system.is_file_readable (a_filename))
				assert_files_equal ("diff2", hello_filename, a_filename)
					-- Remove temporary files and directories.
				a_file_system.delete_file (a_filename)
				assert ("not_readable2", not a_file_system.is_file_readable (a_filename))
				a_file_system.delete_directory (a_name)
				assert ("not_readable3", not a_file_system.is_directory_readable (a_name))
			else
				assert ("is_opened", False)
			end
		end

	test_create_directory3
			-- Test feature `create_directory'.
			-- Create nested directory.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_name, a_parent: STRING
		do
			create a_file_system.make
			a_parent := new_dirname ("gobo")
			a_name := file_system.pathname (a_parent, new_dirname ("gobo"))
			assert ("not_readable1", not a_file_system.is_directory_readable (a_parent))
			assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
				-- Try to create a directory whose pathname has
				-- a non-existing dirname.
			a_file_system.create_directory (a_name)
				-- Creation failed.
			assert ("not_readable3", not a_file_system.is_directory_readable (a_parent))
			assert ("not_readable4", not a_file_system.is_directory_readable (a_name))
				-- Create first the dirname directory
				-- and then the child directory (still
				-- with the same pathname as before).
			a_file_system.create_directory (a_parent)
			assert ("readable1", a_file_system.is_directory_readable (a_parent))
			assert ("not_readable5", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_name)
				-- This time the creation succeeded.
			assert ("readable2", a_file_system.is_directory_readable (a_parent))
			assert ("readable3", a_file_system.is_directory_readable (a_name))
				-- Remove temporary directories.
			a_file_system.delete_directory (a_name)
			assert ("readable4", a_file_system.is_directory_readable (a_parent))
			assert ("not_readable6", not a_file_system.is_directory_readable (a_name))
			a_file_system.delete_directory (a_parent)
			assert ("not_readable7", not a_file_system.is_directory_readable (a_parent))
			assert ("not_readable8", not a_file_system.is_directory_readable (a_name))
		end

	test_create_directory4
			-- Test feature `create_directory'.
			-- Create non-existing directory with an empty pathname.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_name: STRING
		do
			create a_file_system.make
				-- Try to create a new directory with an empty pathname.
			a_name := ""
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_name)
				-- Creation failed.
			assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
		end

	test_delete_directory1
			-- Test feature `delete_directory'.
			-- Empty directory.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_name: STRING
		do
			create a_file_system.make
				-- Create an empty directory and then delete it.
			a_name := new_dirname ("gobo")
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_name)
			assert ("readable1", a_file_system.is_directory_readable (a_name))
			a_file_system.delete_directory (a_name)
			assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
		end

	test_delete_directory2
			-- Test feature `delete_directory'.
			-- Non-existing directory.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_name: STRING
		do
			create a_file_system.make
				-- Try to delete a non-existing directory.
			a_name := new_dirname ("gobo")
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
			a_file_system.delete_directory (a_name)
			assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
		end

	test_delete_directory3
			-- Test feature `delete_directory'.
			-- Non-empty directory.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_name, a_filename: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			create a_file_system.make
				-- Create a new directory and create a file in it.
			a_name := new_dirname ("gobo")
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_name)
			assert ("readable1", a_file_system.is_directory_readable (a_name))
			a_filename := file_system.pathname (a_name, new_filename ("gobo", ".tmp"))
			create a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert ("readable2", a_file_system.is_file_readable (a_filename))
				assert_files_equal ("diff1", hello_filename, a_filename)
					-- Try to delete the non-empty directory.
				a_file_system.delete_directory (a_name)
					-- Deletion failed and the directory and its
					-- contents are not altered.
				assert ("cannot_delete", a_file_system.is_directory_readable (a_name))
				assert ("readable3", a_file_system.is_file_readable (a_filename))
				assert_files_equal ("diff2", hello_filename, a_filename)
					-- Remove temporary files and directories.
				a_file_system.delete_file (a_filename)
				assert ("not_readable2", not a_file_system.is_file_readable (a_filename))
				a_file_system.delete_directory (a_name)
				assert ("not_readable3", not a_file_system.is_directory_readable (a_name))
			else
				assert ("is_opened", False)
			end
		end

	test_delete_directory4
			-- Test feature `delete_directory'.
			-- Nested directory.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_name, a_parent: STRING
		do
			create a_file_system.make
				-- Create a new directory and a subdirectory.
			a_parent := new_dirname ("gobo")
			a_name := file_system.pathname (a_parent, new_dirname ("gobo"))
			assert ("not_readable1", not a_file_system.is_directory_readable (a_parent))
			assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_parent)
			assert ("readable1", a_file_system.is_directory_readable (a_parent))
			assert ("not_readable3", not a_file_system.is_directory_readable (a_name))
			a_file_system.create_directory (a_name)
			assert ("readable2", a_file_system.is_directory_readable (a_parent))
			assert ("readable3", a_file_system.is_directory_readable (a_name))
				-- Delete the subdirectory.
			a_file_system.delete_directory (a_name)
			assert ("readable4", a_file_system.is_directory_readable (a_parent))
			assert ("not_readable4", not a_file_system.is_directory_readable (a_name))
				-- The delete the directory.
			a_file_system.delete_directory (a_parent)
			assert ("not_readable5", not a_file_system.is_directory_readable (a_parent))
			assert ("not_readable6", not a_file_system.is_directory_readable (a_name))
		end

	test_delete_directory5
			-- Test feature `delete_directory'.
			-- Non-existing directory with empty pathname.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_name: STRING
		do
			create a_file_system.make
				-- Try to delete a non-existing directory with an empty pathname.
			a_name := ""
			assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
			a_file_system.delete_directory (a_name)
			assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
		end

feature -- Working directory

	test_current_working_directory
			-- Test feature `current_working_directory'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_name: STRING
			cwd: STRING
		do
			create a_file_system.make
			if a_file_system.is_current_file_system then
					-- The current working directory is a readable directory.
				cwd := a_file_system.current_working_directory
				assert ("readable0", a_file_system.is_directory_readable (cwd))
					-- Change directory to '$GOBO/test/kernel'.
				a_name := kernel_dirname
				a_name := Execution_environment.interpreted_string (a_name)
				assert ("readable1", a_file_system.is_directory_readable (a_name))
				a_file_system.set_current_working_directory (a_name)
				assert ("readable2", a_file_system.is_directory_readable (a_name))
				assert ("readable3", a_file_system.is_directory_readable (a_file_system.current_working_directory))
				assert ("cwd1", a_file_system.same_pathnames (a_name, a_file_system.current_working_directory))
					-- Change directory to '$GOBO/test/kernel/data'.
				a_name := "data"
				a_file_system.set_current_working_directory (a_name)
					-- There is no directory 'data' in '$GOBO/test/kernel/data'.
				assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
				assert ("readable4", a_file_system.is_directory_readable (a_file_system.current_working_directory))
				a_name := data_dirname
				a_name := Execution_environment.interpreted_string (a_name)
				assert ("readable5", a_file_system.is_directory_readable (a_name))
				assert ("cwd2", a_file_system.same_pathnames (a_name, a_file_system.current_working_directory))
				assert ("readable6", a_file_system.is_directory_readable (cwd))
					-- Go back to old working directory.
				a_file_system.set_current_working_directory (cwd)
				assert ("cwd3", a_file_system.same_pathnames (cwd, a_file_system.current_working_directory))
			end
		end

	test_cwd
			-- Test feature `cwd'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_name: STRING
			cwd: STRING
		do
			create a_file_system.make
			if a_file_system.is_current_file_system then
					-- The current working directory is a readable directory.
				cwd := a_file_system.cwd
				assert ("readable0", a_file_system.is_directory_readable (cwd))
					-- Change directory to '$GOBO/test/kernel'.
				a_name := kernel_dirname
				a_name := Execution_environment.interpreted_string (a_name)
				assert ("readable1", a_file_system.is_directory_readable (a_name))
				a_file_system.cd (a_name)
				assert ("readable2", a_file_system.is_directory_readable (a_name))
				assert ("readable3", a_file_system.is_directory_readable (a_file_system.cwd))
				assert ("cwd1", a_file_system.same_pathnames (a_name, a_file_system.cwd))
					-- Change directory to 'data' ('$GOBO/test/kernel/data').
				a_name := "data"
				a_file_system.cd (a_name)
					-- There is no directory 'data' in '$GOBO/test/kernel/data'.
				assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
				assert ("readable4", a_file_system.is_directory_readable (a_file_system.cwd))
				a_name := data_dirname
				a_name := Execution_environment.interpreted_string (a_name)
				assert ("readable5", a_file_system.is_directory_readable (a_name))
				assert ("cwd2", a_file_system.same_pathnames (a_name, a_file_system.cwd))
				assert ("readable6", a_file_system.is_directory_readable (cwd))
					-- Go back to old working directory.
				a_file_system.cd (cwd)
				assert ("cwd3", a_file_system.same_pathnames (cwd, a_file_system.cwd))
			end
		end

	test_set_current_working_directory1
			-- Test feature `set_current_working_directory'.
			-- Existing directory.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			cwd: STRING
			a_name: STRING
		do
			create a_file_system.make
			if a_file_system.is_current_file_system then
				cwd := a_file_system.current_working_directory
				assert ("readable0", a_file_system.is_directory_readable (cwd))
					-- Change directory to '$GOBO/test/kernel'.
				a_name := kernel_dirname
				a_name := Execution_environment.interpreted_string (a_name)
				assert ("readable1", a_file_system.is_directory_readable (a_name))
				a_file_system.set_current_working_directory (a_name)
				assert ("readable2", a_file_system.is_directory_readable (a_name))
				assert ("readable3", a_file_system.is_directory_readable (a_file_system.current_working_directory))
				assert ("cwd1", a_file_system.same_pathnames (a_name, a_file_system.current_working_directory))
					-- Change directory to 'data' ('$GOBO/test/kernel/data').
				a_name := "data"
				assert ("readable4", a_file_system.is_directory_readable (a_name))
				a_file_system.set_current_working_directory (a_name)
					-- There is no directory 'data' in '$GOBO/test/kernel/data'.
				assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
				assert ("readable5", a_file_system.is_directory_readable (a_file_system.current_working_directory))
				a_name := data_dirname
				a_name := Execution_environment.interpreted_string (a_name)
				assert ("cwd2", a_file_system.same_pathnames (a_name, a_file_system.current_working_directory))
					-- Change directory to current directory '.' ('$GOBO/test/kernel/data').
				a_name := file_system.relative_current_directory
				assert ("readable6", a_file_system.is_directory_readable (a_name))
				a_file_system.set_current_working_directory (a_name)
				assert ("readable7", a_file_system.is_directory_readable (a_file_system.current_working_directory))
				a_name := data_dirname
				a_name := Execution_environment.interpreted_string (a_name)
				assert ("cwd3", a_file_system.same_pathnames (a_name, a_file_system.current_working_directory))
					-- Change directory to parent directory '..' ('$GOBO/test/kernel').
				a_name := file_system.relative_parent_directory
				assert ("readable8", a_file_system.is_directory_readable (a_name))
				a_file_system.set_current_working_directory (a_name)
				assert ("readable9", a_file_system.is_directory_readable (a_file_system.current_working_directory))
				a_name := kernel_dirname
				a_name := Execution_environment.interpreted_string (a_name)
				assert ("cwd4", a_file_system.same_pathnames (a_name, a_file_system.current_working_directory))
					-- Change directory to 'data' ('$GOBO/test/kernel/data').
				a_name := "data"
				assert ("readable10", a_file_system.is_directory_readable (a_name))
				a_file_system.set_current_working_directory (a_name)
				assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
				assert ("readable11", a_file_system.is_directory_readable (a_file_system.current_working_directory))
				a_name := data_dirname
				a_name := Execution_environment.interpreted_string (a_name)
				assert ("cwd2", a_file_system.same_pathnames (a_name, a_file_system.current_working_directory))
					-- Go back to old working directory.
				assert ("readable10", a_file_system.is_directory_readable (cwd))
				a_file_system.set_current_working_directory (cwd)
				assert ("cwd5", a_file_system.same_pathnames (cwd, a_file_system.current_working_directory))
			end
		end

	test_cd1
			-- Test feature `cd'.
			-- Existing directory.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			cwd: STRING
			a_name: STRING
		do
			create a_file_system.make
			if a_file_system.is_current_file_system then
				cwd := a_file_system.cwd
				assert ("readable0", a_file_system.is_directory_readable (cwd))
					-- Change directory to '$GOBO/test/kernel'.
				a_name := kernel_dirname
				a_name := Execution_environment.interpreted_string (a_name)
				assert ("readable1", a_file_system.is_directory_readable (a_name))
				a_file_system.cd (a_name)
				assert ("readable2", a_file_system.is_directory_readable (a_name))
				assert ("readable3", a_file_system.is_directory_readable (a_file_system.cwd))
				assert ("cwd1", a_file_system.same_pathnames (a_name, a_file_system.cwd))
					-- Change directory to 'data' ('$GOBO/test/kernel/data').
				a_name := "data"
				assert ("readable4", a_file_system.is_directory_readable (a_name))
				a_file_system.cd (a_name)
					-- There is no directory 'data' in '$GOBO/test/kernel/data'.
				assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
				assert ("readable5", a_file_system.is_directory_readable (a_file_system.cwd))
				a_name := data_dirname
				a_name := Execution_environment.interpreted_string (a_name)
				assert ("cwd2", a_file_system.same_pathnames (a_name, a_file_system.cwd))
					-- Change directory to current directory '.' ('$GOBO/test/kernel/data').
				a_name := file_system.relative_current_directory
				assert ("readable6", a_file_system.is_directory_readable (a_name))
				a_file_system.cd (a_name)
				assert ("readable7", a_file_system.is_directory_readable (a_file_system.cwd))
				a_name := data_dirname
				a_name := Execution_environment.interpreted_string (a_name)
				assert ("cwd3", a_file_system.same_pathnames (a_name, a_file_system.cwd))
					-- Change directory to parent directory '..' ('$GOBO/test/kernel').
				a_name := file_system.relative_parent_directory
				assert ("readable8", a_file_system.is_directory_readable (a_name))
				a_file_system.cd (a_name)
				assert ("readable9", a_file_system.is_directory_readable (a_file_system.cwd))
				a_name := kernel_dirname
				a_name := Execution_environment.interpreted_string (a_name)
				assert ("cwd4", a_file_system.same_pathnames (a_name, a_file_system.cwd))
					-- Change directory to 'data' ('$GOBO/test/kernel/data').
				a_name := "data"
				assert ("readable10", a_file_system.is_directory_readable (a_name))
				a_file_system.cd (a_name)
				assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
				assert ("readable11", a_file_system.is_directory_readable (a_file_system.cwd))
				a_name := data_dirname
				a_name := Execution_environment.interpreted_string (a_name)
				assert ("cwd2", a_file_system.same_pathnames (a_name, a_file_system.cwd))
					-- Go back to old working directory.
				assert ("readable10", a_file_system.is_directory_readable (cwd))
				a_file_system.cd (cwd)
				assert ("cwd5", a_file_system.same_pathnames (cwd, a_file_system.cwd))
			end
		end

	test_set_current_working_directory2
			-- Test feature `set_current_working_directory'.
			-- Non-existing directory.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			cwd: STRING
			a_name: STRING
		do
			create a_file_system.make
			if a_file_system.is_current_file_system then
				cwd := a_file_system.current_working_directory
				assert ("readable1", a_file_system.is_directory_readable (cwd))
					-- Try to change to non-existing directory.
				a_name := new_dirname ("gobo")
				assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
				a_file_system.set_current_working_directory (a_name)
					-- Change of directory failed.
				assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
				assert ("readable1", a_file_system.is_directory_readable (a_file_system.current_working_directory))
				assert ("not_changed1", a_file_system.same_pathnames (cwd, a_file_system.current_working_directory))
					-- Try to change to non-existing directory with empty pathname.
				a_name := ""
				assert ("not_readable3", not a_file_system.is_directory_readable (a_name))
				a_file_system.set_current_working_directory (a_name)
					-- Change of directory failed.
				assert ("not_readable4", not a_file_system.is_directory_readable (a_name))
				assert ("readable2", a_file_system.is_directory_readable (a_file_system.current_working_directory))
				assert ("not_changed2", a_file_system.same_pathnames (cwd, a_file_system.current_working_directory))
			end
		end

	test_cd2
			-- Test feature `cd'.
			-- Non-existing directory.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			cwd: STRING
			a_name: STRING
		do
			create a_file_system.make
			if a_file_system.is_current_file_system then
				cwd := a_file_system.cwd
				assert ("readable1", a_file_system.is_directory_readable (cwd))
					-- Try to change to non-existing directory.
				a_name := new_dirname ("gobo")
				assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
				a_file_system.cd (a_name)
					-- Change of directory failed.
				assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
				assert ("readable1", a_file_system.is_directory_readable (a_file_system.cwd))
				assert ("not_changed1", a_file_system.same_pathnames (cwd, a_file_system.cwd))
					-- Try to change to non-existing directory with empty pathname.
				a_name := ""
				assert ("not_readable3", not a_file_system.is_directory_readable (a_name))
				a_file_system.cd (a_name)
					-- Change of directory failed.
				assert ("not_readable4", not a_file_system.is_directory_readable (a_name))
				assert ("readable2", a_file_system.is_directory_readable (a_file_system.cwd))
				assert ("not_changed2", a_file_system.same_pathnames (cwd, a_file_system.cwd))
			end
		end

feature -- Pathname handling

	test_is_absolute_pathname
			-- Test feature `is_absolute_pathname'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			assert ("absolute1", a_file_system.is_absolute_pathname ("c:\gobo"))
			assert ("absolute2", a_file_system.is_absolute_pathname ("d:\"))
			assert ("absolute3", a_file_system.is_absolute_pathname ("\\foo\bar"))
			assert ("absolute4", a_file_system.is_absolute_pathname ("c:/foo"))
			assert ("not_absolute1", not a_file_system.is_absolute_pathname ("foo"))
			assert ("not_absolute2", not a_file_system.is_absolute_pathname ("foo\bar"))
			assert ("not_absolute3", not a_file_system.is_absolute_pathname ("\foo"))
			assert ("not_absolute4", not a_file_system.is_absolute_pathname ("/foo"))
			assert ("not_absolute6", not a_file_system.is_absolute_pathname (""))
			assert ("not_absolute7", not a_file_system.is_absolute_pathname ("\"))
			create a_file_system.make_backslash_only
			assert ("not_absolute5", not a_file_system.is_absolute_pathname ("c:/foo"))
		end

	test_is_relative_pathname
			-- Test feature `is_relative_pathname'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			assert ("relative1", a_file_system.is_relative_pathname ("foo"))
			assert ("relative2", a_file_system.is_relative_pathname ("foo\bar"))
			assert ("relative3", a_file_system.is_relative_pathname (".\foo"))
			assert ("relative4", a_file_system.is_relative_pathname ("..\foo"))
			assert ("relative7", a_file_system.is_relative_pathname (""))
			assert ("not_relative1", not a_file_system.is_relative_pathname ("\foo"))
			assert ("not_relative2", not a_file_system.is_relative_pathname ("\"))
			assert ("not_relative3", not a_file_system.is_relative_pathname ("c:\foo"))
			assert ("not_relative4", not a_file_system.is_relative_pathname ("\\foo\bar"))
			assert ("not_relative5", not a_file_system.is_relative_pathname ("/foo"))
			assert ("not_relative6", not a_file_system.is_relative_pathname ("c:/foo"))
			create a_file_system.make_backslash_only
			assert ("relative5", a_file_system.is_relative_pathname ("/foo"))
			assert ("relative6", a_file_system.is_relative_pathname ("c:/foo"))
		end

	test_is_root_directory
			-- Test feature `is_root_directory'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			assert ("root1", a_file_system.is_root_directory ("\"))
			assert ("root2", a_file_system.is_root_directory ("c:\"))
			assert ("root3", a_file_system.is_root_directory ("\\foo\bar"))
			assert ("root4", a_file_system.is_root_directory ("\\foo\bar\"))
			assert ("root5", a_file_system.is_root_directory ("\\foo\bar\\"))
			assert ("root6", a_file_system.is_root_directory ("c:/"))
			assert ("root7", a_file_system.is_root_directory ("/"))
			assert ("not_root1", not a_file_system.is_root_directory ("foo"))
			assert ("not_root2", not a_file_system.is_root_directory ("\foo"))
			assert ("not_root4", not a_file_system.is_root_directory ("c:\foo"))
			assert ("not_root6", not a_file_system.is_root_directory ("\\foo\bar/gobo"))
			assert ("not_root7", not a_file_system.is_root_directory ("\\foo\bar\gobo"))
			create a_file_system.make_backslash_only
			assert ("not_root3", not a_file_system.is_root_directory ("/"))
			assert ("not_root5", not a_file_system.is_root_directory ("c:/"))
			assert ("root8", a_file_system.is_root_directory ("\\foo\bar/gobo"))
		end

	test_basename
			-- Test feature `basename'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			assert_equal ("basename1", "bar", a_file_system.basename ("foo\bar"))
			assert_equal ("basename2", "bar", a_file_system.basename ("foo\\bar"))
			assert_equal ("basename3", "bar", a_file_system.basename ("foo/bar"))
			assert_equal ("basename4", "bar.e", a_file_system.basename ("c:\toto\foo\bar.e"))
			assert_equal ("basename5", "\", a_file_system.basename ("\"))
			assert_equal ("basename6", "\", a_file_system.basename ("c:\"))
			assert_equal ("basename7", "foo", a_file_system.basename ("foo"))
			assert_equal ("basename8", "foo", a_file_system.basename ("\foo"))
			assert_equal ("basename9", "foo", a_file_system.basename ("foo\"))
			assert_equal ("basename10", "foo", a_file_system.basename ("c:\foo\"))
			assert_equal ("basename11", ".", a_file_system.basename ("."))
			assert_equal ("basename12", "\", a_file_system.basename ("\\foo\bar"))
			assert_equal ("basename13", "\", a_file_system.basename ("\\foo\bar\"))
			assert_equal ("basename14", "toto", a_file_system.basename ("\\foo\bar\toto"))
			assert_equal ("basename15", "foo", a_file_system.basename ("c:\foo"))
			create a_file_system.make_backslash_only
			assert_equal ("basename16", "foo/bar", a_file_system.basename ("foo/bar"))
		end

	test_dirname
			-- Test feature `dirname'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			assert_equal ("dirname1", "foo", a_file_system.dirname ("foo\bar"))
			assert_equal ("dirname2", "foo", a_file_system.dirname ("foo\\bar"))
			assert_equal ("dirname3", "foo", a_file_system.dirname ("foo/bar"))
			assert_equal ("dirname4", "\toto\foo", a_file_system.dirname ("\toto\foo\bar.e"))
			assert_equal ("dirname5", "\", a_file_system.dirname ("\"))
			assert_equal ("dirname6", "c:\", a_file_system.dirname ("c:\"))
			assert_equal ("dirname7", ".", a_file_system.dirname ("foo"))
			assert_equal ("dirname8", "\", a_file_system.dirname ("\foo"))
			assert_equal ("dirname9", "foo", a_file_system.dirname ("foo\bar\"))
			assert_equal ("dirname10", "\", a_file_system.dirname ("\foo\"))
			assert_equal ("dirname11", ".", a_file_system.dirname ("."))
			assert_equal ("dirname12", "c:\", a_file_system.dirname ("c:\foo"))
			assert_equal ("dirname13", "\\foo\bar", a_file_system.dirname ("\\foo\bar"))
			assert_equal ("dirname14", "\\foo\bar\", a_file_system.dirname ("\\foo\bar\"))
			assert_equal ("dirname15", "\\foo\bar\\", a_file_system.dirname ("\\foo\bar\\"))
			assert_equal ("dirname15", "\\foo\bar", a_file_system.dirname ("\\foo\bar\toto"))
			assert_equal ("dirname18", "\\foo\bar", a_file_system.dirname ("\\foo\bar/gobo"))
			create a_file_system.make_backslash_only
			assert_equal ("dirname16", ".", a_file_system.dirname ("foo/bar"))
			assert_equal ("dirname17", "\\foo\bar/gobo", a_file_system.dirname ("\\foo\bar/gobo"))
		end

	test_pathname
			-- Test feature `pathname'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			assert_equal ("pathname1", "foo\bar", a_file_system.pathname ("foo", "bar"))
			assert_equal ("pathname2", "c:\foo\bar\gobo", a_file_system.pathname ("c:\foo", "bar\gobo"))
			assert_equal ("pathname3", "foo\bar", a_file_system.pathname ("foo\", "bar"))
			assert_equal ("pathname4", "foo\..\bar", a_file_system.pathname ("foo", "..\bar"))
			assert_equal ("pathname5", "bar", a_file_system.pathname ("", "bar"))
			assert_equal ("pathname6", "foo", a_file_system.pathname ("foo", ""))
			assert_equal ("pathname7", "", a_file_system.pathname ("", ""))
		end

	test_canonical_pathname
			-- Test feature `canonical_pathname'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			assert_equal ("pathname1", "foo\bar", a_file_system.canonical_pathname ("foo\.\bar"))
			assert_equal ("pathname2", ".", a_file_system.canonical_pathname ("."))
			assert_equal ("pathname3", "foo", a_file_system.canonical_pathname ("foo\"))
			assert_equal ("pathname4", "foo\gobo", a_file_system.canonical_pathname ("foo\bar\..\gobo"))
			assert_equal ("pathname5", "..\foo\gobo", a_file_system.canonical_pathname ("..\foo\bar\..\gobo"))
			assert_equal ("pathname6", "foo\bar", a_file_system.canonical_pathname ("foo\\bar"))
			assert_equal ("pathname7", "c:\foo\bar", a_file_system.canonical_pathname ("c:\foo\bar"))
			assert_equal ("pathname8", "c:\", a_file_system.canonical_pathname ("c:\.."))
			assert_equal ("pathname9", "\", a_file_system.canonical_pathname ("\.."))
			assert_equal ("pathname10", "\\foo\bar", a_file_system.canonical_pathname ("\\foo\bar\gobo\.."))
			assert_equal ("pathname11", "\\foo\bar", a_file_system.canonical_pathname ("\\foo\bar\.."))
			assert_equal ("pathname12", "..", a_file_system.canonical_pathname (".\.."))
		end

	test_relative_current_directory
			-- Test feature `relative_current_directory'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			assert_equal ("current", ".", a_file_system.relative_current_directory)
		end

	test_relative_parent_directory
			-- Test feature `relative_parent_directory'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			assert_equal ("parent", "..", a_file_system.relative_parent_directory)
		end

	test_root_directory
			-- Test feature `root_directory'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			assert_equal ("root", "\", a_file_system.root_directory)
		end

	test_absolute_pathname
			-- Test feature `absolute_pathname'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			cwd: STRING
		do
			create a_file_system.make
			if a_file_system.is_current_file_system then
				cwd := a_file_system.cwd
				assert_equal ("absolute1", "c:\foo\bar", a_file_system.absolute_pathname ("c:\foo\bar"))
				assert_equal ("absolute2", "c:\", a_file_system.absolute_pathname ("c:\"))
				assert_equal ("absolute3", "\\foo\bar", a_file_system.absolute_pathname ("\\foo\bar"))
				assert_equal ("absolute4", a_file_system.current_drive + "\foo\bar", a_file_system.absolute_pathname ("\foo\bar"))
				assert_equal ("absolute5", a_file_system.pathname (cwd, "foo\bar"), a_file_system.absolute_pathname ("foo\bar"))
			end
		end

	test_absolute_parent_directory1
			-- Test feature `absolute_parent_directory'.
			-- Absolute directory name.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			cwd: STRING
			a_name, a_parent: STRING
		do
			create a_file_system.make
			if a_file_system.is_current_file_system then
				cwd := a_file_system.cwd
				a_name := Execution_environment.interpreted_string ("$GOBO\test\kernel")
				assert ("readable1", a_file_system.is_directory_readable (a_name))
				a_parent := a_file_system.absolute_parent_directory (a_name)
				a_name := Execution_environment.interpreted_string ("$GOBO\test")
				a_name := a_file_system.absolute_pathname (a_name)
				assert ("parent1", a_file_system.same_pathnames (a_name, a_parent))
				assert ("cwd1", a_file_system.same_pathnames (cwd, a_file_system.cwd))
					-- For the following tests it is hope that we are not
					-- on drive G:. The drive G: might not even exist but
					-- the tests should still succeed.
				a_name := "G:\foo\bar"
				a_parent := a_file_system.absolute_parent_directory (a_name)
				assert ("parent2", a_file_system.same_pathnames ("G:\foo", a_parent))
				a_name := "G:\foo"
				a_parent := a_file_system.absolute_parent_directory (a_name)
				assert ("parent3", a_file_system.same_pathnames ("G:\", a_parent))
				a_name := "G:\"
				a_parent := a_file_system.absolute_parent_directory (a_name)
				assert_same ("root1", a_name, a_parent)
				assert ("parent4", a_file_system.same_pathnames ("G:\", a_parent))
					-- Absolute directory names with no drive letter.
				a_name := "\foo\bar"
				a_parent := a_file_system.absolute_parent_directory (a_name)
				assert ("parent5", a_file_system.same_pathnames (STRING_.concat (a_file_system.current_drive, "\foo"), a_parent))
				a_name := "\foo"
				a_parent := a_file_system.absolute_parent_directory (a_name)
				assert ("parent6", a_file_system.same_pathnames (a_file_system.absolute_root_directory, a_parent))
				a_name := "\"
				a_parent := a_file_system.absolute_parent_directory (a_name)
				assert ("parent7", a_file_system.same_pathnames (a_file_system.absolute_root_directory, a_parent))
			end
		end

	test_absolute_parent_directory2
			-- Test feature `absolute_parent_directory'.
			-- Relative directory name.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			cwd: STRING
			a_name, a_parent: STRING
		do
			create a_file_system.make
			if a_file_system.is_current_file_system then
				cwd := a_file_system.cwd
				a_name := Execution_environment.interpreted_string ("$GOBO\test")
				assert ("readable1", a_file_system.is_directory_readable (a_name))
				a_file_system.cd (a_name)
				a_name := a_file_system.pathname ("kernel", "data")
				assert ("readable2", a_file_system.is_directory_readable (a_name))
				a_parent := a_file_system.absolute_parent_directory (a_name)
				a_name := Execution_environment.interpreted_string ("$GOBO\test\kernel")
				a_name := a_file_system.absolute_pathname (a_name)
				assert ("parent1", a_file_system.same_pathnames (a_name, a_parent))
					-- Possibly non-existing relative directory name.
				a_name := "foobar"
				a_parent := a_file_system.absolute_parent_directory (a_name)
				a_name := Execution_environment.interpreted_string ("$GOBO\test")
				assert ("parent2", a_file_system.same_pathnames (a_name, a_parent))
				a_file_system.cd (cwd)
				assert ("back", a_file_system.same_pathnames (cwd, a_file_system.cwd))
			end
		end

	test_absolute_parent_directory3
			-- Test feature `parent_absolute_directory'.
			-- Non-existing directory name.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			cwd: STRING
			a_name, a_parent: STRING
		do
			create a_file_system.make
			if a_file_system.is_current_file_system then
				cwd := a_file_system.cwd
					-- Non-existing directory.
				a_name := new_dirname ("gobo")
				assert ("not_readable1", not a_file_system.is_directory_readable (a_name))
				a_parent := a_file_system.absolute_parent_directory (a_name)
				assert ("parent1", a_file_system.same_pathnames (cwd, a_parent))
				assert ("not_moved1", a_file_system.same_pathnames (cwd, a_file_system.cwd))
					-- Non-existing directory with empty pathname.
				a_name := ""
				assert ("not_readable2", not a_file_system.is_directory_readable (a_name))
				a_parent := a_file_system.absolute_parent_directory (a_name)
				assert ("parent2", a_file_system.same_pathnames (a_file_system.absolute_parent_directory (cwd), a_parent))
				assert ("not_moved2", a_file_system.same_pathnames (cwd, a_file_system.cwd))
			end
		end

	test_absolute_parent_directory4
			-- Test feature `parent_absolute_directory'.
			-- UNC directory name.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_name, a_parent: STRING
		do
			create a_file_system.make
			if a_file_system.is_current_file_system then
				a_name := "\\gobosoft.com\shares\foo"
				a_parent := a_file_system.absolute_parent_directory (a_name)
				assert ("parent1", a_file_system.same_pathnames ("\\gobosoft.com\shares", a_parent))
				a_name := "\\gobosoft.com\shares\foo\bar"
				a_parent := a_file_system.absolute_parent_directory (a_name)
				assert ("parent2", a_file_system.same_pathnames ("\\gobosoft.com\shares\foo", a_parent))
				a_name := "\\gobosoft.com\shares"
				a_parent := a_file_system.absolute_parent_directory (a_name)
				assert_same ("root1", a_name, a_parent)
				assert ("parent3", a_file_system.same_pathnames ("\\gobosoft.com\shares", a_parent))
				a_name := "\\gobosoft.com\shares/foo"
				a_parent := a_file_system.absolute_parent_directory (a_name)
				assert ("parent4", a_file_system.same_pathnames ("\\gobosoft.com\shares", a_parent))
			end
		end

	test_absolute_root_directory
			-- Test feature `absolute_root_directory'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			if a_file_system.is_current_file_system then
				assert_equal ("root", a_file_system.current_drive + "\", a_file_system.absolute_root_directory)
			end
		end

	test_string_to_pathname
			-- Test feature `string_to_pathname'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_pathname: KL_PATHNAME
		do
			create a_file_system.make
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_names (<<"foo", "bar">>)
			assert ("relative1", a_file_system.string_to_pathname ("foo\bar").same_pathname (a_pathname))
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_current
			assert ("relative2", a_file_system.string_to_pathname (".").same_pathname (a_pathname))
			create a_pathname.make
			a_pathname.set_relative (False)
			a_pathname.append_name ("foo")
			assert ("absolute1", a_file_system.string_to_pathname ("\foo").same_pathname (a_pathname))
			create a_pathname.make
			a_pathname.set_relative (False)
			a_pathname.set_drive ("c:")
			assert ("absolute2", a_file_system.string_to_pathname ("c:\").same_pathname (a_pathname))
			create a_pathname.make
			a_pathname.set_relative (False)
			a_pathname.set_hostname ("gobo")
			a_pathname.set_sharename ("shares")
			a_pathname.append_names (<<"foo", "bar">>)
			assert ("absolute3", a_file_system.string_to_pathname ("\\gobo\shares\foo\bar").same_pathname (a_pathname))
		end

	test_pathname_to_string
			-- Test feature `pathname_to_string'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
			a_pathname: KL_PATHNAME
		do
			create a_file_system.make
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_names (<<"foo", "bar">>)
			assert_equal ("relative1", "foo\bar", a_file_system.pathname_to_string (a_pathname))
			create a_pathname.make
			a_pathname.set_relative (True)
			a_pathname.append_current
			assert_equal ("relative2", ".", a_file_system.pathname_to_string (a_pathname))
			create a_pathname.make
			a_pathname.set_relative (False)
			a_pathname.append_name ("foo")
			assert_equal ("absolute1", "\foo", a_file_system.pathname_to_string (a_pathname))
			create a_pathname.make
			a_pathname.set_relative (False)
			a_pathname.set_drive ("c:")
			assert_equal ("absolute2", "c:\", a_file_system.pathname_to_string (a_pathname))
			create a_pathname.make
			a_pathname.set_relative (False)
			a_pathname.set_hostname ("gobo")
			a_pathname.append_names (<<"foo", "bar">>)
			assert_equal ("absolute3", "\\gobo\foo\bar", a_file_system.pathname_to_string (a_pathname))
		end

	test_pathname_from_file_system
			-- Test feature `pathname_from_file_system'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			assert_equal ("unix1", "foo\bar", a_file_system.pathname_from_file_system ("foo/bar", unix_file_system))
			assert_equal ("unix2", "\foo\bar", a_file_system.pathname_from_file_system ("/foo/bar", unix_file_system))
			assert_equal ("windows1", "foo\bar", a_file_system.pathname_from_file_system ("foo\bar", windows_file_system))
			assert_equal ("windows2", "c:\foo\bar", a_file_system.pathname_from_file_system ("c:\foo\bar", windows_file_system))
			assert_equal ("windows3", "\\gobo\foo\bar", a_file_system.pathname_from_file_system ("\\gobo\foo\bar", windows_file_system))
		end

	test_has_extension
			-- Test feature `has_extension'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			assert ("extension1", a_file_system.has_extension ("foo\bar.e", ".e"))
			assert ("extension2", a_file_system.has_extension ("foo\bar", "ar"))
			assert ("extension3", a_file_system.has_extension ("foo\bar.exe", ".exe"))
			assert ("not_extension1", not a_file_system.has_extension ("foo\bar.e", ".o"))
		end

	test_extension
			-- Test feature `extension'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			assert_equal ("extension1", ".e", a_file_system.extension ("foo\bar.e"))
			assert_equal ("extension2", "", a_file_system.extension ("foo\bar"))
			assert_equal ("extension3", "", a_file_system.extension ("foo.e\bar"))
			assert_equal ("extension4", ".obj", a_file_system.extension ("foo\.obj"))
			assert_equal ("extension5", "", a_file_system.extension ("foo"))
			assert_equal ("extension6", "", a_file_system.extension (""))
		end

	test_exe_extension
			-- Test feature `exe_extension'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			assert_equal ("exe_extension", ".exe", a_file_system.exe_extension)
		end

	test_directory_separator
			-- Test feature `directory_separator'.
		local
			a_file_system: KL_WINDOWS_FILE_SYSTEM
		do
			create a_file_system.make
			assert_characters_equal ("directory_separator", '\', a_file_system.directory_separator)
		end

end
