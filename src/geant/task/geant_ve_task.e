indexing

	description:

		"Compilation tasks for Visual Eiffel"

	library:    "Gobo Eiffel Ant"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_VE_TASK

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
				-- ESD:
			if has_uc_attribute (Esd_attribute_name) then
				a_value := attribute_value_or_default (Esd_attribute_name.out, "")
				if a_value.count > 0 then
					command.set_esd_filename (a_value)
				end
			end
				-- clean:
			if has_uc_attribute (Clean_attribute_name) then
				a_value := attribute_value_or_default (Clean_attribute_name.out, "")
				if a_value.count > 0 then
					command.set_clean (a_value)
				end
					-- recursive:
				if has_uc_attribute (Recursive_attribute_name) then
					command.set_recursive_clean (uc_boolean_value (Recursive_attribute_name))
				end
			end
		end

feature -- Access

	command: GEANT_VE_COMMAND
			-- Compilation commands for Visual Eiffel

feature {NONE} -- Constants

	Esd_attribute_name: UC_STRING is
			-- Name of xml attribute for "esd"
		once
			!! Result.make_from_string ("esd")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Clean_attribute_name: UC_STRING is
			-- Name of xml attribute for "clean"
		once
			!! Result.make_from_string ("clean")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Recursive_attribute_name: UC_STRING is
			-- Name of xml attribute for "recursive"
		once
			!! Result.make_from_string ("recursive")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

end -- class GEANT_VE_TASK
