indexing

	description:

		"Exit tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_EXIT_TASK

inherit

	GEANT_TASK
		rename
			make as task_make
		redefine
			command
		end

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			create command.make (a_project)
			task_make (command, an_xml_element)
			if has_attribute (Code_attribute_name) then
				a_value := attribute_value (Code_attribute_name)
				if not a_value.is_integer then
					a_project.log (<<"  [exit] warning: code '", a_value, "' is not a valid integer value. Using value '1' instead.">>)
					command.set_code (1)
				else
					command.set_code (a_value.to_integer)
				end
			end
		end

feature -- Access

	command: GEANT_EXIT_COMMAND
			-- Exit commands

feature {NONE} -- Constants

	Code_attribute_name: STRING is
			-- Name of xml attribute code.
		once
			Result := "code"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
