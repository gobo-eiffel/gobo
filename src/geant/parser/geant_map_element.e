indexing

	description:

		"Map Element"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_MAP_ELEMENT

inherit

	GEANT_ELEMENT
		redefine
			make
		end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; a_xml_element: GEANT_XML_ELEMENT) is
			-- Create new fileset element with information held in `a_xml_element'.
		local
			a_value: STRING
		do
			precursor (a_project, a_xml_element)
			!! map.make (project)

			if has_uc_attribute (Type_attribute_name) then
				a_value := uc_attribute_value (Type_attribute_name).out
				if a_value.count > 0 then
					map.set_type (a_value)
				end
			end

			if has_uc_attribute (From_attribute_name) then
				a_value := uc_attribute_value (From_attribute_name).out
				if a_value.count > 0 then
					map.set_source_pattern (a_value)
				end
			end

			if has_uc_attribute (To_attribute_name) then
				a_value := uc_attribute_value (To_attribute_name).out
				if a_value.count > 0 then
					map.set_target_pattern (a_value)
				end
			end

		end

feature -- Access

	map: GEANT_MAP
		-- Map executing mappings for filenames

feature {NONE} -- Constants

	Type_attribute_name: UC_STRING is
			-- Name of xml attribute for type
		once
			Result := new_unicode_string ("type")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	From_attribute_name: UC_STRING is
			-- Name of xml attribute for from
		once
			Result := new_unicode_string ("from")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

	To_attribute_name: UC_STRING is
			-- Name of xml attribute for to
		once
			Result := new_unicode_string ("to")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: Result.count > 0
		end

end -- class GEANT_MAP_ELEMENT

