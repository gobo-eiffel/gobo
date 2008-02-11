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
			make,
			build_command,
			command
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			Precursor {GEANT_TASK} (a_project, an_xml_element)

			if has_attribute (Directory_attribute_name) then
				a_value := attribute_value (Directory_attribute_name)
				if a_value.count > 0 then
					command.set_directory (a_value)
				end
			end
		end

	build_command (a_project: GEANT_PROJECT) is
			-- Create instance of `command'
		do
			create command.make (a_project)
		end

feature -- Access

	command: GEANT_MKDIR_COMMAND
			-- Mkdir commands

feature {NONE} -- Constants

	Directory_attribute_name: STRING is
			-- Name of xml attribute directory.
		once
			Result := "directory"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end
