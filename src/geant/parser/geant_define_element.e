note

	description:

		"Define Element"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_DEFINE_ELEMENT

inherit

	GEANT_INTERPRETING_ELEMENT

	GEANT_NAME_VALUE_ELEMENT
		rename
			make as element_make
		undefine
			attribute_value,
			attribute_value_or_default,
			content
		end

create

	make

end
