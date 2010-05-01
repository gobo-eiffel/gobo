note

	description:

		"Test features of class KL_UNIX_OUTPUT_FILE"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_TEST_UNIX_OUTPUT_FILE

inherit

	KL_TEST_CASE

	DT_SHARED_SYSTEM_CLOCK
		export {NONE} all end

create

	make_default

feature -- Test

	test_make is
			-- Test feature `make'.
		local
			a_file: KL_UNIX_OUTPUT_FILE
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
			a_file: KL_UNIX_OUTPUT_FILE
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
			a_file: KL_UNIX_OUTPUT_FILE
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
			a_file: KL_UNIX_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
			assert_equal ("eol", "%N", a_file.eol)
		end

	test_count is
			-- Test feature `count'.
		local
			a_file: KL_UNIX_OUTPUT_FILE
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
			a_file: KL_UNIX_OUTPUT_FILE
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
			create a_file.make (a_name)
			a_file.open_write
			assert ("is_opened", a_file.is_open_write)
			a_file.put_string ("Hello gobo")
			a_file.close
			dt1 := utc_system_clock.date_time_now
			assert ("is_closed", a_file.is_closed)
			dt3 := dt1.cloned_object
			dt1.add_seconds (-5)
			dt3.add_seconds (5)
			create dt2.make_from_epoch (a_file.time_stamp)
			assert ("time_stamp3", dt1 < dt2)
			assert ("time_stamp4", dt2 < dt3)
			a_file.delete
		end

	test_open_write is
			-- Test feature `open_write'.
		local
			a_file: KL_UNIX_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
			assert ("is_closed", a_file.is_closed)
			a_file.open_write
			assert ("is_opened", a_file.is_open_write)
			a_file.close
			assert ("is_closed2", a_file.is_closed)
			assert_files_equal ("empty", empty_filename, a_name)
			file_system.delete_file (a_name)
		end

	test_open_append is
			-- Test feature `open_append'.
		local
			a_file: KL_UNIX_OUTPUT_FILE
			a_name: STRING
		do
				-- Create an empty file.
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
			assert ("is_closed1", a_file.is_closed)
			a_file.open_append
			assert ("is_opened1", a_file.is_open_write)
			a_file.close
			assert ("is_closed2", a_file.is_closed)
			assert_files_equal ("diff1", empty_filename, a_name)
			a_file.delete
				-- Create a file with append.
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
			assert ("is_closed3", a_file.is_closed)
			a_file.open_append
			assert ("is_opened2", a_file.is_open_write)
			a_file.put_string ("Hello gobo")
			a_file.close
			assert ("is_closed4", a_file.is_closed)
			assert_files_equal ("diff2", hello_filename, a_name)
			a_file.delete
				-- Create a file with append and then reopen it.
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
			assert ("is_closed5", a_file.is_closed)
			a_file.open_append
			assert ("is_opened3", a_file.is_open_write)
			a_file.put_string ("Hello")
			a_file.close
			assert ("is_closed6", a_file.is_closed)
			a_file.open_append
			assert ("is_opened4", a_file.is_open_write)
			a_file.put_string (" gobo")
			a_file.close
			assert ("is_closed7", a_file.is_closed)
			assert_files_equal ("diff3", hello_filename, a_name)
			a_file.delete
		end

	test_put_character is
			-- Test feature `put_character'.
		local
			a_file: KL_UNIX_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
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
			a_file: KL_UNIX_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
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
			a_file: KL_UNIX_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
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
			a_file: KL_UNIX_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
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
			a_file: KL_UNIX_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_integer (0)
				a_file.put_new_line
				a_file.put_integer (1)
				a_file.put_new_line
				a_file.put_integer (-1)
				a_file.put_new_line
				a_file.put_integer (-123)
				a_file.put_new_line
				a_file.put_integer (5674)
				a_file.put_new_line
					-- Minimum integer value.
					-- Note: ISE 5.4 does not like having directly -2147483648 because
					-- it considers it as an INTEGER_64 instead of an INTEGER.
				a_file.put_integer (-2147483647 - 1)
				a_file.put_new_line
					-- Maximum integer value.
				a_file.put_integer (2147483647)
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
			a_file: KL_UNIX_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
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
			a_file: KL_UNIX_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
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

	test_change_name1 is
			-- Test feature `change_name'.
			-- Old file exists and new file does not exist.
		local
			a_file: KL_UNIX_OUTPUT_FILE
			old_name, new_name: STRING
		do
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
			create a_file.make (old_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert ("readable1", file_system.is_file_readable (old_name))
				assert ("not_readable1", not file_system.is_file_readable (new_name))
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
			a_file: KL_UNIX_OUTPUT_FILE
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
			a_file: KL_UNIX_OUTPUT_FILE
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
			a_file: KL_UNIX_OUTPUT_FILE
			new_file: KL_UNIX_OUTPUT_FILE
			old_name, new_name: STRING
		do
			old_name := new_filename ("gobo", ".tmp")
			new_name := new_filename ("gobo", ".tmp")
			create new_file.make (new_name)
			new_file.open_write
			if new_file.is_open_write then
				new_file.put_string ("Hello gobo")
				new_file.close
				assert ("is_closed1", new_file.is_closed)
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
					assert ("readable1", file_system.is_file_readable (old_name))
					assert ("readable2", file_system.is_file_readable (new_name))
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
			a_file: KL_UNIX_OUTPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
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

	test_unix is
			-- Test that file is a unix file.
		local
			a_file: KL_UNIX_OUTPUT_FILE
			in_file: KL_BINARY_INPUT_FILE
			a_name: STRING
		do
			a_name := new_filename ("gobo", ".tmp")
			create a_file.make (a_name)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_new_line
				a_file.close
				assert ("is_closed1", a_file.is_closed)
				assert ("readable1", file_system.is_file_readable (a_name))
				create in_file.make (a_name)
				in_file.open_read
				if in_file.is_open_read then
					in_file.read_character
					assert ("not_eof1", not in_file.end_of_file)
					assert_characters_equal ("new_line", '%N', in_file.last_character)
					in_file.read_character
					assert ("eof1", in_file.end_of_file)
					in_file.close
					assert ("is_closed2", in_file.is_closed)
				else
					assert ("is_opened2", False)
				end
				a_file.delete
				assert ("not_readable1", not file_system.is_file_readable (a_name))
			else
				assert ("is_opened1", False)
			end
		end

end
