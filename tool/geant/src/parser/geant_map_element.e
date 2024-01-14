note

	description:

		"Map Elements"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"

class GEANT_MAP_ELEMENT

inherit

	GEANT_INTERPRETING_ELEMENT
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT)
			-- Create new fileset element with information held in `a_xml_element'.
		local
			a_value: STRING
			a_xml_subelement: XM_ELEMENT
			a_map_element: GEANT_MAP_ELEMENT
		do
			precursor (a_project, a_xml_element)
			create map.make (project)

			if has_attribute (Type_attribute_name) then
				a_value := attribute_value (Type_attribute_name)
				if a_value.count > 0 then
					map.set_type (a_value)
				end
			end
			if has_attribute (From_attribute_name) then
				a_value := attribute_value (From_attribute_name)
				if a_value.count > 0 then
					map.set_source_pattern (a_value)
				end
			end
			if has_attribute (To_attribute_name) then
				a_value := attribute_value (To_attribute_name)
				if a_value.count > 0 then
					map.set_target_pattern (a_value)
				end
			end
			a_xml_subelement := xml_element.element_by_name (Map_element_name)
			if a_xml_subelement /= Void then
				create a_map_element.make (project, a_xml_subelement)
				map.set_map (a_map_element.map)
			end
		end

feature -- Access

	map: GEANT_MAP
			-- Map executing mappings for filenames

feature {NONE} -- Constants

	Type_attribute_name: STRING
			-- Name of xml attribute for type
		once
			Result := "type"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	From_attribute_name: STRING
			-- Name of xml attribute for from
		once
			Result := "from"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	To_attribute_name: STRING
			-- Name of xml attribute for to
		once
			Result := "to"
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	Map_element_name: STRING
			-- Name of xml subelement for map
		once
			Result := "map"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

end
