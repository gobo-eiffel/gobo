indexing

	description:

		"Move tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_MOVE_TASK

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
			if has_uc_attribute (File_attribute_name) then
				a_value := attribute_value (File_attribute_name.out)
				if a_value.count > 0 then
					command.set_file (a_value.out)
				end
			end

			if has_uc_attribute (To_file_attribute_name) then
				a_value := attribute_value (To_file_attribute_name.out)
				if a_value.count > 0 then
					command.set_to_file (a_value.out)
				end
			end

			if has_uc_attribute (To_directory_attribute_name) then
				a_value := attribute_value (To_directory_attribute_name.out)
				if a_value.count > 0 then
					command.set_to_directory (a_value.out)
				end
			end
		end

feature -- Access

	command: GEANT_MOVE_COMMAND
			-- Move commands

feature {NONE} -- Constants

	File_attribute_name: UC_STRING is
			-- Name of xml attribute file.
		once
			Result := new_unicode_string ("file")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	To_file_attribute_name: UC_STRING is
			-- Name of xml attribute to_file.
		once
			Result := new_unicode_string ("to_file")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end
		
	To_directory_attribute_name: UC_STRING is
			-- Name of xml attribute to_directory.
		once
			Result := new_unicode_string ("to_directory")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end -- class GEANT_MOVE_TASK
