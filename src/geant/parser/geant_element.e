indexing

	description:

		"Geant elements"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_ELEMENT

inherit

	ANY

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end
	
create

	make

feature {NONE} -- Initialization

	make (a_xml_element: like xml_element) is
			-- Initialize element by setting `xml_element' to 'a_xml_element'.
		require
			a_xml_element_not_void: a_xml_element /= Void
			valid_xml_element: valid_xml_element (a_xml_element)
		do
			set_xml_element (a_xml_element)
		ensure
			xml_element_set: xml_element = a_xml_element
		end

feature -- Access

	xml_element: XM_ELEMENT
			-- XML Element defining current element

	elements_by_name (a_name: STRING): DS_LINKED_LIST [XM_ELEMENT] is
			-- Direct children elements with name `a_name'
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			cs: DS_LINKED_LIST_CURSOR [XM_NODE]
			e: XM_ELEMENT
		do
			create Result.make
			cs := xml_element.new_cursor
			from cs.start until cs.after loop
				e ?= cs.item
				if e /= Void and then STRING_.same_string (e.name, a_name) then
					Result.force_last (e)
				end
				cs.forth
			end
		ensure
			result_not_void: Result /= Void
			result_not_empty: xml_element.has_element_by_name (a_name) implies Result.count > 0
		end

feature -- Status report

	valid_xml_element (an_xml_element: like xml_element): BOOLEAN is
			-- Is `an_xml_element' a valid xml element?
		require
			an_xml_element_not_void: an_xml_element /= Void
		do
			Result := True
		end

feature -- Setting

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
		do
			if xml_element.has_attribute_by_name (an_attr_name) then
				Result := xml_element.attribute_by_name (an_attr_name).value
			else
				Result := a_default_value
			end
		ensure
			attribute_value_or_default_not_void: Result /= Void
		end

	attribute_value (an_attr_name: STRING): STRING is
			-- Value of attribue `an_attr_name'
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
			has_attribute: has_attribute (an_attr_name)
		do
			Result := xml_element.attribute_by_name (an_attr_name).value
		end

	boolean_value_or_default (an_attr_name: STRING; a_default_value: BOOLEAN): BOOLEAN is
			-- Value of attribue `an_attr_name',
			-- or `a_default_value' of no such attribute
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
		do
			if xml_element.has_attribute_by_name (an_attr_name) then
				Result := boolean_value (an_attr_name)
			else
				Result := a_default_value
			end
		end

	boolean_value (an_attr_name: STRING): BOOLEAN is
			-- Value of attribue `an_attr_name'
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
			has_attribute: has_attribute (an_attr_name)
		local
			a_value: STRING
		do
			a_value := attribute_value (an_attr_name)
			if STRING_.same_string (True_attribute_value, a_value) then
				Result := True
			elseif STRING_.same_string (False_attribute_value, a_value) then
				Result := False
			else
				std.error.put_string ("WARNING: wrong value '")
				std.error.put_string (a_value)
				std.error.put_string ("' for attribute '")
				std.error.put_string (an_attr_name)
				std.error.put_line ("'. Valid values are 'true' and 'false'. Using 'false'.")
				Result := False
			end
		end

	has_attribute (an_attr_name: STRING): BOOLEAN is
			-- Is `an_attr_name' an atttribute of Current element?
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
		do
			Result := xml_element.has_attribute_by_name (an_attr_name)
		end

feature {NONE} -- Constants

	Description_element_name: STRING is
			-- "description" element name
		once
			Result := "description"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

	True_attribute_value: STRING is
			-- "true" attribute value
		once
			Result := "true"
		ensure
			attribute_value_not_void: Result /= Void
		end

	False_attribute_value: STRING is
			-- "false" attribute value
		once
			Result := "false"
		ensure
			attribute_value_not_void: Result /= Void
		end

invariant

	xml_element_not_void: xml_element /= Void
	valid_xml_element: valid_xml_element (xml_element)

end
