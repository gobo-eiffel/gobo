indexing

    description:

        "XML attribute or content properties for Geant tasks and commands"

    library: "Gobo Eiffel Ant"
    copyright: "Copyright (c) 2008, Sven Ehrke and others"
    license: "MIT License"
    date: "$Date$"
    revision: "$Revision$"

class GEANT_XML_ATTRIBUTE_OR_CONTENT_PROPERTY [G]

inherit

	GEANT_XML_PROPERTY [G]

	GEANT_SHARED_PROPERTIES
		export {NONE} all end

create

	make

feature -- Access

	string_value: STRING is
			-- String value of the attribute if existing, otherwise of the content of `element'
			-- NOTE: an error will be raised if
			-- - both attribute and content are specified
			-- or
			-- - neither attribute nor content is specified

		local
			a_content_text: STRING
			a_has_attribute_message: BOOLEAN
			a_has_content_text: BOOLEAN
		do
				-- Content of element if any:
			a_content_text := element.xml_element.text
			a_has_content_text := not (a_content_text = Void or else a_content_text.is_empty)

				-- Make sure not both, attribute and element content have been specified:
			a_has_attribute_message := element.has_attribute (xml_name)
			if a_has_content_text and a_has_attribute_message then
				exit_application (1, <<"  [", element.xml_element.name, "] error: Usage of both, attribute %'", xml_name,
					"%' and text content within element %'", element.xml_element.name, "%' is not allowed.">>)
			end
				-- Make sure either attribute 'message' or element content text have been specified:
 			if not a_has_content_text and not a_has_attribute_message then
 				exit_application (1, <<"  [", element.xml_element.name, "] error: You have to specify either attribute %'",
					xml_name, "%' or text content within the element %'", element.xml_element.name, "%'.">>)
 			end

 			if a_has_attribute_message then
 				Result := element.attribute_value (xml_name)
 			else
 				check a_has_content_text end
 				Result := a_content_text
 			end
		end

end
