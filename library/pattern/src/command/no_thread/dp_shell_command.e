note

	description:

		"Shell commands"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2001-2024, Eric Bezault and others"
	license: "MIT License"

class DP_SHELL_COMMAND

inherit

	DP_COMMAND

	KL_SHELL_COMMAND

create

	make

feature -- Status report

	is_timeout_supported: BOOLEAN
			-- Is execution with timeout supported?
		do
			Result := False
		end

feature -- Execution

	execute_with_timeout (a_timeout_ms: NATURAL_64): BOOLEAN
			-- Execute current command.
			-- Wait for the command to terminate for at most `a_timeout_ms' milliseconds.
			-- True if the command terminates within `a_timeout_ms', False otherwise.
		require
			is_executable: is_executable
			is_timeout_supported: is_timeout_supported
		do
			execute
			Result := True
		end

end
