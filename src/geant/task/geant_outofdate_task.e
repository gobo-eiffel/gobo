indexing

	description:

		"Out of date tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_OUTOFDATE_TASK

inherit

	GEANT_SHARED_PROPERTIES
	GEANT_TASK
		rename
			make as task_make
		redefine
			command
		end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
			a_xml_subelement: XM_ELEMENT
			a_fs_element: GEANT_FILESET_ELEMENT
		do
			!! command.make (a_project)
			task_make (command, a_xml_element)

			if has_uc_attribute (Source_attribute_name) then
				a_value := uc_attribute_value (Source_attribute_name).out
				if a_value.count > 0 then
					command.set_source_filename (a_value)
				end
			end

			if has_uc_attribute (Target_attribute_name) then
				a_value := uc_attribute_value (Target_attribute_name).out
				if a_value.count > 0 then
					command.set_target_filename (a_value)
				end
			end
			command.set_true_value ("true")
			if has_uc_attribute (True_value_attribute_name) then
				a_value := uc_attribute_value (True_value_attribute_name).out
				if a_value.count > 0 then
					command.set_true_value (a_value)
				end
			end

			command.set_false_value ("false")
			if has_uc_attribute (False_value_attribute_name) then
				a_value := uc_attribute_value (False_value_attribute_name).out
				if a_value.count > 0 then
					command.set_false_value (a_value)
				end
			end

			if has_uc_attribute (Variable_attribute_name) then
				a_value := uc_attribute_value (Variable_attribute_name).out
				if a_value.count > 0 then
					command.set_variable_name (a_value)
				end
			end

			a_xml_subelement := xml_element.element_by_name (Fileset_element_name)
			if a_xml_subelement /= Void then
				!! a_fs_element.make (project, a_xml_subelement)
				command.set_fileset (a_fs_element.fileset)
			end

		end

feature -- Access

	command: GEANT_OUTOFDATE_COMMAND
			-- Out of date commands

feature {NONE} -- Constants

	Source_attribute_name: UC_STRING is
			-- Name of xml attribute for source
		once
			Result := new_unicode_string ("source")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Target_attribute_name: UC_STRING is
			-- Name of xml attribute for target
		once
			Result := new_unicode_string ("target")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Variable_attribute_name: UC_STRING is
			-- Name of xml attribute for variable
		once
			Result := new_unicode_string ("variable")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	True_value_attribute_name: UC_STRING is
			-- Name of xml attribute for true_value
		once
			Result := new_unicode_string ("true_value")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	False_value_attribute_name: UC_STRING is
			-- Name of xml attribute for false_value
		once
			Result := new_unicode_string ("false_value")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Fileset_element_name: UC_STRING is
			-- Name of xml subelement for fileset
		once
			Result := new_unicode_string ("fileset")
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

end
