note

	description:

		"Directoryset Elements"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_DIRECTORYSET_ELEMENT

inherit

	GEANT_INTERPRETING_ELEMENT
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT) is
			-- Create new directoryset element with information held in `a_xml_element'.
		local
			a_value: STRING
			a_elements: DS_LINKED_LIST [XM_ELEMENT]
			cs: DS_LINKED_LIST_CURSOR [XM_ELEMENT]
				-- 'misuse' of GEANT_DEFINE_ELEMENT for 'include' and 'exclude' subelements:
			a_element: GEANT_DEFINE_ELEMENT
		do
			precursor (a_project, a_xml_element)
			create directoryset.make (project)
			if has_attribute (Directory_attribute_name) then
				a_value := attribute_value (Directory_attribute_name)
				if a_value.count > 0 then
					directoryset.set_directory_name (a_value)
				end
			end
			if has_attribute (Include_attribute_name) then
				a_value := attribute_value (Include_attribute_name)
				if a_value.count > 0 then
					directoryset.set_include_wc_string (a_value)
				end
			end
			if has_attribute (Exclude_attribute_name) then
				a_value := attribute_value (Exclude_attribute_name)
				if a_value.count > 0 then
					directoryset.set_exclude_wc_string (a_value)
				end
			end

			if has_attribute (Concat_attribute_name) then
				directoryset.set_concat (boolean_value (Concat_attribute_name))
			end
				-- Add 'include' elements to directoryset:
			a_elements := elements_by_name (Include_element_name)
			cs := a_elements.new_cursor
			from cs.start until cs.after loop
				create a_element.make (project, cs.item)
				if a_element.is_enabled and then a_element.has_name and then a_element.name.count > 0 then
					directoryset.add_single_include (a_element.name)
				end
				cs.forth
			end
				-- Remove 'exclude' elements from directoryset:
			a_elements := elements_by_name (Exclude_element_name)
			cs := a_elements.new_cursor
			from cs.start until cs.after loop
				create a_element.make (project, cs.item)
				if a_element.is_enabled and then a_element.has_name and then a_element.name.count > 0 then
					directoryset.add_single_exclude (a_element.name)
				end
				cs.forth
			end
		end

feature -- Access

	directoryset: GEANT_DIRECTORYSET
			-- Directoryset executing definitions of current directoryset element

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

end
