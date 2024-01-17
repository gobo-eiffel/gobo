note

	description:

		"Geant elements"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2018, Sven Ehrke and others"
	license: "MIT License"

class GEANT_ELEMENT

inherit

	ANY

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_xml_element: like xml_element)
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

	position: detachable XM_POSITION
			-- Position of element in source document

	elements_by_name (a_name: STRING): DS_LINKED_LIST [XM_ELEMENT]
			-- Direct children elements with name `a_name'
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			cs: DS_LINKED_LIST_CURSOR [XM_NODE]
		do
			create Result.make
			cs := xml_element.new_cursor
			from cs.start until cs.after loop
				if attached {XM_ELEMENT} cs.item as e and then STRING_.same_string (e.name, a_name) then
					Result.force_last (e)
				end
				cs.forth
			end
		ensure
			result_not_void: Result /= Void
			result_not_empty: xml_element.has_element_by_name (a_name) implies Result.count > 0
		end

feature -- Status report

	valid_xml_element (an_xml_element: like xml_element): BOOLEAN
			-- Is `an_xml_element' a valid xml element?
		require
			an_xml_element_not_void: an_xml_element /= Void
		do
			Result := True
		end

feature -- Setting

	set_xml_element (a_xml_element: like xml_element)
			-- Set `xml_element' to `a_xml_element'.
		require
			a_xml_element_not_void: a_xml_element /= Void
			valid_xml_element: valid_xml_element (a_xml_element)
		do
			xml_element := a_xml_element
		ensure
			xml_element_set: xml_element = a_xml_element
		end

	set_position (a_position: like position)
			-- Set `position' to `a_position'.
		require
			a_position_not_void: a_position /= Void
		do
			position := a_position
		ensure
			position_set: position = a_position
		end

feature -- Access/XML attribute values

	attribute_value_or_default (an_attr_name: STRING; a_default_value: STRING): STRING
			-- Value of attribue `an_attr_name',
			-- or `a_default_value' of no such attribute
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
			a_default_value_not_void: a_default_value /= Void
		do
			if xml_element.has_attribute_by_name (an_attr_name) then
				check has_attribute: attached xml_element.attribute_by_name (an_attr_name) as l_attribute then
					Result := l_attribute.value
				end
			else
				Result := a_default_value
			end
		ensure
			attribute_value_or_default_not_void: Result /= Void
		end

	attribute_value (an_attr_name: STRING): STRING
			-- Value of attribue `an_attr_name'
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
			has_attribute: has_attribute (an_attr_name)
		do
			check precondition: attached xml_element.attribute_by_name (an_attr_name) as l_attribute then
				Result := l_attribute.value
			end
		end

	attribute_value_if_existing (a_attribute_name: STRING): detachable STRING
			-- Value of attribute `a_attribute_name' if existing; Void otherwise
        require
            a_attribute_name_not_void: a_attribute_name /= Void
            a_attribute_name_not_empty: a_attribute_name.count > 0
		do
			if has_attribute (a_attribute_name) then
				Result := attribute_value (a_attribute_name)
			end
		end

	content: detachable STRING
			-- Content of element if any; Void otherwise
		do
			Result := xml_element.text
		ensure
			content_not_void_if_xml_text_not_void: xml_element.text /= Void implies Result /= Void
			content_void_if_xml_text_void: xml_element.text = Void implies Result = Void
		end

	attribute_or_content_value (a_attribute_name: STRING): STRING
			-- String value of attribute `a_attribute_name' if existing, `content'
			-- NOTE: an error will be raised if
			-- - both attribute and content are specified
			-- or
			-- - neither attribute nor content are specified
        require
            a_attribute_name_not_void: a_attribute_name /= Void
            a_attribute_name_not_empty: a_attribute_name.count > 0
		local
			a_has_attribute: BOOLEAN
			a_has_content_text: BOOLEAN
			a_content_text: STRING
		do
				-- Content of element if any (take snapshot of `content' into `a_content_text' to avoid recalculation):
			a_content_text := content
			a_has_content_text := a_content_text /= Void and then not a_content_text.is_empty

				-- Make sure not both, attribute and element content have been specified:
			a_has_attribute := has_attribute (a_attribute_name)
			if a_has_content_text and a_has_attribute then
				if attached position as l_position then
					log_messages (<<"  [", xml_element.name, "] ERROR (", l_position.source_name,
						", ", l_position.row.out, ":", l_position.column.out, "):">>)
				else
					log_messages (<<"  [", xml_element.name, "]", " ERROR:">>)
				end
				exit_application (1, <<"  Usage of both, attribute %'", a_attribute_name,
					"%' and text content within element %'", xml_element.name, "%' is not allowed.">>)
			end
				-- Make sure either attribute 'message' or element content text have been specified:
 			if not a_has_content_text and not a_has_attribute then
				if attached position as l_position then
					log_messages (<<"  [", xml_element.name, "] ERROR (", l_position.source_name,
						", ", l_position.row.out, ":", l_position.column.out, "):">>)
				else
					log_messages (<<"  [", xml_element.name, "]", " ERROR:">>)
				end
				exit_application (1, <<"  You have to specify either attribute %'",
					a_attribute_name, "%' or text content within the element %'", xml_element.name, "%'.">>)
 			end

 			if a_has_attribute then
 				Result := attribute_value (a_attribute_name)
 			else
 				check has_context_text: a_content_text /= Void then
 					Result := a_content_text
 				end
 			end
		end

	boolean_value_or_default (an_attr_name: STRING; a_default_value: BOOLEAN): BOOLEAN
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

	boolean_value (an_attr_name: STRING): BOOLEAN
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

	has_attribute (an_attr_name: STRING): BOOLEAN
			-- Is `an_attr_name' an attribute of Current element?
		require
			an_attr_name_not_void: an_attr_name /= Void
			an_attr_name_not_empty: an_attr_name.count > 0
		do
			Result := xml_element.has_attribute_by_name (an_attr_name)
		end

feature {NONE} -- Constants

	Description_element_name: STRING
			-- "description" element name
		once
			Result := "description"
		ensure
			element_name_not_void: Result /= Void
			element_name_not_empty: Result.count > 0
		end

	True_attribute_value: STRING
			-- "true" attribute value
		once
			Result := "true"
		ensure
			attribute_value_not_void: Result /= Void
		end

	False_attribute_value: STRING
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
