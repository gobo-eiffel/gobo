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

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

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

feature -- Execution

	execute is
			-- Execute command.
		require
			is_executable: is_executable
		deferred
		end

feature -- Output

	log (a_msg: STRING) is
			-- Write `a_msg' to standard output.
		require
			a_msg_not_void: a_msg /= Void
		do
			print (a_msg)
		end

feature {NONE} -- Implementation

	execute_shell (a_command: STRING) is
			-- Execute shell command `a_command'.
		require
			a_command_not_void: a_command /= Void
			a_command_not_empty: a_command.count > 0
		local
			shell_command: UT_SHELL_COMMAND
		do
			!! shell_command.make (a_command)
			shell_command.execute
		end

end -- class GEANT_COMMAND
