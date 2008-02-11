indexing

	description:

		"Out of date tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_OUTOFDATE_TASK

inherit

	GEANT_TASK
		redefine
			make,
			build_command,
			command
		end

	GEANT_SHARED_PROPERTIES

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
			a_xml_subelement: XM_ELEMENT
			a_fs_element: GEANT_FILESET_ELEMENT
		do
			Precursor {GEANT_TASK} (a_project, a_xml_element)

			if has_attribute (Source_attribute_name) then
				a_value := attribute_value (Source_attribute_name)
				if a_value.count > 0 then
					command.set_source_filename (a_value)
				end
			end
			if has_attribute (Target_attribute_name) then
				a_value := attribute_value (Target_attribute_name)
				if a_value.count > 0 then
					command.set_target_filename (a_value)
				end
			end
			command.set_true_value ("true")
			if has_attribute (True_value_attribute_name) then
				a_value := attribute_value (True_value_attribute_name)
				if a_value.count > 0 then
					command.set_true_value (a_value)
				end
			end
			command.set_false_value ("false")
			if has_attribute (False_value_attribute_name) then
				a_value := attribute_value (False_value_attribute_name)
				if a_value.count > 0 then
					command.set_false_value (a_value)
				end
			end
			if has_attribute (Variable_attribute_name) then
				a_value := attribute_value (Variable_attribute_name)
				if a_value.count > 0 then
					command.set_variable_name (a_value)
				end
			end
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

	command: GEANT_OUTOFDATE_COMMAND
			-- Out of date commands

feature {NONE} -- Constants

	Source_attribute_name: STRING is
			-- Name of xml attribute for source
		once
			Result := "source"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Target_attribute_name: STRING is
			-- Name of xml attribute for target
		once
			Result := "target"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Variable_attribute_name: STRING is
			-- Name of xml attribute for variable
		once
			Result := "variable"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	True_value_attribute_name: STRING is
			-- Name of xml attribute for true_value
		once
			Result := "true_value"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	False_value_attribute_name: STRING is
			-- Name of xml attribute for false_value
		once
			Result := "false_value"
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
