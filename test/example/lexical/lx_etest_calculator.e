indexing

	description:

		"Test 'calculator' example"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class LX_ETEST_CALCULATOR

inherit

	EXAMPLE_TEST_CASE

feature -- Access

	program_name: STRING is "calculator"
			-- Program name

	library_name: STRING is "lexical"
			-- Library name of example

feature -- Test

	test_calculator is
			-- Test 'calculator' example.
		do
			if eiffel_compiler.is_hact then
				if file_system.directory_exists (yacc_cluster) then
					compile_program
				end
			end
		end

feature {NONE} -- Implementation

	yacc_cluster: STRING is
			-- Name of directory where HACT yacc classes are located
		once
			Result := file_system.nested_pathname ("${ISS_BASE}", <<"library", "yacc">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			yacc_cluster_not_void: Result /= Void
			yacc_cluster_not_empty: Result.count > 0
		end

end
