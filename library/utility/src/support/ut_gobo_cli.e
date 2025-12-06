note

	description:

		"Command-line interface (CLI) helper routines for Gobo tools"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class UT_GOBO_CLI

inherit

	ANY

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

feature -- Access

	thread_count_from_cli_value (a_cli_value: detachable INTEGER_REF): INTEGER
			-- Number of threads to be used by the tool
		local
			l_cpu_count: INTEGER
			l_user_defined: BOOLEAN
		do
			l_cpu_count := {EXECUTION_ENVIRONMENT}.available_cpu_count.as_integer_32
			l_user_defined := True
			if attached Execution_environment.variable_value (gobo_cli_thread_variable_name) as l_variable_value and then not l_variable_value.is_integer then
				Result := l_variable_value.to_integer
			elseif attached a_cli_value as l_cli_value then
				Result := l_cli_value.item
			elseif attached Execution_environment.variable_value (gobo_default_thread_variable_name) as l_variable_value and then l_variable_value.is_integer then
				Result := l_variable_value.to_integer
			else
				Result := l_cpu_count - 3
				l_user_defined := False
			end
			if l_user_defined and Result <= 0 then
				Result := l_cpu_count + Result
			end
			if Result < 1 or not {PLATFORM}.is_thread_capable then
				Result := 1
			end
		ensure
			thread_count_not_negative: Result >= 1
		end

feature {NONE} -- Environment variables

	gobo_cli_thread_variable_name: STRING = "GOBO_CLI_THREAD"
			-- Environment variable name to specify thread count
			-- as if it were specified with the command-line
			-- argument '--thread'.

	gobo_default_thread_variable_name: STRING = "GOBO_DEFAULT_THREAD"
			-- Environment variable name to specify thread count
			-- which are not overridden with the command-line
			-- argument '--thread'.

end
