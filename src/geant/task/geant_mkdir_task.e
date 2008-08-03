indexing

	description:

		"Mkdir tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_MKDIR_TASK

inherit

	GEANT_TASK
		redefine
			make_from_interpreting_element,
			build_command,
			command
		end

create

	make_from_interpreting_element

feature {NONE} -- Initialization

	make_from_interpreting_element (a_ie: GEANT_INTERPRETING_ELEMENT) is
			-- Create new task with information held in `a_ie'.
		do
			Precursor {GEANT_TASK} (a_ie)
			command.directory.set_string_value_agent (agent a_ie.attribute_value ("directory"))
		end

	build_command (a_project: GEANT_PROJECT) is
			-- Create instance of `command'
		do
			create command.make (a_project)
		end

feature -- Access

	command: GEANT_MKDIR_COMMAND
			-- Mkdir commands

end
