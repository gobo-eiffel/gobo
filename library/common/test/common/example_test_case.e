﻿note

	description:

		"Example test cases"

	copyright: "Copyright (c) 2001-2016, Eric Bezault and others"
	license: "MIT License"

deferred class EXAMPLE_TEST_CASE

inherit

	PROGRAM_TEST_CASE

feature -- Access

	library_name: STRING
			-- Library name of example
		deferred
		ensure
			library_name_not_void: Result /= Void
			library_name_not_empty: Result.count > 0
		end

feature {NONE} -- Implementation

	program_dirname: STRING
			-- Name of program source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"library", library_name, "example", program_name>>)
			Result := Execution_environment.interpreted_string (Result)
		end

end
