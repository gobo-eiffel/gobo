indexing

	description:

		"Exec tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_EXEC_TASK

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
			-- Create a new task with information held in `a_ie'.
		local
			a_xml_subelement: XM_ELEMENT
			a_fs_element: GEANT_FILESET_ELEMENT
		do
			Precursor {GEANT_TASK} (a_ie)
			command.command_line.set_string_value_agent (agent a_ie.attribute_value ("executable"))
			command.exit_code_variable_name.set_string_value_agent (agent a_ie.attribute_value_if_existing ("exit_code_variable"))
			command.accept_errors.set_string_value_agent (agent a_ie.attribute_value_if_existing ("accept_errors"))

			a_xml_subelement := xml_element.element_by_name (Fileset_element_name)
			if a_xml_subelement /= Void then
				create a_fs_element.make (project, a_xml_subelement)
 				command.set_fileset (a_fs_element.fileset)
			end
		end

	build_command (a_project: GEANT_PROJECT) is
			-- Create instance of `command'
		do
			create command.make (a_project)
		end

feature -- Access

	command: GEANT_EXEC_COMMAND
			-- Exec commands

feature {NONE} -- Constants

	Fileset_element_name: STRING is
			-- Name of xml subelement for fileset
		once
			Result := "fileset"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

end
