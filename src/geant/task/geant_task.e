indexing

	description:

		"Geant Tasks using a XML definitions"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


deferred class GEANT_TASK

inherit

	GEANT_COMMAND
	GEANT_ELEMENT_NAMES
		export {NONE} all end

feature {NONE} -- Initialization

	make_from_element (a_project: GEANT_PROJECT; an_element: GEANT_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		require
			an_element_not_void: an_element /= Void
		do
			make (a_project)
			element := an_element
		end

feature -- Status report

	is_enabled: BOOLEAN is
			-- Do conditions allow to execute task?
			-- conditions is boolean of the expression
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
			if element.has_attribute (If_attribute_name) then
				ucs := element.attribute_value_by_name (If_attribute_name)
				if_condition := project.variables.boolean_condition_value (ucs.out)
				debug ("geant")
					print (" if    : '" + ucs.out + "'=" + if_condition.out + "%N")
				end
			end

				-- Look for an 'unless' XML attribute
			if element.has_attribute (Unless_attribute_name) then
				ucs := element.attribute_value_by_name (Unless_attribute_name)
				unless_condition := project.variables.boolean_condition_value (ucs.out)
				debug ("geant")
					print (" unless: '" + ucs.out + "'=" + unless_condition.out + "%N")
				end
			end

			Result := if_condition and not unless_condition
		end

feature {NONE} -- Implementation

	attribute_value_or_default (an_element: GEANT_ELEMENT;
		an_attr_name: STRING; a_default_value: STRING): STRING is
			-- Value of attribue `an_attr_name' in element `an_element',
			-- or `a_default_value' of no such attribute
		require
			an_element_not_void: an_element /= Void
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
			a_default_value_not_void: a_default_value /= Void
		local
			uc_name: UC_STRING
			uc_value: UC_STRING
		do
			!! uc_name.make_from_string(an_attr_name)
			!! uc_value.make_from_string(a_default_value)
			Result := uc_attribute_value_or_default (an_element, uc_name, uc_value).out
		end

	attribute_value (an_element: GEANT_ELEMENT; an_attr_name: STRING): STRING is
			-- Value of attribue `an_attr_name' in element `an_element'
		require
			an_element_not_void: an_element /= Void
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
			has_attribute: has_attribute (an_element, an_attr_name)
		local
			uc_name: UC_STRING
			s: STRING
		do
			!! uc_name.make_from_string(an_attr_name)
			s := (an_element.attribute_value_by_name (uc_name)).out
			Result := project.variables.interpreted_string (s)
		end

	boolean_value_or_default (an_element: GEANT_ELEMENT;
		an_attr_name: STRING; a_default_value: BOOLEAN): BOOLEAN is
			-- Value of attribue `an_attr_name' in element `an_element',
			-- or `a_default_value' of no such attribute
		require
			an_element_not_void: an_element /= Void
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
		local
			uc_name: UC_STRING
		do
			!! uc_name.make_from_string (an_attr_name)
			Result := uc_boolean_value_or_default (an_element, uc_name, a_default_value)
		end

	boolean_value (an_element: GEANT_ELEMENT; an_attr_name: STRING): BOOLEAN is
			-- Value of attribue `an_attr_name' in element `an_element'
		require
			an_element_not_void: an_element /= Void
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
			has_attribute: has_attribute (an_element, an_attr_name)
		local
			uc_name: UC_STRING
		do
			!! uc_name.make_from_string (an_attr_name)
			Result := uc_boolean_value (an_element, uc_name)
		end

	has_attribute (an_element: GEANT_ELEMENT; an_attr_name: STRING): BOOLEAN is
			-- Is `an_attr_name' an atttribute of `an_element'?
		require
			an_element_not_void: an_element /= Void
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
		local
			uc_name: UC_STRING
		do
			!! uc_name.make_from_string (an_attr_name)
			Result := has_uc_attribute (an_element, uc_name)
		end

feature {NONE} -- Unicode implementation

	uc_attribute_value_or_default (an_element: GEANT_ELEMENT;
		an_attr_name: UC_STRING; a_default_value: UC_STRING): UC_STRING is
			-- Value of attribue `an_attr_name' in element `an_element',
			-- or `a_default_value' of no such attribute
		require
			an_element_not_void: an_element /= Void
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: not an_attr_name.empty
			a_default_value_not_void: a_default_value /= Void
		local
			s: STRING
		do
			if an_element.has_attribute (an_attr_name) then
				s := project.variables.interpreted_string (
					an_element.attribute_value_by_name (an_attr_name).out)
				!! Result.make_from_string (s)
			else
				Result := a_default_value
			end
		ensure
			value_not_void: Result /= Void
		end

	uc_attribute_value (an_element: GEANT_ELEMENT; an_attr_name: UC_STRING): UC_STRING is
			-- Value of attribue `an_attr_name' in element `an_element'
		require
			an_element_not_void: an_element /= Void
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: not an_attr_name.empty
			has_attribute: has_uc_attribute (an_element, an_attr_name)
		local
			s: STRING
		do
			s := project.variables.interpreted_string (
				an_element.attribute_value_by_name (an_attr_name).out)
			!! Result.make_from_string (s)
		ensure
			value_not_void: Result /= Void
		end

	uc_boolean_value_or_default (an_element: GEANT_ELEMENT;
		an_attr_name: UC_STRING; a_default_value: BOOLEAN): BOOLEAN is
			-- Value of attribue `an_attr_name' in element `an_element',
			-- or `a_default_value' of no such attribute
		require
			an_element_not_void: an_element /= Void
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: not an_attr_name.empty
		do
			if an_element.has_attribute (an_attr_name) then
				Result := uc_boolean_value (an_element, an_attr_name)
			else
				Result := a_default_value
			end
		end

	uc_boolean_value (an_element: GEANT_ELEMENT; an_attr_name: UC_STRING): BOOLEAN is
			-- Value of attribue `an_attr_name' in element `an_element'
		require
			an_element_not_void: an_element /= Void
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: not an_attr_name.empty
			has_attribute: has_uc_attribute (an_element, an_attr_name)
		local
			uc_value: UC_STRING
		do
			uc_value := uc_attribute_value (an_element, an_attr_name)
			if True_attribute_value.is_equal (uc_value) then
				Result := True
			elseif False_attribute_value.is_equal (uc_value) then
				Result := False
			else
				print ("WARNING: wrong value '" + uc_value.out + "' for attribute " + an_attr_name.out + " Valid values are `true' and `false'. Using `false'.%N")
				Result := False
			end
		end

	has_uc_attribute (an_element: GEANT_ELEMENT; an_attr_name: UC_STRING): BOOLEAN is
			-- Is `an_attr_name' an atttribute of `an_element'?
		require
			an_element_not_void: an_element /= Void
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: not an_attr_name.empty
		do
			Result := an_element.has_attribute (an_attr_name)
		end

feature {GEANT_TASK, GEANT_TARGET} -- Constants

	element: GEANT_ELEMENT
		-- XML Element defining this task

	If_attribute_name: UC_STRING is
			-- "if" attribute name
		once
			!! Result.make_from_string ("if")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: not Result.empty
		end

	Unless_attribute_name: UC_STRING is
			-- "unless" attribute name
		once
			!! Result.make_from_string ("unless")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: not Result.empty
		end

	Dir_attribute_name: UC_STRING is
			-- "dir" attribute name
		once
			!! Result.make_from_string ("dir")
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: not Result.empty
		end

end -- class GEANT_TASK
