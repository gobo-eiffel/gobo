note

	description:

		"Shell commands"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_SHELL_COMMAND

inherit

	KI_SHELL_COMMAND

	EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_OPERATING_SYSTEM
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_command: like command)
			-- Create a new shell command.
		do
			command := a_command
		end

feature -- Access

	command: READABLE_STRING_GENERAL
			-- Command to be executed from the shell

feature -- Status report

	exit_code: INTEGER
			-- Exit status code of the last execution of `command';
			-- Its meaning depends on the value of `is_user_code'
			-- and `is_system_code'.

	is_system_code: BOOLEAN
			-- Has `exit_code' been set by the system because of
			-- an abnormal termination of `command' or because
			-- it could not be launched correctly?

feature -- Execution

	execute
			-- Ask operating system to execute `command'. Wait until
			-- termination. Make exit status available in `exit_code',
			-- `is_user_code' and `is_system_code'.
			-- (Note that under Windows 95/98 the exit status code
			-- returned is always 0 when `is_user_code' is true.).
		local
			retried: BOOLEAN
		do
			if not retried then
				system (command)
				exit_code := return_code
				if operating_system.is_windows then
					is_system_code := False
				else
						-- Under Linux, system codes are stored on the first
						-- 8 bits, and user codes on the higher bits.
					if (exit_code \\ 256) = 0 then
						exit_code := exit_code // 256
						is_system_code := False
					else
						exit_code := exit_code \\ 256
						is_system_code := True
					end
				end
			else
				exit_code := -1
				is_system_code := True
			end
		rescue
			if not retried then
				retried := True
				retry
			end
		end

end
