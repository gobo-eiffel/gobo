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
		rename
			make as task_make
		redefine
			command
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
			a_xml_subelement: XM_ELEMENT
			a_fs_element: GEANT_FILESET_ELEMENT
		do
			create command.make (a_project)
			task_make (command, an_xml_element)
			if has_attribute (Executable_attribute_name) then
				a_value := attribute_value (Executable_attribute_name)
				if a_value.count > 0 then
					command.set_command_line (a_value)
				end
			end
			if has_attribute (Exit_code_variable_attribute_name) then
				a_value := attribute_value (Exit_code_variable_attribute_name)
				if a_value.count > 0 then
					command.set_exit_code_variable_name (a_value)
				end
			end
			if has_attribute (Accept_errors_attribute_name) then
				command.set_accept_errors (boolean_value (Accept_errors_attribute_name))
			end
			a_xml_subelement := xml_element.element_by_name (Fileset_element_name)
			if a_xml_subelement /= Void then
				create a_fs_element.make (project, a_xml_subelement)
				command.set_fileset (a_fs_element.fileset)
			end
		end

feature -- Access

	command: GEANT_EXEC_COMMAND
			-- Exec commands

feature {NONE} -- Constants

	Executable_attribute_name: STRING is
			-- Name of xml attribute executable.
		once
			Result := "executable"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Accept_errors_attribute_name: STRING is
			-- Name of xml attribute accept_errors.
		once
			Result := "accept_errors"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Exit_code_variable_attribute_name: STRING is
			-- Name of xml attribute exit_code_variable.
		once
			Result := "exit_code_variable"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Fileset_element_name: STRING is
			-- Name of xml subelement for fileset
		once
			Result := "fileset"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

end
