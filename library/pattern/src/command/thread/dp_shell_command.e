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
			Result := True
		end

feature -- Execution

	execute_with_timeout (a_timeout_ms: NATURAL_64): BOOLEAN
			-- Execute current command.
			-- Wait for the command to terminate for at most `a_timeout_ms' milliseconds.
			-- True if the command terminates within `a_timeout_ms', False otherwise.
		local
			l_thread: WORKER_THREAD
		do
			exit_code := -1
			create l_thread.make (agent execute)
			l_thread.launch
			Result := l_thread.join_with_timeout (a_timeout_ms)
		end

end
