indexing

	description:

		"Var tasks"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_VAR_TASK

inherit

	GEANT_TASK
		redefine
			make_from_element
		end

	GEANT_VAR_COMMAND

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
				-- value:
			if has_uc_attribute (an_element, Value_attribute_name) then
				a_value := uc_attribute_value (an_element, Value_attribute_name).out
				set_value (a_value)
			end
		end

feature {NONE} -- Constants

	Value_attribute_name: UC_STRING is
			-- Name of xml attribute for value
		once
			!! Result.make_from_string ("value")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

end -- class GEANT_VAR_TASK
