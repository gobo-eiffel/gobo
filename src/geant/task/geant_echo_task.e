note

	description:

		"Echo tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2008, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_ECHO_TASK

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
			command.message_property.set_string_value_agent (agent a_ie.attribute_or_content_value ("message"))
			command.to_file_property.set_string_value_agent (agent a_ie.attribute_value_if_existing ("to_file"))
			command.append_property.set_string_value_agent (agent a_ie.attribute_value_if_existing ("append"))
		end

	build_command (a_project: GEANT_PROJECT) is
			-- Create instance of `command'
		do
			create command.make (a_project)
		end

feature -- Access

	command: GEANT_ECHO_COMMAND
			-- Echo commands

end
