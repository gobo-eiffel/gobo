indexing

	description:

		"Gepp tasks"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_GEPP_TASK

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
			-- Create a new task with information held in `an_xml_element'.
		local
			a_value: STRING
			a_bool: BOOLEAN
			define_elements: DS_LINKED_LIST [XM_ELEMENT]
			cs: DS_LINKED_LIST_CURSOR [XM_ELEMENT]
			define_element: GEANT_DEFINE_ELEMENT
			a_xml_subelement: XM_ELEMENT
			a_fs_element: GEANT_FILESET_ELEMENT
		do
			create command.make (a_project)
			task_make (command, an_xml_element)
			if has_attribute (Input_filename_attribute_name) then
				a_value := attribute_value (Input_filename_attribute_name)
				if a_value.count > 0 then
					command.set_input_filename (a_value)
				end
			end
			if has_attribute (Output_filename_attribute_name) then
				a_value := attribute_value (Output_filename_attribute_name)
				if a_value.count > 0 then
					command.set_output_filename (a_value)
				end
			end
			if has_attribute (Lines_attribute_name) then
				a_bool := boolean_value (Lines_attribute_name)
				command.set_empty_lines (a_bool)
			end

			define_elements := elements_by_name (Define_element_name)
			cs := define_elements.new_cursor
			from cs.start until cs.after loop
				create define_element.make (project, cs.item)
				if
					define_element.is_enabled and then
					define_element.has_name and then
					define_element.name.count > 0
				then
					command.defines.force_last (define_element.name)
				end
				cs.forth
			end
			if has_attribute (To_directory_attribute_name) then
				a_value := attribute_value (To_directory_attribute_name)
				if a_value.count > 0 then
					command.set_to_directory (a_value)
				end
			end
			if has_attribute (Force_attribute_name) then
				command.set_force (boolean_value (Force_attribute_name))
			end
			a_xml_subelement := xml_element.element_by_name (Fileset_element_name)
			if a_xml_subelement /= Void then
				create a_fs_element.make (project, a_xml_subelement)
				command.set_fileset (a_fs_element.fileset)
			end
		end

feature -- Access

	command: GEANT_GEPP_COMMAND
			-- Gepp commands

feature {NONE} -- Constants

	Input_filename_attribute_name: STRING is
			-- Name of xml attribute for input_filename
		once
			Result := "input"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Output_filename_attribute_name: STRING is
			-- Name of xml attribute for output_filename
		once
			Result := "output"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Lines_attribute_name: STRING is
			-- Name of xml attribute for lines
		once
			Result := "lines"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Define_element_name: STRING is
			-- Name of xml subelement for defines
		once
			Result := "define"
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

	Force_attribute_name: STRING is
			-- Name of xml attribute for force
		once
			Result := "force"
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
