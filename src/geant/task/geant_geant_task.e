indexing

	description:

		"Geant tasks"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEANT_GEANT_TASK

inherit

	GEANT_TASK
		rename
			make as task_make
		redefine
			command
		end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; an_xml_element: GEANT_XML_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			!! command.make (a_project)
			task_make (command, an_xml_element)
				-- filename:
			if has_uc_attribute (Filename_attribute_name) then
				a_value := attribute_value (Filename_attribute_name.out)
				if a_value.count > 0 then
					command.set_filename (a_value.out)
				end
			end
				-- start target:
			if has_uc_attribute (Start_target_attribute_name) then
				a_value := attribute_value (Start_target_attribute_name.out)
				if a_value.count > 0 then
					command.set_start_target_name (a_value.out)
				end
			end
				-- reuse_variables:
			if has_uc_attribute (Reuse_variables_attribute_name) then
				command.set_reuse_variables (uc_boolean_value(Reuse_variables_attribute_name))
			end
		end

feature -- Access

	command: GEANT_GEANT_COMMAND
			-- Getest commands

feature {NONE} -- Constants

	Filename_attribute_name: UC_STRING is
			-- Name of xml attribute filename.
		once
			Result := new_unicode_string ("file")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Start_target_attribute_name: UC_STRING is
			-- Name of xml attribute Start_target.
		once
			Result := new_unicode_string ("target")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Reuse_variables_attribute_name: UC_STRING is
			-- Name of xml attribute reuse_variables.
		once
			Result := new_unicode_string ("reuse_variables")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end -- class GEANT_GEANT_TASK
