indexing

	description:

		"Unset tasks"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_UNSET_TASK

inherit

	GEANT_TASK
		redefine
			make_from_element
		end

	GEANT_UNSET_COMMAND

creation

	make_from_element

feature {NONE} -- Initialization

	make_from_element (a_project: GEANT_PROJECT; an_element: GEANT_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			precursor (a_project, an_element)
				-- name:
			if has_uc_attribute (an_element, Name_attribute_name) then
				a_value := uc_attribute_value (an_element, Name_attribute_name).out
				if a_value.count > 0 then
					set_name (a_value)
				end
			end
		end

end -- class GEANT_UNSET_TASK
