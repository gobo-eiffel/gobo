indexing

	description:

		"Geant commands"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class GEANT_COMMAND

inherit

	ANY
	GEANT_SHARED_PROPERTIES
		export {NONE} all end
	
	KL_SHARED_EXCEPTIONS
		export
			{NONE} all
		end

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT) is
			-- Initialize command by setting `project' to `a_project'.
		require
			project_not_void: a_project /= Void
		do
			set_project (a_project)
		ensure
			project_set: project = a_project
		end

feature -- Status report

	is_executable: BOOLEAN is
			-- Can command be executed?
		deferred
		end

feature -- Access

	project: GEANT_PROJECT
			-- Project to which this target belongs

feature -- Setting

	set_project (a_project: like project) is
			-- Set `project' to `a_project'.
		do
			project := a_project
		ensure
			project_set: project = a_project
		end

feature -- Output

	trace (a_message: STRING) is
			-- Write `a_message' to standard output unless `project.verbose' = False.
		require
			message_not_void: a_message /= Void
		do
			if project.verbose then
				print (a_message)
			end
		end

	log (a_message: STRING) is
			-- Write `a_message' to standard output.
		require
			message_not_void: a_message /= Void
		do
			print (a_message)
		end

feature -- Execution

	execute is
			-- Execute command.
		require
			is_executable: is_executable
		deferred
		end

feature {NONE} -- Implementation

	execute_shell (a_command: STRING) is
			-- Execute shell command `a_command'.
		require
			a_command_not_void: a_command /= Void
			a_command_not_empty: a_command.count > 0
		local
			shell_command: DP_SHELL_COMMAND
		do
			!! shell_command.make (a_command)
			shell_command.execute
			if shell_command.exit_code /= 0 then
				exit_application (shell_command.exit_code, Void)
			end
		end

end -- class GEANT_COMMAND

