indexing

	description:

		"Test features of class KL_DIRECTORY"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class KL_TEST_DIRECTORY

inherit

	TS_TEST_CASE

	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_FILE_SYSTEM

feature -- Test

	test_make is
			-- Test feature `make'.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
		do
				-- Existing directory name:
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel")
			!! a_directory.make (a_name)
			assert ("a_directory_not_void", a_directory /= Void)
			assert_same ("name_set", a_name, a_directory.name)
			assert ("is_closed", a_directory.is_closed)
				-- Dummy directory name:
			a_name := "gobo123"
			!! a_directory.make (a_name)
			assert ("a_directory_not_void", a_directory /= Void)
			assert_same ("name_set", a_name, a_directory.name)
			assert ("is_closed", a_directory.is_closed)
		end

	test_open_read is
			-- Test feature `open_read'.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
		do
				-- Existing directory name:
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel")
			!! a_directory.make (a_name)
			assert ("is_closed", a_directory.is_closed)
			a_directory.open_read
			assert ("is_opened", a_directory.is_open_read)
			a_directory.close
			assert ("is_closed2", a_directory.is_closed)
				-- Dummy directory name:
			a_name := "gobo123"
			!! a_directory.make (a_name)
			assert ("is_closed3", a_directory.is_closed)
			a_directory.open_read
			assert ("not_opened", not a_directory.is_open_read)
		end

	test_read_entry is
			-- Test feature `read_entry'.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
			filenames: DS_ARRAYED_LIST [STRING]
			name_sorter: DS_QUICK_SORTER [STRING]
			name_comparator: DS_COMPARABLE_COMPARATOR [STRING]
			expected_entries: ARRAY [STRING]
			cvs_dir: STRING
		do
			a_name := Execution_environment.interpreted_string ("$GOBO/test/kernel/data")
			!! a_directory.make (a_name)
			a_directory.open_read
			if a_directory.is_open_read then
				assert ("not_eof", not a_directory.end_of_input)
				cvs_dir := "CVS"
				from
					!! filenames.make (10)
				until
					a_directory.end_of_input
				loop
					a_directory.read_entry
					if not a_directory.end_of_input then
						if not a_directory.last_entry.is_equal (cvs_dir) then
							filenames.force_last (a_directory.last_entry)
						end
					end
				end
				!! name_comparator.make
				!! name_sorter.make (name_comparator)
				filenames.sort (name_sorter)
				expected_entries := <<".", "..", "booleans.txt", "empty.txt", "gobo.txt", "hello.txt", "integers.txt">>
				assert_arrays_equal ("entries", expected_entries, filenames.to_array)
				a_directory.close
				assert ("is_closed", a_directory.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_empty_read_entry is
			-- Test feature `read_entry' on empty directory.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
			filenames: DS_ARRAYED_LIST [STRING]
			name_sorter: DS_QUICK_SORTER [STRING]
			name_comparator: DS_COMPARABLE_COMPARATOR [STRING]
			cvs_dir: STRING
		do
			a_name := "gobo3001"
			assert ("not_readable1", not file_system.is_directory_readable (a_name))
			file_system.create_directory (a_name)
			assert ("readable1", file_system.is_directory_readable (a_name))
			!! a_directory.make (a_name)
			a_directory.open_read
			if a_directory.is_open_read then
				assert ("not_eof", not a_directory.end_of_input)
				cvs_dir := "CVS"
				from
					!! filenames.make (10)
				until
					a_directory.end_of_input
				loop
					a_directory.read_entry
					if not a_directory.end_of_input then
						if not a_directory.last_entry.is_equal (cvs_dir) then
							filenames.force_last (a_directory.last_entry)
						end
					end
				end
				!! name_comparator.make
				!! name_sorter.make (name_comparator)
				filenames.sort (name_sorter)
				assert_arrays_equal ("entries", <<".", "..">>, filenames.to_array)
				a_directory.close
				assert ("is_closed", a_directory.is_closed)
			else
				assert ("is_opened", False)
			end
			file_system.delete_directory (a_name)
			assert ("not_readable2", not file_system.is_directory_readable (a_name))
		end

	test_create_directory1 is
			-- Test feature `create_directory'.
			-- Create non-existing directory.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
		do
			a_name := "gobo3002"
			!! a_directory.make (a_name)
			assert ("not_readable1", not file_system.is_directory_readable (a_name))
			a_directory.create_directory
			assert ("readable1", file_system.is_directory_readable (a_name))
			a_directory.delete
			assert ("not_readable2", not file_system.is_directory_readable (a_name))
		end

	test_create_directory2 is
			-- Test feature `create_directory'.
			-- Create existing directory.
		local
			a_directory: KL_DIRECTORY
			a_name, a_filename: STRING
			a_file: KL_OUTPUT_FILE
		do
			a_name := "gobo3003"
			!! a_directory.make (a_name)
			assert ("not_readable1", not file_system.is_directory_readable (a_name))
			a_directory.create_directory
			assert ("readable1", file_system.is_directory_readable (a_name))
			a_filename := "gobo3003/gobo301.tmp"
			!! a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert ("readable2", file_system.is_file_readable (a_filename))
				assert_files_equal ("diff1", "$GOBO/test/kernel/data/hello.txt", a_filename)
				a_directory.create_directory
				assert ("still_there", file_system.is_directory_readable (a_name))
				assert ("readable3", file_system.is_file_readable (a_filename))
				assert_files_equal ("diff2", "$GOBO/test/kernel/data/hello.txt", a_filename)
				a_file.delete
				assert ("not_readable2", not file_system.is_file_readable (a_filename))
				a_directory.delete
				assert ("not_readable3", not file_system.is_directory_readable (a_name))
			else
				assert ("is_opened", False)
			end
		end

	test_create_directory3 is
			-- Test feature `create_directory'.
			-- Create nested directory.
		local
			a_directory, a_parent_directory: KL_DIRECTORY
			a_name, a_parent: STRING
		do
			a_name := "gobo3004/gobo302"
			a_parent := "gobo3004"
			assert ("not_readable1", not file_system.is_directory_readable (a_parent))
			assert ("not_readable2", not file_system.is_directory_readable (a_name))
			!! a_directory.make (a_name)
			a_directory.create_directory
			assert ("not_readable3", not file_system.is_directory_readable (a_parent))
			assert ("not_readable4", not file_system.is_directory_readable (a_name))
			!! a_parent_directory.make (a_parent)
			a_parent_directory.create_directory
			assert ("readable1", file_system.is_directory_readable (a_parent))
			assert ("not_readable5", not file_system.is_directory_readable (a_name))
			a_directory.create_directory
			assert ("readable2", file_system.is_directory_readable (a_parent))
			assert ("readable3", file_system.is_directory_readable (a_name))
			a_directory.delete
			assert ("readable4", file_system.is_directory_readable (a_parent))
			assert ("not_readable6", not file_system.is_directory_readable (a_name))
			a_parent_directory.delete
			assert ("not_readable7", not file_system.is_directory_readable (a_parent))
			assert ("not_readable8", not file_system.is_directory_readable (a_name))
		end

	test_delete1 is
			-- Test feature `delete'.
			-- Empty directory.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
		do
			a_name := "gobo3005"
			!! a_directory.make (a_name)
			assert ("not_readable1", not file_system.is_directory_readable (a_name))
			a_directory.create_directory
			assert ("readable1", file_system.is_directory_readable (a_name))
			a_directory.delete
			assert ("not_readable2", not file_system.is_directory_readable (a_name))
		end

	test_delete2 is
			-- Test feature `delete'.
			-- Non-existing directory.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
		do
			a_name := "gobo3006"
			!! a_directory.make (a_name)
			assert ("not_readable1", not file_system.is_directory_readable (a_name))
			a_directory.delete
			assert ("not_readable2", not file_system.is_directory_readable (a_name))
		end

	test_delete3 is
			-- Test feature `delete'.
			-- Non-empty directory.
		local
			a_directory: KL_DIRECTORY
			a_name, a_filename: STRING
			a_file: KL_OUTPUT_FILE
		do
			a_name := "gobo3007"
			!! a_directory.make (a_name)
			assert ("not_readable1", not file_system.is_directory_readable (a_name))
			a_directory.create_directory
			assert ("readable1", file_system.is_directory_readable (a_name))
			a_filename := "gobo3007/gobo303.tmp"
			!! a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert ("readable2", file_system.is_file_readable (a_filename))
				assert_files_equal ("diff", "$GOBO/test/kernel/data/hello.txt", a_filename)
				a_directory.delete
				assert ("cannot_delete", file_system.is_directory_readable (a_name))
				a_file.delete
				assert ("not_readable2", not file_system.is_file_readable (a_filename))
				a_directory.delete
				assert ("not_readable3", not file_system.is_directory_readable (a_name))
			else
				assert ("is_opened", False)
			end
		end

	test_delete4 is
			-- Test feature `delete'.
			-- Nested directory.
		local
			a_directory, a_parent_directory: KL_DIRECTORY
			a_name, a_parent: STRING
		do
			a_name := "gobo3008/gobo304"
			a_parent := "gobo3008"
			assert ("not_readable1", not file_system.is_directory_readable (a_parent))
			assert ("not_readable2", not file_system.is_directory_readable (a_name))
			!! a_parent_directory.make (a_parent)
			a_parent_directory.create_directory
			assert ("readable1", file_system.is_directory_readable (a_parent))
			assert ("not_readable3", not file_system.is_directory_readable (a_name))
			!! a_directory.make (a_name)
			a_directory.create_directory
			assert ("readable2", file_system.is_directory_readable (a_parent))
			assert ("readable3", file_system.is_directory_readable (a_name))
			a_directory.delete
			assert ("readable4", file_system.is_directory_readable (a_parent))
			assert ("not_readable4", not file_system.is_directory_readable (a_name))
			a_parent_directory.delete
			assert ("not_readable5", not file_system.is_directory_readable (a_parent))
			assert ("not_readable6", not file_system.is_directory_readable (a_name))
		end

end -- class KL_TEST_DIRECTORY
