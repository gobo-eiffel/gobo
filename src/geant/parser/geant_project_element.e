indexing

	description:

		"Project Element"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_PROJECT_ELEMENT

inherit

	GEANT_ELEMENT

creation

	make

feature -- Access

	has_name: BOOLEAN is
			-- Does `xml_element' has an attribute named `Name_attribute_name'
		do
			Result := has_uc_attribute (Name_attribute_name)
		end

	has_default_target_name: BOOLEAN is
			-- Does `xml_element' has an attribute named `Default_attribute_name'
		do
			Result := has_uc_attribute (Default_attribute_name)
		end

	has_parent: BOOLEAN is
			-- Does `xml_element' has an attribute named `Inherit_attribute_name'
		do
			Result := has_uc_attribute (Inherit_attribute_name)
		end

	name: STRING is
			-- Value of xml attribute named `Name_attribute_name' of `xml_element'
		require
			has_name: has_name
		do
			Result := uc_attribute_value (Name_attribute_name).out
		ensure
			name_not_void: Result /= Void
		end

	default_target_name: STRING is
			-- Value of xml attribute named `Default_attribute_name' of `xml_element'
		require
			has_default_target_name: has_default_target_name
		do
			Result := uc_attribute_value (Default_attribute_name).out
			project.trace_debug ("*** default target: " + Result + "%N")
		ensure
			default_not_void: Result /= Void
		end

	parent: STRING is
			-- Value of xml attribute named `Inherit_attribute_name' of `xml_element'
		require
			has_name: has_name
		do
			Result := uc_attribute_value (Inherit_attribute_name).out
		ensure
			parent_not_void: Result /= Void
		end

	xml_target_elements: DS_ARRAYED_LIST [GEANT_XML_ELEMENT] is
			-- XML Child elements named 'target'
		do
			Result := xml_element.children_by_name (Target_element_name)
		ensure
			xm_target_elements_not_void: Result /= Void
			no_void_xm_target_element: not Result.has (Void)
		end

feature {NONE} -- Constants

	Name_attribute_name: UC_STRING is
			-- "name" attribute name
		once
			Result := new_unicode_string ("name")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Default_attribute_name: UC_STRING is
			-- "default" attribute name
		once
			Result := new_unicode_string ("default")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Inherit_attribute_name: UC_STRING is
			-- "inherit" attribute name
		once
			Result := new_unicode_string ("inherit")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Project_element_name: UC_STRING is
			-- "project" element name
		once
			Result := new_unicode_string ("project")
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

	Target_element_name: UC_STRING is
			-- "target" element name
		once
			Result := new_unicode_string ("target")
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

end -- class GEANT_PROJECT_ELEMENT
