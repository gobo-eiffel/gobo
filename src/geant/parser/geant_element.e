indexing

	description:

		"Geant elements"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_ELEMENT

inherit

	ANY

	UC_UNICODE_FACTORY
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; a_xml_element: GEANT_XML_ELEMENT) is
			-- Initialize element by setting `project' to `a_project'
			-- and `xml_element' to 'a_xml_element'.
		require
			a_project_not_void: a_project /= Void
			a_xml_element_not_void: a_xml_element /= Void
			valid_xml_element: valid_xml_element (a_xml_element)
		do
			set_project (a_project)
			set_xml_element (a_xml_element)
		ensure
			project_set: project = a_project
			xml_element_set: xml_element = a_xml_element
		end

feature -- Access

	project: GEANT_PROJECT
			-- Project to which Current belongs to

	xml_element: GEANT_XML_ELEMENT
			-- XML Element defining current element

	description: STRING is
			-- Description for current element
		require
			has_description: has_description
		local
			children: DS_ARRAYED_LIST [GEANT_XML_ELEMENT]
		do
			children := xml_element.children
			Result := children.item (1).content.out
		ensure
			description_not_void: Result /= Void
		end

feature -- Status report

	is_enabled: BOOLEAN is
			-- Do conditions enable this `a_element'?
			-- conditions is the boolean expression
			-- "(xml attribute 'if') and not
			-- (xml attribute 'unless')"
			-- if xml attribute 'if' is missing it is assumed to be `True'
			-- if xml attribute 'unless' is missing it is assumed to be `False'
		local
			if_condition: BOOLEAN
			unless_condition: BOOLEAN
			ucs: UC_STRING
		do
				-- Set default execution conditions:
			if_condition := true
			unless_condition := false

				-- Look for an 'if' XML attribute
			if has_uc_attribute (If_attribute_name) then
				ucs := xml_element.attribute_value_by_name (If_attribute_name)
				if_condition := project.variables.boolean_condition_value (ucs.out)
				project.trace_debug (" if: '" + ucs.out + "': " + if_condition.out + "%N")
			end

				-- Look for an 'unless' XML attribute
			if has_uc_attribute (Unless_attribute_name) then
				ucs := xml_element.attribute_value_by_name (Unless_attribute_name)
				unless_condition := project.variables.boolean_condition_value (ucs.out)
				project.trace_debug (" unless: '" + ucs.out + "'=" + unless_condition.out + "%N")
			end

			Result := if_condition and not unless_condition
		end

	has_description: BOOLEAN is
			-- Does `xml_element' has a subelement named 'description'?
		local
			children: DS_ARRAYED_LIST [GEANT_XML_ELEMENT]
			an_element: GEANT_XML_ELEMENT
		do
			children := xml_element.children
			if children.count > 0 then
				an_element := children.item (1)
				Result := an_element.name.is_equal (Description_element_name)
			end
		end

	valid_xml_element (an_xml_element: like xml_element): BOOLEAN is
			-- Is `an_xml_element' a valid xml element?
		require
			an_xml_element_not_void: an_xml_element /= Void
		do
			Result := True
		end

feature -- Setting

	set_project (a_project: like project) is
			-- Set `project' to `a_project'.
		require
			a_project_not_void: a_project /= Void
		do
			project := a_project
		ensure
			project_set: project = a_project
		end

	set_xml_element (a_xml_element: like xml_element) is
			-- Set `xml_element' to `a_xml_element'.
		require
			a_xml_element_not_void: a_xml_element /= Void
			valid_xml_element: valid_xml_element (a_xml_element)
		do
			xml_element := a_xml_element
		ensure
			xml_element_set: xml_element = a_xml_element
		end

