indexing

	description:

		"Setenv tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_SETENV_TASK

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
				-- name:
			if has_uc_attribute (Name_attribute_name) then
				a_value := uc_attribute_value (Name_attribute_name).out
				if a_value.count > 0 then
					command.set_name (a_value)
				end
			end
				-- value:
			if has_uc_attribute (Value_attribute_name) then
				a_value := uc_attribute_value (Value_attribute_name).out
				command.set_value (a_value)
			end
		end

feature -- Access

	command: GEANT_SETENV_COMMAND
			-- Setenv commands

feature {NONE} -- Constants

	Name_attribute_name: UC_STRING is
			-- "name" attribute name
		once
			Result := new_unicode_string ("name")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Value_attribute_name: UC_STRING is
			-- Name of xml attribute for value
		once
			Result := new_unicode_string ("value")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end -- class GEANT_SETENV_TASK
