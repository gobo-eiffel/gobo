indexing

    description:

        "XML attribute properties for Geant tasks and commands"

    library: "Gobo Eiffel Ant"
    copyright: "Copyright (c) 2008, Sven Ehrke and others"
    license: "MIT License"
    date: "$Date$"
    revision: "$Revision$"

class GEANT_XML_ATTRIBUTE_PROPERTY [G]

inherit

	GEANT_XML_PROPERTY [G]

create

	make

feature -- Access

	string_value: STRING is
			-- String value
		do
			if element.has_attribute (xml_name) then
				Result := element.attribute_value (xml_name)
			end
		end

end
