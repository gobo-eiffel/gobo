indexing

	description:

		"Geant interpreting elements"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_INTERPRETING_ELEMENT

inherit

	GEANT_ELEMENT
		rename
			make as element_make
		redefine
			attribute_value,
			uc_attribute_value_or_default,
			uc_attribute_value
		end

	UC_UNICODE_FACTORY
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT) is
			-- Initialize element by setting `project' to `a_project'
			-- and `xml_element' to 'a_xml_element'.
		require
			a_project_not_void: a_project /= Void
			a_xml_element_not_void: a_xml_element /= Void
			valid_xml_element: valid_xml_element (a_xml_element)
		do
			element_make (a_xml_element)
			set_project (a_project)
		ensure
			project_set: project = a_project
			xml_element_set: xml_element = a_xml_element
		end

feature -- Access

	project: GEANT_PROJECT
			-- Project to which Current belongs to

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
				ucs := xml_element.attribute_by_name (If_attribute_name).value
				if_condition := project.variables.boolean_condition_value (ucs.out)
				project.trace_debug (" if: '" + ucs.out + "': " + if_condition.out + "%N")
			end

				-- Look for an 'unless' XML attribute
			if has_uc_attribute (Unless_attribute_name) then
				ucs := xml_element.attribute_by_name (Unless_attribute_name).value
				unless_condition := project.variables.boolean_condition_value (ucs.out)
				project.trace_debug (" unless: '" + ucs.out + "'=" + unless_condition.out + "%N")
			end

			Result := if_condition and not unless_condition
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

feature -- Access/XML attribute values

	attribute_value (an_attr_name: STRING): STRING is
			-- Value of attribue `an_attr_name'
		local
			uc_name: UC_STRING
		do
			uc_name := new_unicode_string (an_attr_name)
			Result := xml_element.attribute_by_name (uc_name).value.out
			Result := project.variables.interpreted_string (Result)
		end

feature -- Access/XML attribute values (unicode)

	uc_attribute_value_or_default (an_attr_name: UC_STRING; a_default_value: UC_STRING): UC_STRING is
			-- Value of attribue `an_attr_name',
			-- or `a_default_value' of no such attribute
		local
			s: STRING
		do
			if xml_element.has_attribute_by_name (an_attr_name) then
				s := project.variables.interpreted_string (
					xml_element.attribute_by_name (an_attr_name).value.out)
				Result := new_unicode_string (s)
			else
				Result := a_default_value
			end
		end

	uc_attribute_value (an_attr_name: UC_STRING): UC_STRING is
			-- Value of attribue `an_attr_name'
		local
			s: STRING
		do
			s := xml_element.attribute_by_name (an_attr_name).value.out
			s := project.variables.interpreted_string (s)
			Result := new_unicode_string (s)
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

invariant

	project_not_void: project /= Void

end
