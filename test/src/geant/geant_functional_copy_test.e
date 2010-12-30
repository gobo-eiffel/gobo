indexing

	description:

		"Test task 'copy'"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2008, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date: 2008-09-09 19:43:32 +0200 (Tue, 09 Sep 2008) $"
	revision: "$Revision: 6507 $"

class GEANT_FUNCTIONAL_COPY_TEST

inherit

	GEANT_FUNCTIONAL_TEST_CASE
		redefine
			set_up
		end

create

	make_default

feature -- Test

	set_up is
			-- Setup for a test.
		do
			precursor
			file_system.recursive_delete_directory ("__copy")
			file_system.delete_file ("1.txt")
		end

	test_copy1 is
			-- Test task 'copy': file, to_file
		local
			s: STRING
			a_tmp_geant_subdir: STRING
		do

				-- Test mkdir with one directory level:
--			a_tmp_geant_subdir := "__tmp_geant_subdir"
--			file_system.recursive_delete_directory (a_tmp_geant_subdir)
--			assert_true ("test_copy1_prepare1", not file_system.directory_exists (a_tmp_geant_subdir))
--			file_system.recursive_create_directory (a_tmp_geant_subdir)
-- 			assert_true ("test_copy1_prepare2", file_system.directory_exists (a_tmp_geant_subdir))

 			tasks := "<copy file='${GOBO}/Readme.txt' to_file='1.txt'/>"
 			basic_test ("test_copy1a")
 			assert_true ("test_copy1b", file_system.file_exists ("1.txt"))
 			assert_files_equal ("test_copy1c", "${GOBO}/Readme.txt", "1.txt")
		end

	test_copy2 is
			-- Test task 'copy': file, to_directory
		do
 			tasks := "<copy file='${GOBO}/Readme.txt' to_directory='__copy'/>"
 			basic_test ("test_copy2a")
 			assert_files_equal ("test_copy2b", path ("${GOBO}/Readme.txt"), path ("__copy/Readme.txt"))
		end

	test_copy3 is
			-- Test task 'copy': file, to_file, into nonexisting directory to test that the directory
			-- specified in 'to_file' is not created automatically
		do
 			tasks := "<copy file='${GOBO}/Readme.txt' to_file='__copy/1.txt'/>"

			expected_exit_code := 1
 			expected_task_output := "{
			|  [copy] error: cannot copy file 'GOBO/Readme.txt' to file '__copy/1.txt'
			}"
 			expected_task_output := STRING_.replaced_first_substring (expected_task_output,
				"GOBO", Execution_environment.variable_value ("GOBO"))
			expected_stdout_txt := default_expected_stdout_txt
			expected_stderr_txt := "{
				|
				|BUILD FAILED!
			}"
 			basic_test ("test_copy3a")
 			assert_false ("test_copy3b", file_system.file_exists (path ("__copy/1.txt")))
		end

	test_copy4 is
			-- Test task 'copy': file, to_directory, test lazy copying, test forced copying
		local
			a_timestamp1, a_timestamp2: INTEGER
		do
 			tasks := "<copy file='${GOBO}/Readme.txt' to_directory='__copy'/>"
 			basic_test ("test_copy4a")
 			assert_files_equal ("test_copy4b", path ("${GOBO}/Readme.txt"), "__copy/Readme.txt")

				-- test lazy copying (timestamp of target file after second
				-- copy attempt must be the same as before):
			a_timestamp1 := file_system.file_time_stamp (path ("__copy/Readme.txt"))
 			tasks := "<copy file='${GOBO}/Readme.txt' to_directory='__copy'/>"
 			basic_test ("test_copy4c")
			a_timestamp2 := file_system.file_time_stamp (path ("__copy/Readme.txt"))
 			assert_files_equal ("test_copy4d", path ("${GOBO}/Readme.txt"), "__copy/Readme.txt")
			assert_equal ("test_copy4e", a_timestamp1, a_timestamp2)


				-- test forced copying:
				-- Sleep 10 microseconds to be able to detect timestamp difference:
			sleep (10000)

 			tasks := "<copy file='${GOBO}/Readme.txt' to_directory='__copy' force='true'/>"
 			basic_test ("test_copy4f")
			a_timestamp2 := file_system.file_time_stamp (path ("__copy/Readme.txt"))
 			assert_files_equal ("test_copy4g", path ("${GOBO}/Readme.txt"), "__copy/Readme.txt")
			assert_not_equal ("test_copy4h", a_timestamp1, a_timestamp2)
		end

	test_copy5 is
			-- Test task 'copy': test behavior when source file does not exist
		do
 			tasks := "<copy file='${GOBO}/nonexistingfile.txt' to_file='1.txt'/>"

			expected_exit_code := 1
 			expected_task_output := "{
				|  [copy] error: cannot find file 'GOBO/nonexistingfile.txt'
			}"
 			expected_task_output := STRING_.replaced_first_substring (expected_task_output,
				"GOBO", Execution_environment.variable_value ("GOBO"))
			expected_stdout_txt := default_expected_stdout_txt
			expected_stderr_txt := "{
				|
				|BUILD FAILED!
			}"
 			basic_test ("test_copy5a")
 			assert_false ("test_copy5b", file_system.file_exists (path ("1.txt")))
		end

	test_copy_fs1 is
			-- Test task 'copy': to_directory/fileset
		do
			tasks := "{
				<copy to_directory="TESTDIR/__copy" dir="${GOBO}/src/geant">
					<fileset include="@(**/geant_e*command.e)"/>
				</copy>
				}"
 			tasks := STRING_.replaced_first_substring (tasks, "TESTDIR", test_dir)
 			basic_test ("test_copy_fs1a")

 			assert_files_equal ("test_copy_fs1b", path ("${GOBO}/src/geant/command/geant_echo_command.e"),
				path (test_dir + "/__copy/command/geant_echo_command.e"))

 			assert_files_equal ("test_copy_fs1c", path ("${GOBO}/src/geant/command/geant_exit_command.e"),
				path (test_dir + "/__copy/command/geant_exit_command.e"))

 			assert_files_equal ("test_copy_fs1d", path ("${GOBO}/src/geant/command/geant_exec_command.e"),
				path (test_dir + "/__copy/command/geant_exec_command.e"))
		end

end
