indexing

	description:

		"Interface for shell commands"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class KI_SHELL_COMMAND

feature {NONE} -- Initialization

	make (a_command: like command) is
			-- Create a new shell command.
		require
			a_command_not_void: a_command /= Void
			a_command_not_empty: a_command.count > 0
		deferred
		ensure
			command_set: command = a_command
		end

feature -- Access

	command: STRING is
			-- Command to be executed from the shell
		deferred
		end

	exit_code: INTEGER is
			-- Exit status code of the last execution
			-- of `command' in shell
		deferred
		end

feature -- Execution

	execute is
			-- Ask operating system to execute `command'.
			-- Wait until termination. Make exit status
			-- code available in `exit_code' (Note that
			-- under Windows 95/98 the exit status code
			-- returned is always 0).
		deferred
		end

invariant

	command_not_void: command /= Void
	command_not_empty: command.count > 0

end -- class KI_SHELL_COMMAND
