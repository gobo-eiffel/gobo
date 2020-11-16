note

	description:

		"Eiffel tools test cases"

	copyright: "Copyright (c) 2019-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class EIFFEL_TOOL_TEST_CASE

inherit

	TOOL_TEST_CASE

feature -- Test

	run_validation
			-- Run Eiffel validation suite with `program_name'.
		local
			l_program_full_filename: STRING
		do
			l_program_full_filename := file_system.pathname (file_system.current_working_directory, program_name + file_system.exe_extension)
			assert_execute ("gecop --tool=" + program_name + " --tool-executable=" + l_program_full_filename + output_log)
			assert_expected_validation_results
		end

	assert_expected_validation_results
			-- Assert that the Eiffel validation suite produced
			-- the same results as the last recorded results.
		local
			l_file: KL_TEXT_INPUT_FILE
			l_string: STRING
			l_tag: STRING
			l_message: STRING
		do
			create l_file.make (output_log_filename)
			l_file.open_read
			if l_file.is_open_read then
				create l_string.make (4096)
				from
					l_file.read_string (4096)
				until
					l_file.end_of_file
				loop
					l_string.append_string (l_file.last_string)
					l_file.read_string (4096)
				end
				l_file.close
				l_tag := "expected_results"
				if not l_string.has_substring ("No Diff since last run") then
					create l_message.make (1024)
					l_message.append_string (l_tag)
					l_message.append_string ("%N   expected: output containing 'No Diff since last run'")
					l_message.append_string ("%N   but  got:%N")
					l_message.append_string (l_string)
					logger.report_failure (l_tag, l_message)
					assertions.report_error (l_message)
				else
					logger.report_success (l_tag)
				end
			else
				assert ("cannot_read_output_log", False)
			end
		end

end
