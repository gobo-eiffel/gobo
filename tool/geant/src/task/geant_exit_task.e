note

	description:

		"Exit tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "MIT License"

class GEANT_EXIT_TASK

inherit

	GEANT_TASK
		redefine
			make,
			build_command,
			command
		end

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT)
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			Precursor {GEANT_TASK} (a_project, an_xml_element)

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

	build_command (a_project: GEANT_PROJECT)
			-- Create instance of `command'
		do
			create command.make (a_project)
		end

feature -- Access

	command: GEANT_EXIT_COMMAND
			-- Exit commands

feature {NONE} -- Constants

	Code_attribute_name: STRING
			-- Name of xml attribute code.
		once
			Result := "code"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
