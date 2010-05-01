note

	description:

		"Fileset Elements"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_FILESET_ELEMENT

inherit

	GEANT_INTERPRETING_ELEMENT
		redefine
			make
		end

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT) is
			-- Create new fileset element with information held in `a_xml_element'.
		local
			a_value: STRING
			a_xml_subelement: XM_ELEMENT
			a_map_element: GEANT_MAP_ELEMENT
			a_elements: DS_LINKED_LIST [XM_ELEMENT]
			cs: DS_LINKED_LIST_CURSOR [XM_ELEMENT]
				-- 'misuse' of GEANT_DEFINE_ELEMENT for 'include' and 'exclude' subelements:
			a_element: GEANT_DEFINE_ELEMENT
		do
			precursor (a_project, a_xml_element)
				-- Exit geant in case of conflicting task formats:
			if (has_attribute (Concat_attribute_name) or else has_attribute (Directory_attribute_name))
				and then (has_attribute (Filename_directory_attribute_name) or else
				has_attribute (Mapped_filename_directory_attribute_name)) then
				exit_application (1, <<"%NLOAD ERROR in project '", project.name, "%':%N",
					"  Remove obsolete format of element 'fileset'.",
					" Use new format of element 'fileset' as described in the documentation.">>)
			end
				-- Assign attribute/element values to `fileset':
			create fileset.make (project)
			if has_attribute (Dir_attribute_name) then
				a_value := attribute_value (Dir_attribute_name)
				if a_value.count > 0 then
					fileset.set_dir_name (a_value)
				end
			end
			if has_attribute (Directory_attribute_name) then
				project.trace (<<"Project '", project.name,
					"': WARNING: Obsolete attribute '", Directory_attribute_name,
					"' in element 'fileset' found.%N",
					"Use new format of element 'fileset' as described in the documentation.">>)
				a_value := attribute_value (Directory_attribute_name)
				if a_value.count > 0 then
					fileset.set_directory_name (a_value)
				end
			end
			if has_attribute (Include_attribute_name) then
				a_value := attribute_value (Include_attribute_name)
				if a_value.count > 0 then
					fileset.set_include_wc_string (a_value)
				end
			end
			if has_attribute (Exclude_attribute_name) then
				a_value := attribute_value (Exclude_attribute_name)
				if a_value.count > 0 then
					fileset.set_exclude_wc_string (a_value)
				end
			end
			if has_attribute (Force_attribute_name) then
				fileset.set_force (boolean_value (Force_attribute_name))
			end
			if has_attribute (Concat_attribute_name) then
				project.trace (<<"Project '", project.name,
					"': WARNING: Obsolete attribute 'concat' in element 'fileset' found.%N",
					"Use new format of element 'fileset' as described in the documentation.">>)
				fileset.set_concat (boolean_value (Concat_attribute_name))
			end
			if has_attribute (Filename_variable_name_attribute_name) then
				a_value := attribute_value (Filename_variable_name_attribute_name)
				if a_value.count > 0 then
					fileset.set_filename_variable_name (a_value)
				end
			end
			if has_attribute (Mapped_filename_variable_name_attribute_name) then
				a_value := attribute_value (Mapped_filename_variable_name_attribute_name)
				if a_value.count > 0 then
					fileset.set_mapped_filename_variable_name (a_value)
				end
			end
			if has_attribute (Filename_directory_attribute_name) then
				a_value := attribute_value (Filename_directory_attribute_name)
				if a_value.count > 0 then
					fileset.set_filename_directory_name (a_value)
				end
			end
			if has_attribute (Mapped_filename_directory_attribute_name) then
				a_value := attribute_value (Mapped_filename_directory_attribute_name)
				if a_value.count > 0 then
					fileset.set_mapped_filename_directory_name (a_value)
				end
			end
			if has_attribute (Convert_attribute_name) then
				a_value := attribute_value (Convert_attribute_name)
				fileset.set_convert_to_filesystem (boolean_value (Convert_attribute_name))
			end

				-- Add 'include' elements to fileset:
			a_elements := elements_by_name (Include_element_name)
			cs := a_elements.new_cursor
			from cs.start until cs.after loop
				create a_element.make (project, cs.item)
				if a_element.is_enabled and then a_element.has_name and then a_element.name.count > 0 then
					fileset.add_single_include (a_element.name)
				end
				cs.forth
			end
				-- Remove 'exclude' elements from fileset:
			a_elements := elements_by_name (Exclude_element_name)
			cs := a_elements.new_cursor
			from cs.start until cs.after loop
				create a_element.make (project, cs.item)
				if a_element.is_enabled and then a_element.has_name and then a_element.name.count > 0 then
					fileset.add_single_exclude (a_element.name)
				end
				cs.forth
			end
			a_xml_subelement := xml_element.element_by_name (Map_element_name)
			if a_xml_subelement /= Void then
				create a_map_element.make (project, a_xml_subelement)
				fileset.set_map (a_map_element.map)
			end
		end

feature -- Access

	fileset: GEANT_FILESET
			-- Fileset executing definitions of current fileset element

feature {NONE} -- Constants

	Directory_attribute_name: STRING is
			-- Name of xml attribute for directory
		once
			Result := "directory"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Include_attribute_name: STRING is
			-- Name of xml attribute for include
		once
			Result := "include"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Exclude_attribute_name: STRING is
			-- Name of xml attribute for exclude
		once
			Result := "exclude"
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

	Concat_attribute_name: STRING is
			-- Name of xml attribute for concat
		once
			Result := "concat"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Filename_variable_name_attribute_name: STRING is
			-- Name of xml attribute for filename_variable_name
		once
			Result := "filename_variable"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Mapped_filename_variable_name_attribute_name: STRING is
			-- Name of xml attribute for mapped_filename_variable_name
		once
			Result := "mapped_filename_variable"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Filename_directory_attribute_name: STRING is
			-- Name of xml attribute for filename_directory
		once
			Result := "filename_directory"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Convert_attribute_name: STRING is
			-- Name of xml attribute for convert
		once
			Result := "convert"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Mapped_filename_directory_attribute_name: STRING is
			-- Name of xml attribute for mapped_filename_directory
		once
			Result := "mapped_filename_directory"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Include_element_name: STRING is
			-- Name of xml subelement for include
		once
			Result := "include"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

	Exclude_element_name: STRING is
			-- Name of xml subelement for exclude
		once
			Result := "exclude"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

	Map_element_name: STRING is
			-- Name of xml subelement for map
		once
			Result := "map"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

end
