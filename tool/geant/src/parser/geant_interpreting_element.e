note

	description:

		"Geant interpreting elements"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002-2008, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_INTERPRETING_ELEMENT

inherit

	GEANT_ELEMENT
		rename
			make as element_make
		redefine
			attribute_value,
			attribute_value_or_default,
			content
		end

create

	make

feature {NONE} -- Initialization

	make (a_project: GEANT_PROJECT; a_xml_element: XM_ELEMENT)
			-- Initialize element by setting `project' to `a_project'
			-- and `xml_element' to 'a_xml_element'.
		require
			a_project_not_void: a_project /= Void
			a_xml_element_not_void: a_xml_element /= Void
			valid_xml_element: valid_xml_element (a_xml_element)
		do
			element_make (a_xml_element)
			set_project (a_project)
			if project.position_table /= Void then
				if project.position_table.has (xml_element) then
					position := project.position_table.item (xml_element)
				else
					project.trace_debug (<<"  [*GEANT_INTERPRETING_ELEMENT] position Void for element '", xml_element.name, "'">>)
				end
			else
				project.trace_debug (<<"  [*GEANT_INTERPRETING_ELEMENT] project.position_table is Void">>)
			end
		ensure
			project_set: project = a_project
			xml_element_set: xml_element = a_xml_element
		end

feature -- Access

	project: GEANT_PROJECT
			-- Project to which Current belongs to
			-- TODO: move this to GEANT_ELEMENT

feature -- Status report

	is_enabled: BOOLEAN
			-- Do conditions enable this `a_element'?
			-- conditions is the boolean expression
			-- "(xml attribute 'if') and not
			-- (xml attribute 'unless')"
			-- if xml attribute 'if' is missing it is assumed to be `True'
			-- if xml attribute 'unless' is missing it is assumed to be `False'
		local
			if_condition: BOOLEAN
			unless_condition: BOOLEAN
			a_string: STRING
		do
				-- TODO: improve efficiency:
			Project_variables_resolver.set_variables (project.variables)

				-- Set default execution conditions:
			if_condition := True
			unless_condition := False
				-- Look for an 'if' XML attribute
			if has_attribute (If_attribute_name) then
				a_string := xml_element.attribute_by_name (If_attribute_name).value
				if_condition := Project_variables_resolver.boolean_condition_value (a_string)
				project.trace_debug (<<" if: '", a_string, "': ", if_condition.out>>)
			end
				-- Look for an 'unless' XML attribute
			if has_attribute (Unless_attribute_name) then
				a_string := xml_element.attribute_by_name (Unless_attribute_name).value
				unless_condition := Project_variables_resolver.boolean_condition_value (a_string)

				project.trace_debug (<<" unless: '", a_string, "'=", unless_condition.out>>)
			end
			Result := if_condition and not unless_condition
		end

feature -- Setting

	set_project (a_project: like project)
			-- Set `project' to `a_project'.
		require
			a_project_not_void: a_project /= Void
		do
			project := a_project
		ensure
			project_set: project = a_project
		end

feature -- Access/XML attribute and content values

	attribute_value (an_attr_name: STRING): STRING
			-- Value of attribue `an_attr_name'
		local
			a_string_interpreter: GEANT_STRING_INTERPRETER
			a_attribute: XM_ATTRIBUTE
		do
			a_attribute := xml_element.attribute_by_name (an_attr_name)
			if a_attribute /= Void then
				Result := a_attribute.value
				if Result /= Void and then Result.count > 0 then
					create a_string_interpreter.make
						-- Resolve possible variables:
					Project_variables_resolver.set_variables (project.variables)
					a_string_interpreter.set_variable_resolver (Project_variables_resolver)
					Result := a_string_interpreter.interpreted_string (Result)
				end
			end
		end

	attribute_value_or_default (an_attr_name: STRING; a_default_value: STRING): STRING
			-- Value of attribue `an_attr_name',
			-- or `a_default_value' of no such attribute
		do
			if xml_element.has_attribute_by_name (an_attr_name) then
				Result := attribute_value (an_attr_name)
			else
				Result := a_default_value
			end
		end

	content: STRING
			-- Content of element if any; Void otherwise
		local
			a_string_interpreter: GEANT_STRING_INTERPRETER
		do
			Result := xml_element.text
			if Result /= Void then
				if  not Result.is_empty then
					create a_string_interpreter.make
						-- Resolve possible variables:
					Project_variables_resolver.set_variables (project.variables)
					a_string_interpreter.set_variable_resolver (Project_variables_resolver)
					Result := a_string_interpreter.interpreted_string (Result)
				end
			end
		end

feature {NONE} -- Constants

	Dir_attribute_name: STRING
			-- "dir" attribute name
		once
			Result := "dir"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	If_attribute_name: STRING
			-- "if" attribute name
		once
			Result := "if"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Unless_attribute_name: STRING
			-- "unless" attribute name
		once
			Result := "unless"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

invariant

	project_not_void: project /= Void

end
