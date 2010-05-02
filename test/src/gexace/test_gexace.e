note

	description:

		"Test 'gexace'"

	copyright: "Copyright (c) 2001-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_GEXACE

inherit

	TOOL_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING = "gexace"
			-- Program name

feature -- Test

	test_gexace
			-- Test 'gexace'.
		local
			gexace_exe: STRING
			xace_filename: STRING
			ace_filename: STRING
			ecf_filename: STRING
		do
			compile_program
			gexace_exe := program_exe
				--
				-- Test <option name="recursive" value="true"/>
				-- and <option name="read_only" value="true"/>.
				--
			xace_filename := file_system.pathname (sample_dirname, "system1.xace")
			ace_filename := file_system.pathname (sample_dirname, "ise1.ace")
			assert_execute (gexace_exe + " --system=ise --format=ace " + xace_filename + output_log)
			if file_system.file_count (output_log_filename) = 0 then
				assert ("no_output_log1a", True)
			elseif file_system.same_text_files (freeise_log_filename, output_log_filename) then
					-- Free version of ISE Eiffel?
				assert ("freeise_no_output_log1a", True)
			else
				assert_integers_equal ("no_output_log1b", 0, file_system.file_count (output_log_filename))
			end
			assert_integers_equal ("no_error_log1a", 0, file_system.file_count (error_log_filename))
			assert_files_equal ("diff1a", ace_filename, "ise.ace")
				--
				-- Test <option name="assertion" value="generate"/>.
				--
			xace_filename := file_system.pathname (sample_dirname, "system2.xace")
				-- Generate Xace file.
			ace_filename := file_system.pathname (sample_dirname, "ge2.xace")
			assert_execute (gexace_exe + " --system=ge " + xace_filename + output_log)
			if file_system.file_count (output_log_filename) = 0 then
				assert ("no_output_log2a", True)
			elseif file_system.same_text_files (freeise_log_filename, output_log_filename) then
					-- Free version of ISE Eiffel?
				assert ("freeise_no_output_log2a", True)
			else
				assert_integers_equal ("no_output_log2b", 0, file_system.file_count (output_log_filename))
			end
			assert_integers_equal ("no_error_log2a", 0, file_system.file_count (error_log_filename))
			assert_files_equal ("diff2a", ace_filename, "ge.xace")
				--
				-- Test <option name="override_cluster" value="..."/>.
				--
			xace_filename := file_system.pathname (sample_dirname, "system3.xace")
				-- Generate ECF file.
			ecf_filename := file_system.pathname (sample_dirname, "ise3.ecf")
			assert_execute (gexace_exe + " --system=ise --format=ecf " + xace_filename + output_log)
			if file_system.file_count (output_log_filename) = 0 then
				assert ("no_output_log3a", True)
			elseif file_system.same_text_files (freeise_log_filename, output_log_filename) then
					-- Free version of ISE Eiffel?
				assert ("freeise_no_output_log3a", True)
			else
				assert_integers_equal ("no_output_log3b", 0, file_system.file_count (output_log_filename))
			end
			assert_integers_equal ("no_error_log3a", 0, file_system.file_count (error_log_filename))
			assert_files_equal ("diff3a", ecf_filename, "ise.ecf")
		end

feature {NONE} -- Implementation

	sample_dirname: STRING
			-- Name of directory where sample files are located
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "src", "gexace", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			sample_dirname_not_void: Result /= Void
			sample_dirname_not_empty: Result.count > 0
		end

end