feature -- Access/XML attribute values

	attribute_value_or_default (an_attr_name: STRING; a_default_value: STRING): STRING is
			-- Value of attribue `an_attr_name',
			-- or `a_default_value' of no such attribute
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
			a_default_value_not_void: a_default_value /= Void
		local
			uc_name: UC_STRING
			uc_value: UC_STRING
		do
			uc_name := new_unicode_string (an_attr_name)
			uc_value := new_unicode_string (a_default_value)
			Result := uc_attribute_value_or_default (uc_name, uc_value).out
		end

	attribute_value (an_attr_name: STRING): STRING is
			-- Value of attribue `an_attr_name'
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
			has_attribute: has_attribute (an_attr_name)
		local
			uc_name: UC_STRING
			s: STRING
		do
			uc_name := new_unicode_string (an_attr_name)
			s := xml_element.attribute_value_by_name (uc_name).out
			Result := project.variables.interpreted_string (s)
		end

	boolean_value_or_default (an_attr_name: STRING; a_default_value: BOOLEAN): BOOLEAN is
			-- Value of attribue `an_attr_name',
			-- or `a_default_value' of no such attribute
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
		local
			uc_name: UC_STRING
		do
			uc_name := new_unicode_string (an_attr_name)
			Result := uc_boolean_value_or_default (uc_name, a_default_value)
		end

	boolean_value (an_attr_name: STRING): BOOLEAN is
			-- Value of attribue `an_attr_name'
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
			has_attribute: has_attribute (an_attr_name)
		local
			uc_name: UC_STRING
		do
			uc_name := new_unicode_string (an_attr_name)
			Result := uc_boolean_value (uc_name)
		end

	has_attribute (an_attr_name: STRING): BOOLEAN is
			-- Is `an_attr_name' an atttribute of Current element?
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
		local
			uc_name: UC_STRING
		do
			uc_name := new_unicode_string (an_attr_name)
			Result := has_uc_attribute (uc_name)
		end

feature -- Access/XML attribute values (unicode)

	uc_attribute_value_or_default (an_attr_name: UC_STRING; a_default_value: UC_STRING): UC_STRING is
			-- Value of attribue `an_attr_name',
			-- or `a_default_value' of no such attribute
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
			a_default_value_not_void: a_default_value /= Void
		local
			s: STRING
		do
			if xml_element.has_attribute (an_attr_name) then
				s := project.variables.interpreted_string (
					xml_element.attribute_value_by_name (an_attr_name).out)
				Result := new_unicode_string (s)
			else
				Result := a_default_value
			end
		ensure
			value_not_void: Result /= Void
		end

	uc_attribute_value (an_attr_name: UC_STRING): UC_STRING is
			-- Value of attribue `an_attr_name'
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
			has_attribute: has_uc_attribute (an_attr_name)
		local
			s: STRING
		do
			s := project.variables.interpreted_string (
				xml_element.attribute_value_by_name (an_attr_name).out)
			Result := new_unicode_string (s)
		ensure
			value_not_void: Result /= Void
		end

	uc_boolean_value_or_default (an_attr_name: UC_STRING; a_default_value: BOOLEAN): BOOLEAN is
			-- Value of attribue `an_attr_name',
			-- or `a_default_value' of no such attribute
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
		do
			if xml_element.has_attribute (an_attr_name) then
				Result := uc_boolean_value (an_attr_name)
			else
				Result := a_default_value
			end
		end

	uc_boolean_value (an_attr_name: UC_STRING): BOOLEAN is
			-- Value of attribue `an_attr_name'
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
			has_attribute: has_uc_attribute (an_attr_name)
		local
			uc_value: UC_STRING
		do
			uc_value := uc_attribute_value (an_attr_name)
			if True_attribute_value.is_equal (uc_value) then
				Result := True
			elseif False_attribute_value.is_equal (uc_value) then
				Result := False
			else
				print ("WARNING: wrong value '" + uc_value.out + "' for attribute '" + an_attr_name.out + "'. Valid values are `true' and `false'. Using `false'.%N")
				Result := False
			end
		end

	has_uc_attribute (an_attr_name: UC_STRING): BOOLEAN is
			-- Is `an_attr_name' an atttribute of Current element?
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
		do
			Result := xml_element.has_attribute (an_attr_name)
		end

feature {NONE} -- Constants

	Dir_attribute_name: UC_STRING is
			-- "dir" attribute name
		once
			Result := new_unicode_string ("dir")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	If_attribute_name: UC_STRING is
			-- "if" attribute name
		once
			Result := new_unicode_string ("if")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Unless_attribute_name: UC_STRING is
			-- "unless" attribute name
		once
			Result := new_unicode_string ("unless")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	True_attribute_value: UC_STRING is
			-- "true" attribute value
		once
			Result := new_unicode_string ("true")
		ensure
			attribute_value_not_void: Result /= Void
		end

	False_attribute_value: UC_STRING is
			-- "false" attribute value
		once
			Result := new_unicode_string ("false")
		ensure
			attribute_value_not_void: Result /= Void
		end

	Description_element_name: UC_STRING is
			-- "description" element name
		once
			Result := new_unicode_string ("description")
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

invariant

	project_not_void: project /= Void
	xml_element_not_void: xml_element /= Void
	valid_xml_element: valid_xml_element (xml_element)

end
