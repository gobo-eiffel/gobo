note

	description:

		"Tools test cases"

	copyright: "Copyright (c) 2001-2016, Eric Bezault and others"
	license: "MIT License"

deferred class TOOL_TEST_CASE

inherit

	PROGRAM_TEST_CASE

feature {NONE} -- Implementation

	program_dirname: STRING
			-- Name of program source directory
		do
			Result := file_system.nested_pathname ("${GOBO}", <<"tool", program_name, "src">>)
			Result := Execution_environment.interpreted_string (Result)
		end

end
