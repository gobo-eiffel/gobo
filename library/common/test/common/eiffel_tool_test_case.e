note

	description:

		"Eiffel tools test cases"

	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class EIFFEL_TOOL_TEST_CASE

inherit

	TOOL_TEST_CASE

feature -- Test

	run_validation
			-- Run Eiffel validation suite with `program_name'.
		do
			assert_execute ("gecop --tool=" + program_name + output_log)
			assert_expected_validation_results
		end

	assert_expected_validation_results
			-- Assert that the Eiffel validation suite produced
			-- the same results as the last recorded results.
		local
			l_file: KL_TEXT_INPUT_FILE
			l_string: STRING
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
				assert ("expected_results", l_string.has_substring ("No Diff since last run"))
			else
				assert ("cannot_read_output_log", False)
			end
		end

end
