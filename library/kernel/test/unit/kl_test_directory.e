note

	description:

		"Test features of class KL_DIRECTORY"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_TEST_DIRECTORY

inherit

	KL_TEST_CASE
	KL_SHARED_EXECUTION_ENVIRONMENT
	UC_SHARED_STRING_COMPARATOR
	KL_IMPORTED_STRING_ROUTINES

create

	make_default

feature -- Test

	test_make
			-- Test feature `make'.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
		do
				-- Existing directory name:
			a_name := kernel_dirname
			a_name := Execution_environment.interpreted_string (a_name)
			create a_directory.make (a_name)
			assert ("a_directory_not_void1", a_directory /= Void)
			assert_same ("name_set1", a_name, a_directory.name)
			assert ("is_closed1", a_directory.is_closed)
				-- Dummy directory name:
			a_name := new_dirname ("gobo")
			create a_directory.make (a_name)
			assert ("a_directory_not_void2", a_directory /= Void)
			assert_same ("name_set2", a_name, a_directory.name)
			assert ("is_closed2", a_directory.is_closed)
		end

	test_exists1
			-- Test feature `exists'.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
		do
			a_name := new_dirname ("gobo")
			create a_directory.make (a_name)
			assert ("not_exists1", not a_directory.exists)
			a_directory.create_directory
			assert ("exists1", a_directory.exists)
			a_directory.delete
			assert ("not_exists2", not a_directory.exists)
		end

	test_exists2
			-- Test feature `exists'.
		local
			a_directory: KL_DIRECTORY
			a_file: KL_TEXT_INPUT_FILE
			a_name: STRING
		do
				-- The following directory, whose pathname has a non-empty
				-- dirname, does exist.
			a_name := data_dirname
			a_name := Execution_environment.interpreted_string (a_name)
			create a_directory.make (a_name)
			assert ("exists1", a_directory.exists)
				-- The current directory exists.
			a_name := file_system.relative_current_directory
			create a_directory.make (a_name)
			assert ("exists2", a_directory.exists)
				-- The following directory, whose pathname has a non-empty
				-- dirname, does not exist.
			a_name := file_system.nested_pathname ("$GOBO", <<"test", "kernel", "dataoops">>)
			a_name := Execution_environment.interpreted_string (a_name)
			create a_directory.make (a_name)
			assert ("not_exists1", not a_directory.exists)
				-- The following directory, whose pathname has a non-empty
				-- dirname and a basename containing a space, does not exist.
			a_name := file_system.nested_pathname ("$GOBO", <<"test", "kernel", "data oops">>)
			a_name := Execution_environment.interpreted_string (a_name)
			create a_directory.make (a_name)
			assert ("not_exists2", not a_directory.exists)
				-- A directory with an empty name does not exist.
			create a_directory.make ("")
			assert ("not_exists3", not a_directory.exists)
				-- The following pathname exists, but it is a
				-- file and hence is not an existing directory.
			a_name := gobo_filename
			a_name := Execution_environment.interpreted_string (a_name)
			create a_file.make (a_name)
			assert ("file_exists", a_file.exists)
			create a_directory.make (a_name)
			assert ("not_exists4", not a_directory.exists)
				-- Create an empty directory in the current directory and then
				-- check that this directory, whose pathname has an empty
				-- dirname, does exist. Then delete this newly created
				-- directory and check than it does not exist anymore.
			a_name := new_dirname ("gobo")
			create a_directory.make (a_name)
			assert ("not_exists5", not a_directory.exists)
			a_directory.create_directory
			assert ("exists3", a_directory.exists)
			a_directory.delete
			assert ("not_exists6", not a_directory.exists)
		end

	test_is_readable1
			-- Test feature `is_readable'.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
		do
			a_name := new_dirname ("gobo")
			create a_directory.make (a_name)
			assert ("not_readable1", not a_directory.is_readable)
			a_directory.create_directory
			assert ("readable1", a_directory.is_readable)
			a_directory.delete
			assert ("not_readable2", not a_directory.is_readable)
		end

	test_is_readable2
			-- Test feature `is_readable'.
		local
			a_directory: KL_DIRECTORY
			a_file: KL_TEXT_INPUT_FILE
			a_name: STRING
		do
				-- The following directory, whose pathname has a non-empty
				-- dirname, is readable.
			a_name := data_dirname
			a_name := Execution_environment.interpreted_string (a_name)
			create a_directory.make (a_name)
			assert ("readable1", a_directory.is_readable)
				-- The current directory is readable.
			a_name := file_system.relative_current_directory
			create a_directory.make (a_name)
			assert ("readable2", a_directory.is_readable)
				-- The following directory, whose pathname has a non-empty
				-- dirname, is not readable.
			a_name := file_system.nested_pathname ("$GOBO", <<"test", "kernel", "dataoops">>)
			a_name := Execution_environment.interpreted_string (a_name)
			create a_directory.make (a_name)
			assert ("not_readable1", not a_directory.is_readable)
				-- The following directory, whose pathname has a non-empty
				-- dirname and a basename containing a space, is not readable.
			a_name := file_system.nested_pathname ("$GOBO", <<"test", "kernel", "data oops">>)
			a_name := Execution_environment.interpreted_string (a_name)
			create a_directory.make (a_name)
			assert ("not_readable2", not a_directory.is_readable)
				-- A directory with an empty name is not readable.
			create a_directory.make ("")
			assert ("not_readable3", not a_directory.is_readable)
				-- The following pathname exists, but it is a
				-- file and hence is not a readable directory.
			a_name := gobo_filename
			a_name := Execution_environment.interpreted_string (a_name)
			create a_file.make (a_name)
			assert ("file_readable", a_file.is_readable)
			create a_directory.make (a_name)
			assert ("not_readable4", not a_directory.is_readable)
				-- Create an empty directory in the current directory and then
				-- check that this directory, whose pathname has an empty
				-- dirname, is readable. Then delete this newly created
				-- directory and check than it is not readable anymore.
			a_name := new_dirname ("gobo")
			create a_directory.make (a_name)
			assert ("not_readable5", not a_directory.is_readable)
			a_directory.create_directory
			assert ("readable3", a_directory.is_readable)
			a_directory.delete
			assert ("not_readable6", not a_directory.is_readable)
		end

	test_open_read
			-- Test feature `open_read'.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
		do
				-- Existing directory name:
			a_name := kernel_dirname
			a_name := Execution_environment.interpreted_string (a_name)
			create a_directory.make (a_name)
			assert ("is_closed", a_directory.is_closed)
			a_directory.open_read
			assert ("is_opened", a_directory.is_open_read)
			a_directory.close
			assert ("is_closed2", a_directory.is_closed)
				-- Dummy directory name:
			a_name := new_dirname ("gobo")
			create a_directory.make (a_name)
			assert ("is_closed3", a_directory.is_closed)
			a_directory.open_read
			assert ("not_opened", not a_directory.is_open_read)
		end

	test_read_entry
			-- Test feature `read_entry'.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
			filenames: DS_ARRAYED_LIST [STRING]
			name_sorter: DS_QUICK_SORTER [STRING]
			expected_entries: ARRAY [STRING]
			an_entry: STRING
			svn_directory: STRING
			gitignore_filename: STRING
			vss_extension: STRING
		do
			a_name := data_dirname
			a_name := Execution_environment.interpreted_string (a_name)
			create a_directory.make (a_name)
			a_directory.open_read
			if a_directory.is_open_read then
				assert ("not_eof", not a_directory.end_of_input)
				svn_directory := ".svn"
				vss_extension := ".scc"
				gitignore_filename := ".gitignore"
				from
					create filenames.make (10)
				until
					a_directory.end_of_input
				loop
					a_directory.read_entry
					if not a_directory.end_of_input then
						an_entry := a_directory.last_entry
						if
							not STRING_.same_string (an_entry, file_system.relative_current_directory) and
							not STRING_.same_string (an_entry, file_system.relative_parent_directory) and
							not STRING_.same_string (an_entry, svn_directory) and
							not STRING_.same_string (an_entry, gitignore_filename) and
							not file_system.has_extension (an_entry, vss_extension)
						then
							filenames.force_last (an_entry)
						end
					end
				end
				create name_sorter.make (string_comparator)
				filenames.sort (name_sorter)
				expected_entries := <<"booleans.txt", "empty.txt", "gobo.txt", "hello.txt", "integers.txt">>
				assert_arrays_equal ("entries", expected_entries, filenames.to_array)
				a_directory.close
				assert ("is_closed", a_directory.is_closed)
			else
				assert ("is_opened", False)
			end
		end

	test_empty_read_entry
			-- Test feature `read_entry' on empty directory.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
			filenames: DS_ARRAYED_LIST [STRING]
			name_sorter: DS_QUICK_SORTER [STRING]
			an_entry: STRING
			dot_svn: STRING
		do
			a_name := new_dirname ("gobo")
			assert ("not_readable1", not file_system.is_directory_readable (a_name))
			file_system.create_directory (a_name)
			assert ("readable1", file_system.is_directory_readable (a_name))
			create a_directory.make (a_name)
			a_directory.open_read
			if a_directory.is_open_read then
				assert ("not_eof", not a_directory.end_of_input)
				dot_svn := ".svn"
				from
					create filenames.make (10)
				until
					a_directory.end_of_input
				loop
					a_directory.read_entry
					if not a_directory.end_of_input then
						an_entry := a_directory.last_entry
						if
							not STRING_.same_string (an_entry, dot_svn) and
							not STRING_.same_string (an_entry, file_system.relative_current_directory) and
							not STRING_.same_string (an_entry, file_system.relative_parent_directory)
						then
							filenames.force_last (an_entry)
						end
					end
				end
				create name_sorter.make (string_comparator)
				filenames.sort (name_sorter)
				assert ("entries", filenames.to_array.count = 0)
				a_directory.close
				assert ("is_closed", a_directory.is_closed)
			else
				assert ("is_opened", False)
			end
			file_system.delete_directory (a_name)
			assert ("not_readable2", not file_system.is_directory_readable (a_name))
		end

	test_create_directory1
			-- Test feature `create_directory'.
			-- Create non-existing directory.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
		do
			a_name := new_dirname ("gobo")
			create a_directory.make (a_name)
			assert ("not_readable1", not file_system.is_directory_readable (a_name))
			a_directory.create_directory
			assert ("readable1", file_system.is_directory_readable (a_name))
			a_directory.delete
			assert ("not_readable2", not file_system.is_directory_readable (a_name))
		end

	test_create_directory2
			-- Test feature `create_directory'.
			-- Create existing directory.
		local
			a_directory: KL_DIRECTORY
			a_name, a_filename: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			a_name := new_dirname ("gobo")
			create a_directory.make (a_name)
			assert ("not_readable1", not file_system.is_directory_readable (a_name))
			a_directory.create_directory
			assert ("readable1", file_system.is_directory_readable (a_name))
			a_filename := file_system.pathname (a_name, "gobo1.tmp")
			create a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert ("readable2", file_system.is_file_readable (a_filename))
				assert_files_equal ("diff1", hello_filename, a_filename)
				a_directory.create_directory
				assert ("still_there", file_system.is_directory_readable (a_name))
				assert ("readable3", file_system.is_file_readable (a_filename))
				assert_files_equal ("diff2", hello_filename, a_filename)
				a_file.delete
				assert ("not_readable2", not file_system.is_file_readable (a_filename))
				a_directory.delete
				assert ("not_readable3", not file_system.is_directory_readable (a_name))
			else
				assert ("is_opened", False)
			end
		end

	test_create_directory3
			-- Test feature `create_directory'.
			-- Create nested directory.
		local
			a_directory, a_parent_directory: KL_DIRECTORY
			a_name, a_parent: STRING
		do
			a_parent := new_dirname ("gobo")
			a_name := file_system.pathname (a_parent, "gobo1")
			assert ("not_readable1", not file_system.is_directory_readable (a_parent))
			assert ("not_readable2", not file_system.is_directory_readable (a_name))
			create a_directory.make (a_name)
			a_directory.create_directory
			assert ("not_readable3", not file_system.is_directory_readable (a_parent))
			assert ("not_readable4", not file_system.is_directory_readable (a_name))
			create a_parent_directory.make (a_parent)
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

	test_recursive_create_directory
			-- Test feature `recursive_create_directory'.
		local
			a_directory: KL_DIRECTORY
			a_name, a_parent: STRING
		do
			a_parent := new_dirname ("gobo")
			a_name := file_system.pathname (a_parent, "gobo1")
			assert ("not_readable1", not file_system.is_directory_readable (a_parent))
			assert ("not_readable2", not file_system.is_directory_readable (a_name))
			create a_directory.make (a_name)
			a_directory.recursive_create_directory
			assert ("readable1", file_system.is_directory_readable (a_parent))
			assert ("readable2", file_system.is_directory_readable (a_name))
			create a_directory.make (a_parent)
			a_directory.recursive_delete
			assert ("not_readable3", not file_system.is_directory_readable (a_name))
			assert ("not_readable4", not file_system.is_directory_readable (a_parent))
		end

	test_delete1
			-- Test feature `delete'.
			-- Empty directory.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
		do
			a_name := new_dirname ("gobo")
			create a_directory.make (a_name)
			assert ("not_readable1", not file_system.is_directory_readable (a_name))
			a_directory.create_directory
			assert ("readable1", file_system.is_directory_readable (a_name))
			a_directory.delete
			assert ("not_readable2", not file_system.is_directory_readable (a_name))
		end

	test_delete2
			-- Test feature `delete'.
			-- Non-existing directory.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
		do
			a_name := new_dirname ("gobo")
			create a_directory.make (a_name)
			assert ("not_readable1", not file_system.is_directory_readable (a_name))
			a_directory.delete
			assert ("not_readable2", not file_system.is_directory_readable (a_name))
		end

	test_delete3
			-- Test feature `delete'.
			-- Non-empty directory.
		local
			a_directory: KL_DIRECTORY
			a_name, a_filename: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			a_name := new_dirname ("gobo")
			create a_directory.make (a_name)
			assert ("not_readable1", not file_system.is_directory_readable (a_name))
			a_directory.create_directory
			assert ("readable1", file_system.is_directory_readable (a_name))
			a_filename := file_system.pathname (a_name, "gobo1.tmp")
			create a_file.make (a_filename)
			a_file.open_write
			if a_file.is_open_write then
				a_file.put_string ("Hello gobo")
				a_file.close
				assert ("is_closed", a_file.is_closed)
				assert ("readable2", file_system.is_file_readable (a_filename))
				assert_files_equal ("diff", hello_filename, a_filename)
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

	test_delete4
			-- Test feature `delete'.
			-- Nested directory.
		local
			a_directory, a_parent_directory: KL_DIRECTORY
			a_name, a_parent: STRING
		do
			a_parent := new_dirname ("gobo")
			a_name := file_system.pathname (a_parent, "gobo1")
			assert ("not_readable1", not file_system.is_directory_readable (a_parent))
			assert ("not_readable2", not file_system.is_directory_readable (a_name))
			create a_parent_directory.make (a_parent)
			a_parent_directory.create_directory
			assert ("readable1", file_system.is_directory_readable (a_parent))
			assert ("not_readable3", not file_system.is_directory_readable (a_name))
			create a_directory.make (a_name)
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

	test_recursive_delete
			-- Test feature `recursive_delete'.
		local
			a_directory, a_parent_directory: KL_DIRECTORY
			a_name, a_parent: STRING
			a_filename: STRING
		do
			a_parent := new_dirname ("gobo")
			a_name := file_system.pathname (a_parent, "gobo1")
			assert ("not_readable1", not file_system.is_directory_readable (a_parent))
			assert ("not_readable2", not file_system.is_directory_readable (a_name))
			create a_parent_directory.make (a_parent)
			a_parent_directory.create_directory
			assert ("readable1", file_system.is_directory_readable (a_parent))
			assert ("not_readable3", not file_system.is_directory_readable (a_name))
			create a_directory.make (a_name)
			a_directory.create_directory
			assert ("readable2", file_system.is_directory_readable (a_parent))
			assert ("readable3", file_system.is_directory_readable (a_name))
			a_filename := file_system.pathname (a_name, "gobo2.tmp")
			file_system.copy_file (Execution_environment.interpreted_string (hello_filename), a_filename)
			assert ("readable4", file_system.is_file_readable (a_filename))
			assert_files_equal ("diff", hello_filename, a_filename)
			a_parent_directory.recursive_delete
			assert ("not_readable4", not file_system.is_file_readable (a_filename))
			assert ("not_readable5", not file_system.is_directory_readable (a_parent))
			assert ("not_readable6", not file_system.is_directory_readable (a_name))
		end

	test_filenames
			-- Test feature `filenames'.
		local
			a_directory: KL_DIRECTORY
			a_name: STRING
			filenames: ARRAY [STRING]
			filenames_list: DS_ARRAYED_LIST [STRING]
			name_sorter: DS_QUICK_SORTER [STRING]
			expected_entries: ARRAY [STRING]
			i, nb: INTEGER
			l_filename: STRING
			vss_extension: STRING
			gitignore_filename: STRING
		do
			a_name := data_dirname
			a_name := Execution_environment.interpreted_string (a_name)
			create a_directory.make (a_name)
			filenames := a_directory.filenames
			create filenames_list.make (filenames.count)
			vss_extension := ".scc"
			gitignore_filename := ".gitignore"
			i := filenames.lower
			nb := filenames.upper
			from until i > nb loop
				l_filename := filenames.item (i)
				if not file_system.has_extension (l_filename, vss_extension) and not STRING_.same_string (l_filename, gitignore_filename) then
					filenames_list.put_last (l_filename)
				end
				i := i + 1
			end
			create name_sorter.make (string_comparator)
			filenames_list.sort (name_sorter)
			filenames := filenames_list.to_array
			expected_entries := <<"booleans.txt", "empty.txt", "gobo.txt", "hello.txt", "integers.txt">>
			assert_arrays_equal ("entries", expected_entries, filenames)
		end

	test_directory_names
			-- Test feature `directory_names'.
		local
			a_directory, a_parent_directory: KL_DIRECTORY
			a_name, a_parent, a_child: STRING
			a_filename: STRING
			directory_names: ARRAY [STRING]
			directory_names_list: DS_ARRAYED_LIST [STRING]
			name_sorter: DS_QUICK_SORTER [STRING]
			expected_entries: ARRAY [STRING]
			i, nb: INTEGER
		do
			a_parent := new_dirname ("gobo")
			a_child := "gobo1"
			a_name := file_system.pathname (a_parent, a_child)
			assert ("not_readable1", not file_system.is_directory_readable (a_parent))
			assert ("not_readable2", not file_system.is_directory_readable (a_name))
			create a_parent_directory.make (a_parent)
			a_parent_directory.create_directory
			assert ("readable1", file_system.is_directory_readable (a_parent))
			assert ("not_readable3", not file_system.is_directory_readable (a_name))
			create a_directory.make (a_name)
			a_directory.create_directory
			assert ("readable2", file_system.is_directory_readable (a_parent))
			assert ("readable3", file_system.is_directory_readable (a_name))
			a_filename := file_system.pathname (a_parent, "gobo2.tmp")
			file_system.copy_file (Execution_environment.interpreted_string (hello_filename), a_filename)
			assert ("readable4", file_system.is_file_readable (a_filename))
			assert_files_equal ("diff", hello_filename, a_filename)
				-- a_parent/
				--          a_child/
				--          a_filename
			directory_names := a_parent_directory.directory_names
			create directory_names_list.make (directory_names.count)
			i := directory_names.lower
			nb := directory_names.upper
			from until i > nb loop
				directory_names_list.put_last (directory_names.item (i))
				i := i + 1
			end
			create name_sorter.make (string_comparator)
			directory_names_list.sort (name_sorter)
			directory_names := directory_names_list.to_array
			expected_entries := << a_child >>
			assert_arrays_equal ("entries", expected_entries, directory_names)
			a_parent_directory.recursive_delete
			assert ("not_readable4", not file_system.is_file_readable (a_filename))
			assert ("not_readable5", not file_system.is_directory_readable (a_parent))
			assert ("not_readable6", not file_system.is_directory_readable (a_name))
		end

end
