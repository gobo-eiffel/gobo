note

	description:

		"Test 'concat1' example"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TS_ETEST_CONCAT1

inherit

	EXAMPLE_TEST_CASE

create

	make_default

feature -- Access

	program_name: STRING is "concat1"
			-- Program name

	library_name: STRING is "test"
			-- Library name of example

feature -- Test

	test_concat1 is
			-- Test 'concat1' example.
		local
			a_debug: STRING
			a_geant_filename: STRING
		do
				-- Run example.
			if variables.has ("debug") then
				a_debug := "debug_"
			else
				a_debug := ""
			end
			a_geant_filename := geant_filename
			assert_not_exit_code_execute ("geant -b " + a_geant_filename + " test_" + a_debug + eiffel_compiler.vendor + " " + output_log, 0)
				-- Check result.
			file_system.concat_files (output_log_filename, error_log_filename)
			file_system.delete_file (expected_output)
			file_system.concat_files (expected_output, expected_output1)
			file_system.concat_files (expected_output, expected_output2)
			file_system.concat_files (expected_output, expected_output3)
			if file_system.same_text_files (expected_output, output_log_filename) then
				assert ("output", True)
			else
					-- Free version of ISE Eiffel?
				file_system.delete_file (expected_output)
				file_system.concat_files (expected_output, expected_output1)
				file_system.concat_files (expected_output, expected_output2)
				file_system.concat_files (expected_output, freeise_log_filename)
				file_system.concat_files (expected_output, expected_output3)
				if file_system.same_text_files (expected_output, output_log_filename) then
					assert ("freeise_output1", True)
				else
					file_system.delete_file (expected_output)
					file_system.concat_files (expected_output, expected_output1)
					file_system.concat_files (expected_output, freeise_log_filename)
					file_system.concat_files (expected_output, expected_output2)
					file_system.concat_files (expected_output, freeise_log_filename)
					file_system.concat_files (expected_output, expected_output3)
					if file_system.same_text_files (expected_output, output_log_filename) then
						assert ("freeise_output2", True)
					else
						file_system.delete_file (expected_output)
						file_system.concat_files (expected_output, freeise_log_filename)
						file_system.concat_files (expected_output, expected_output1)
						file_system.concat_files (expected_output, freeise_log_filename)
						file_system.concat_files (expected_output, expected_output2)
						file_system.concat_files (expected_output, freeise_log_filename)
						file_system.concat_files (expected_output, expected_output3)
						if file_system.same_text_files (expected_output, output_log_filename) then
							assert ("freeise_output3", True)
						else
								-- Exception raised by Gobo Eiffel?
							file_system.delete_file (expected_output)
							file_system.concat_files (expected_output, expected_output1)
							file_system.concat_files (expected_output, expected_output2)
							file_system.concat_files (expected_output, geeraise_log_filename)
							file_system.concat_files (expected_output, expected_output3)
							if file_system.same_text_files (expected_output, output_log_filename) then
								assert ("geeraise_output1", True)
							else
								file_system.delete_file (expected_output)
								file_system.concat_files (expected_output, expected_output1)
								file_system.concat_files (expected_output, expected_output2)
								file_system.concat_files (expected_output, expected_output3)
								assert_files_equal ("output2", expected_output, output_log_filename)
							end
						end
					end
				end
			end
				-- Clean.
			assert_execute ("geant -b " + a_geant_filename + " clean" + output_log)
		end

feature {NONE} -- Implementation

	expected_output: STRING is "output2.log"
			-- Name of file containing expected output

	expected_output1: STRING is
			-- Name of file containing first part expected output
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "example", "test", "data", "concat1a.log">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			expected_output1_not_void: Result /= Void
			expected_output1_not_empty: Result.count > 0
		end

	expected_output2: STRING is
			-- Name of file containing second part of expected output
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "example", "test", "data", "concat1b.log">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			expected_output2_not_void: Result /= Void
			expected_output2_not_empty: Result.count > 0
		end

	expected_output3: STRING is
			-- Name of file containing third part of expected output
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "example", "test", "data", "concat1c.log">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			expected_output3_not_void: Result /= Void
			expected_output3_not_empty: Result.count > 0
		end

end
