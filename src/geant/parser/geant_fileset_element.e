indexing

	description:

		"Fileset Elements"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_FILESET_ELEMENT

inherit

	GEANT_INTERPRETING_ELEMENT
		redefine
			make
		end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT) is
			-- Create new fileset element with information held in `a_xml_element'.
			-- Create `fileset' using parameter `a_convert_to_filesystem'.
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
			!! fileset.make (project)

			if has_attribute (Directory_attribute_name) then
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
				fileset.set_concat (boolean_value (Concat_attribute_name))
			end

				-- add 'include' elements to fileset:
			a_elements := elements_by_name (Include_element_name)
			from
				cs := a_elements.new_cursor
				cs.start
			until
				cs.off
			loop
				create a_element.make (project, cs.item)
				if a_element.is_enabled and then a_element.has_name and then
					a_element.name.count > 0 then
					fileset.add_single_include (a_element.name)
				end
				cs.forth
			end

				-- remove 'exclude' elements from fileset:
			a_elements := elements_by_name (Exclude_element_name)
			from
				cs := a_elements.new_cursor
				cs.start
			until
				cs.off
			loop
				create a_element.make (project, cs.item)
				if a_element.is_enabled and then a_element.has_name and then
					a_element.name.count > 0 then
					fileset.add_single_exclude (a_element.name)
				end
				cs.forth
			end

			a_xml_subelement := xml_element.element_by_name (Map_element_name)
			if a_xml_subelement /= Void then
				!! a_map_element.make (project, a_xml_subelement)
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
