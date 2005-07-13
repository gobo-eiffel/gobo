indexing

	description:

		"Define Element"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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
			attribute_value_or_default
		end

create

	make

end
