indexing

	description:

		"Move tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
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
			if has_attribute (File_attribute_name) then
				a_value := attribute_value (File_attribute_name)
				if a_value.count > 0 then
					command.set_file (a_value)
				end
			end
			if has_attribute (To_file_attribute_name) then
				a_value := attribute_value (To_file_attribute_name)
				if a_value.count > 0 then
					command.set_to_file (a_value)
				end
			end
			if has_attribute (To_directory_attribute_name) then
				a_value := attribute_value (To_directory_attribute_name)
				if a_value.count > 0 then
					command.set_to_directory (a_value)
				end
			end
			a_xml_subelement := xml_element.element_by_name (Fileset_element_name)
			if a_xml_subelement /= Void then
				create a_fs_element.make (project, a_xml_subelement)
				command.set_fileset (a_fs_element.fileset)
			end
		end

feature -- Access

	command: GEANT_MOVE_COMMAND
			-- Move commands

feature {NONE} -- Constants

	File_attribute_name: STRING is
			-- Name of xml attribute file.
		once
			Result := "file"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	To_file_attribute_name: STRING is
			-- Name of xml attribute to_file.
		once
			Result := "to_file"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end
		
	To_directory_attribute_name: STRING is
			-- Name of xml attribute to_directory.
		once
			Result := "to_directory"
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
