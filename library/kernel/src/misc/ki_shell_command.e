note

	description:

		"Interface for shell commands"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KI_SHELL_COMMAND

feature {NONE} -- Initialization

	make (a_command: like command)
			-- Create a new shell command.
		require
			a_command_not_void: a_command /= Void
			a_command_not_empty: a_command.count > 0
		deferred
		ensure
			command_set: command = a_command
		end

feature -- Access

	command: READABLE_STRING_GENERAL
			-- Command to be executed from the shell
		deferred
		end

feature -- Status report

	exit_code: INTEGER
			-- Exit status code of the last execution of `command';
			-- Its meaning depends on the value of `is_user_code'
			-- and `is_system_code'.
		deferred
		end

	is_user_code: BOOLEAN
			-- Has `exit_code' been set at the end of
			-- a normal execution of `command'?
		do
			Result := not is_system_code
		ensure
			definition: Result = not is_system_code
		end

	is_system_code: BOOLEAN
			-- Has `exit_code' been set by the system because of
			-- an abnormal termination of `command' or because
			-- it could not be launched correctly?
		deferred
		end

feature -- Execution

	execute
			-- Ask operating system to execute `command'. Wait until
			-- termination. Make exit status available in `exit_code',
			-- `is_user_code' and `is_system_code'.
			-- (Note that under Windows 95/98 the exit status code
			-- returned is always 0 when `is_user_code' is true.)
		deferred
		end

invariant

	command_not_void: command /= Void
	command_not_empty: command.count > 0

end
