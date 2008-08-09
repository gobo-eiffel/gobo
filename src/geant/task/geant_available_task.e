indexing

	description:

		"Available tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002-2008, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_AVAILABLE_TASK

inherit

	GEANT_TASK
		redefine
			make_from_interpreting_element,
			build_command,
			command
		end

	GEANT_SHARED_PROPERTIES

create

	make_from_interpreting_element

feature {NONE} -- Initialization

	make_from_interpreting_element (a_ie: GEANT_INTERPRETING_ELEMENT) is
			-- Create new task with information held in `a_ie'.
		do
			Precursor {GEANT_TASK} (a_ie)
			command.resource_name.set_string_value_agent (agent a_ie.attribute_value ("resource"))
			command.variable_name.set_string_value_agent (agent a_ie.attribute_value ("variable"))
			command.true_value.set_string_value_agent (agent a_ie.attribute_value_if_existing ("true_value"))
			command.false_value.set_string_value_agent (agent a_ie.attribute_value_if_existing ("false_value"))
		end

	build_command (a_project: GEANT_PROJECT) is
			-- Create instance of `command'
		do
			create command.make (a_project)
		end

feature -- Access

	command: GEANT_AVAILABLE_COMMAND
			-- Available command

end
