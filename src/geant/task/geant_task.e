indexing

	description:

		"Geant Tasks using a XML definitions"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_TASK

inherit

	GEANT_ELEMENT
		rename
			make as element_make
		end

feature {NONE} -- Initialization

	make (a_command: like command; a_xml_element: GEANT_XML_ELEMENT) is
			-- Create new task with information held in `an_element'.
		require
			a_command_not_void: a_command /= Void
			a_xml_element_not_void: a_xml_element /= Void
		do
			set_command (a_command)
			element_make (a_command.project, a_xml_element)
		end

feature -- Access

	command: GEANT_COMMAND
			-- Geant command to perform current task

feature -- Status report

	is_executable: BOOLEAN is
			-- Can task be executed?
		do
			Result := command.is_executable
		end

	exit_code: INTEGER is
			-- Exit code of last execution
		do
			Result := command.exit_code
		end

feature -- Setting

	set_command (a_command: like command) is
			-- Set `command' to `a_command'.
		do
			command := a_command
		ensure
			command_set: command = a_command
		end

feature -- Execution

	execute is
			-- Execute command.
		require
			is_executable: is_executable
		do
			command.execute
		end

end -- class GEANT_TASK
