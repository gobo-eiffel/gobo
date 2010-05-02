note

	description:

		"Delete tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_DELETE_TASK

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

	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT)
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
			a_xml_subelement: XM_ELEMENT
			a_fs_element: GEANT_FILESET_ELEMENT
			a_directoryset_element: GEANT_DIRECTORYSET_ELEMENT
		do
			Precursor {GEANT_TASK} (a_project, a_xml_element)

			if has_attribute (Directory_attribute_name) then
				a_value := attribute_value (Directory_attribute_name)
				if a_value.count > 0 then
					command.set_directory (a_value)
				end
			end
			if has_attribute (File_attribute_name) then
				a_value := attribute_value (File_attribute_name)
				if a_value.count > 0 then
					command.set_file (a_value)
				end
			end
			a_xml_subelement := xml_element.element_by_name (Fileset_element_name)
			if a_xml_subelement /= Void then
				create a_fs_element.make (project, a_xml_subelement)
				command.set_fileset (a_fs_element.fileset)
			end
			a_xml_subelement := xml_element.element_by_name (Directoryset_element_name)
			if a_xml_subelement /= Void then
				create a_directoryset_element.make (project, a_xml_subelement)
				command.set_directoryset (a_directoryset_element.directoryset)
			end
		end

	build_command (a_project: GEANT_PROJECT)
			-- Create instance of `command'
		do
			create command.make (a_project)
		end

feature -- Access

	command: GEANT_DELETE_COMMAND
			-- Delete commands

feature {NONE} -- Constants

	Directory_attribute_name: STRING
			-- Name of xml attribute directory.
		once
			Result := "directory"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	File_attribute_name: STRING
			-- Name of xml attribute file.
		once
			Result := "file"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Fileset_element_name: STRING
			-- Name of xml subelement for fileset
		once
			Result := "fileset"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

	Directoryset_element_name: STRING
			-- Name of xml subelement for directoryset
		once
			Result := "directoryset"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

end
