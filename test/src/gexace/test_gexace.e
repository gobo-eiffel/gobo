indexing

	description:

		"Test 'gexace'"

	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TEST_GEXACE

inherit

	TOOL_TEST_CASE

feature -- Access

	tool: STRING is "gexace"
			-- Tool name

feature -- Test

	test_gexace is
			-- Test 'gexace'.
		local
			gexace_exe: STRING
			xace_filename: STRING
			ace_filename: STRING
		do
			compile_tool
			gexace_exe := tool_exe
				-- Test <option name="recursive" value="true"/>
			xace_filename := file_system.pathname (sample_dirname, "system1.xace")
			ace_filename := file_system.pathname (sample_dirname, "ise1.ace")
			assert_execute (gexace_exe + " --system=ise " + xace_filename + output_log)
			assert_equal ("no_output_log1", 0, file_system.file_count (output_log_filename))
			assert_equal ("no_error_log1", 0, file_system.file_count (error_log_filename))
			assert_files_equal ("diff1", ace_filename, "ise.ace")
		end

feature {NONE} -- Implementation

	sample_dirname: STRING is
			-- Name of directory where sample files are located
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "src", "gexace", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			sample_dirname_not_void: Result /= Void
			sample_dirname_not_empty: Result.count > 0
		end

end
