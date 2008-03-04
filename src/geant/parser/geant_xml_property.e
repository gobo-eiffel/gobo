indexing

    description:

        "XML Properties for Geant tasks and commands"

    library: "Gobo Eiffel Ant"
    copyright: "Copyright (c) 2008, Sven Ehrke and others"
    license: "MIT License"
    date: "$Date$"
    revision: "$Revision$"

deferred class GEANT_XML_PROPERTY [G]

feature {NONE} -- Initialization

	make (a_xml_name: STRING; a_property: like property; a_project: GEANT_PROJECT; an_xml_element: XM_ELEMENT) is
			-- Create new  GEANT_PROPERTY object.
        require
            a_xml_name_not_void: a_xml_name /= Void
            a_xml_name_not_empty: a_xml_name.count > 0
            a_property_not_void: a_property /= Void
            a_project_not_void: a_project /= Void
            an_xml_element_not_void: an_xml_element /= Void
		do
			xml_name := a_xml_name
			property := a_property
			property.set_string_value_agent (agent string_value)
			create element.make (a_project, an_xml_element)
		ensure
            xml_name_set: xml_name = a_xml_name
            property_set: property = a_property
            element_not_void: element /= Void
            xml_element_of_element_set: element.xml_element = an_xml_element
		end

feature -- Access

	xml_name: STRING
			-- Name of xml element/attribute representation

	property: GEANT_PROPERTY [G]
			-- Property

	element: GEANT_INTERPRETING_ELEMENT
			-- XML Element

	string_value: STRING is
			-- String value of xml element/attibute or Void if not existing
		deferred
		end

end
