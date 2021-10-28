note

	description:

		"Cat tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_CAT_TASK

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

	make_from_interpreting_element (a_ie: GEANT_INTERPRETING_ELEMENT)
			-- Create new task with information held in `a_ie'.
		do
			Precursor {GEANT_TASK} (a_ie)
			command.file_property.set_string_value_agent (agent a_ie.attribute_or_content_value ("file"))
			command.to_file_property.set_string_value_agent (agent a_ie.attribute_value_if_existing ("to_file"))
			command.append_property.set_string_value_agent (agent a_ie.attribute_value_if_existing ("append"))
		end

	build_command (a_project: GEANT_PROJECT)
			-- Create instance of `command'
		do
			create command.make (a_project)
		end

feature -- Access

	command: GEANT_CAT_COMMAND
			-- Cat commands

end
