note

	description:

		"Geant commands"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2018, Sven Ehrke and others"
	license: "MIT License"

deferred class GEANT_COMMAND

inherit

	DP_COMMAND
		undefine
			is_executable
		end

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT)
			-- Initialize command by setting `project' to `a_project'.
		require
			project_not_void: a_project /= Void
		do
			set_project (a_project)
			create log_validation_messages_agent_cell.make (Void)
		ensure
			project_set: project = a_project
		end

feature -- Status report

	exit_code: INTEGER
			-- Exit code of last execution

	is_exit_command: BOOLEAN
			-- Is current command the exit command?
		do
			Result := False
		end

feature -- Access

	project: GEANT_PROJECT
			-- Project to which this command belongs to

	log_validation_messages_agent_cell: DS_CELL [detachable PROCEDURE]
			-- Agent cell to log validation messages

feature -- Setting

	set_project (a_project: like project)
			-- Set `project' to `a_project'.
		require
			project_not_void: a_project /= Void
		do
			project := a_project
		ensure
			project_set: project = a_project
		end

	set_exit_code (a_exit_code: INTEGER)
			-- Set `exit_code' to `a_exit_code'.
		do
			exit_code := a_exit_code
		ensure
			exit_code_set: exit_code = a_exit_code
		end

feature {NONE} -- Implementation

	validate_condition (a_condition: BOOLEAN; a_message: STRING; a_is_valid: DS_CELL [BOOLEAN])
			-- If `a_is_valid' and then not `a_condition' add `a_message' to `validation_messages' and set `a_is_valid' to False.
		require
			a_message_not_void: a_message /= Void
			a_message_not_empty: not a_message.is_empty
		do
				-- Do not continue with validation if `is_valid' is already False:
			if a_is_valid.item then
				if not a_condition then
					a_is_valid.put (False)
					validation_messages.force_last (a_message)
				end
			end
 		ensure
 			not_executable_if_condition_false: not a_condition implies not a_is_valid.item
 			validation_message_set_if_condition_false: not a_condition implies validation_messages.last = a_message
		end

	execute_shell (a_command: STRING)
			-- Execute shell command `a_command'.
		require
			a_command_not_void: a_command /= Void
			a_command_not_empty: a_command.count > 0
		local
			shell_command: DP_SHELL_COMMAND
		do
			if not project.options.no_exec then
				create shell_command.make (a_command)
				shell_command.execute
				exit_code := shell_command.exit_code
			end
		end

	execute_shell_with_timeout (a_command: STRING; a_timeout_ms: NATURAL_64): BOOLEAN
			-- Execute shell command `a_command'.
			-- Wait for the command to terminate for at most `a_timeout_ms' milliseconds.
			-- True if the command terminates within `a_timeout_ms', False otherwise.
			-- Do not wait and always return True if timeout is not supported.
		require
			a_command_not_void: a_command /= Void
			a_command_not_empty: a_command.count > 0
		local
			shell_command: DP_SHELL_COMMAND
		do
			if not project.options.no_exec then
				create shell_command.make (a_command)
				if shell_command.is_timeout_supported then
					Result := shell_command.execute_with_timeout (a_timeout_ms)
				else
					shell_command.execute
					Result := True
				end
				if Result then
					exit_code := shell_command.exit_code
				else
					exit_code := 1
				end
			end
		end

invariant

	project_not_void: project /= Void

end
