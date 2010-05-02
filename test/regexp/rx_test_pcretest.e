note

	description:

		"Run 'pcretest'"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class RX_TEST_PCRETEST

inherit

	TS_TEST_CASE
		redefine
			set_up, tear_down
		end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

create

	make_default

feature -- Test

	test_test1
			-- Run first test.
		local
			l_tester: PCRETEST
		do
			create l_tester.make_tester
			l_tester.execute_test (testinput1_filename, "out1", False)
			assert_files_equal ("diff1", testoutput1_filename, "out1")
		end

	test_test2
			-- Run second test.
		local
			l_tester: PCRETEST
		do
			create l_tester.make_tester
			l_tester.execute_test (testinput2_filename, "out2", True)
			assert_files_equal ("diff2", testoutput2_filename, "out2")
		end

	test_test3
			-- Run third test.
		local
			l_tester: PCRETEST
		do
			create l_tester.make_tester
			l_tester.execute_test (testinput3_filename, "out3", False)
			assert_files_equal ("diff3", testoutput3_filename, "out3")
		end

feature -- Execution

	set_up
			-- Setup for a test.
		local
			a_testdir: STRING
		do
			a_testdir := testdir
			-- assert (a_testdir + "_not_exists", not file_system.directory_exists (a_testdir))
			old_cwd := file_system.cwd
			file_system.create_directory (a_testdir)
			assert (a_testdir + "_exists", file_system.directory_exists (a_testdir))
			file_system.cd (a_testdir)
		end

	tear_down
			-- Tear down after a test.
		do
			if old_cwd /= Void then
				file_system.cd (old_cwd)
				-- file_system.recursive_delete_directory (testdir)
				old_cwd := Void
			end
		end

	old_cwd: STRING
			-- Initial current working directory

feature {NONE} -- Implementation

	testdir: STRING = "Tpcretest"
			-- Name of temporary directory where to run the test

feature {NONE} -- Filenames

	data_dirname: STRING
			-- Name of directory containing expected output files
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "regexp", "pcretest", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: Result.count > 0
		end

	testinput1_filename: STRING
			-- Name of first test input file
		once
			Result := file_system.pathname (data_dirname, "testinput1")
		ensure
			testinput1_filename_not_void: Result /= Void
			testinput1_filename_not_empty: Result.count > 0
		end

	testinput2_filename: STRING
			-- Name of second test input file
		once
			Result := file_system.pathname (data_dirname, "testinput2")
		ensure
			testinput2_filename_not_void: Result /= Void
			testinput2_filename_not_empty: Result.count > 0
		end

	testinput3_filename: STRING
			-- Name of third test input file
		once
			Result := file_system.pathname (data_dirname, "testinput3")
		ensure
			testinput3_filename_not_void: Result /= Void
			testinput3_filename_not_empty: Result.count > 0
		end

	testinput4_filename: STRING
			-- Name of forth test input file
		once
			Result := file_system.pathname (data_dirname, "testinput4")
		ensure
			testinput4_filename_not_void: Result /= Void
			testinput4_filename_not_empty: Result.count > 0
		end

	testinput5_filename: STRING
			-- Name of fifth test input file
		once
			Result := file_system.pathname (data_dirname, "testinput5")
		ensure
			testinput5_filename_not_void: Result /= Void
			testinput5_filename_not_empty: Result.count > 0
		end

	testinput6_filename: STRING
			-- Name of sixth test input file
		once
			Result := file_system.pathname (data_dirname, "testinput6")
		ensure
			testinput6_filename_not_void: Result /= Void
			testinput6_filename_not_empty: Result.count > 0
		end

	testoutput1_filename: STRING
			-- Name of first test expected output file
		once
			Result := file_system.pathname (data_dirname, "testoutput1")
		ensure
			testoutput1_filename_not_void: Result /= Void
			testoutput1_filename_not_empty: Result.count > 0
		end

	testoutput2_filename: STRING
			-- Name of second test expected output file
		once
			Result := file_system.pathname (data_dirname, "testoutput2")
		ensure
			testoutput2_filename_not_void: Result /= Void
			testoutput2_filename_not_empty: Result.count > 0
		end

	testoutput3_filename: STRING
			-- Name of third test expected output file
		once
			Result := file_system.pathname (data_dirname, "testoutput3")
		ensure
			testoutput3_filename_not_void: Result /= Void
			testoutput3_filename_not_empty: Result.count > 0
		end

	testoutput4_filename: STRING
			-- Name of forth test expected output file
		once
			Result := file_system.pathname (data_dirname, "testoutput4")
		ensure
			testoutput4_filename_not_void: Result /= Void
			testoutput4_filename_not_empty: Result.count > 0
		end

	testoutput5_filename: STRING
			-- Name of fifth test expected output file
		once
			Result := file_system.pathname (data_dirname, "testoutput5")
		ensure
			testoutput5_filename_not_void: Result /= Void
			testoutput5_filename_not_empty: Result.count > 0
		end

	testoutput6_filename: STRING
			-- Name of sixth test expected output file
		once
			Result := file_system.pathname (data_dirname, "testoutput6")
		ensure
			testoutput6_filename_not_void: Result /= Void
			testoutput6_filename_not_empty: Result.count > 0
		end

end
