indexing

	description:

		"Target of geant build file"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_TARGET

inherit

	GEANT_ELEMENT_NAMES
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_element: GEANT_ELEMENT)is
			-- Create a new target
		precursor
			element_not_void: a_element /= Void
		do
			element := a_element
		ensure
			element_set: element = a_element
		end

feature {NONE} -- Implementation

	element : GEANT_ELMENT
		-- Xml element defining this target

invariant
	element_not_void: element /= Void
end -- class GEANT_TARGET
