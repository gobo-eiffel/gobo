indexing

	description:

		"Delete tasks"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_DELETE_TASK

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

	make (a_project: GEANT_PROJECT; a_xml_element: GEANT_XML_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
			a_xml_subelement: GEANT_XML_ELEMENT
			a_fs_element: GEANT_FILESET_ELEMENT
		do
			!! command.make (a_project)
			task_make (command, a_xml_element)
			if has_uc_attribute (Directory_attribute_name) then
				a_value := attribute_value (Directory_attribute_name.out)
				if a_value.count > 0 then
					command.set_directory (a_value.out)
				end
			end

			if has_uc_attribute (File_attribute_name) then
				a_value := attribute_value (File_attribute_name.out)
				if a_value.count > 0 then
					command.set_file (a_value.out)
				end
			end

			a_xml_subelement := xml_element.child_by_name (Fileset_element_name)
			if a_xml_subelement /= Void then
				!! a_fs_element.make (project, a_xml_subelement)
				command.set_fileset (a_fs_element.fileset)
			end

		end

feature -- Access

	command: GEANT_DELETE_COMMAND
			-- Delete commands

feature {NONE} -- Constants

	Directory_attribute_name: UC_STRING is
			-- Name of xml attribute directory.
		once
			!! Result.make_from_string ("directory")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	File_attribute_name: UC_STRING is
			-- Name of xml attribute file.
		once
			!! Result.make_from_string ("file")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Fileset_element_name: UC_STRING is
			-- Name of xml subelement for fileset
		once
			!! Result.make_from_string ("fileset")
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: not Result.empty
		end

end -- class GEANT_DELETE_TASK
