indexing

	description:

		"Compilation tasks for Visual Eiffel"

	library:    "Gobo Eiffel Ant"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_VE_TASK

inherit

	GEANT_TASK
		redefine
			make_from_element
		end

	GEANT_VE_COMMAND

creation

	make_from_element

feature {NONE} -- Initialization

	make_from_element (a_project: GEANT_PROJECT; an_element: GEANT_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			precursor (a_project, an_element)
				-- ESD:
			if has_uc_attribute (an_element, Esd_attribute_name) then
				a_value := attribute_value_or_default (an_element, Esd_attribute_name.out, "")
				if a_value.count > 0 then
					set_esd_filename (a_value)
				end
			end
				-- clean:
			if has_uc_attribute (an_element, Clean_attribute_name) then
				a_value := attribute_value_or_default (an_element, Clean_attribute_name.out, "")
				if a_value.count > 0 then
					set_clean (a_value)
				end
			end
		end

feature {NONE} -- Constants

	Esd_attribute_name: UC_STRING is
			-- Name of xml attribute for "esd"
		once
			!! Result.make_from_string ("esd")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

	Clean_attribute_name: UC_STRING is
			-- Name of xml attribute for "clean"
		once
			!! Result.make_from_string ("clean")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

end -- class GEANT_VE_TASK
