indexing

	description:

		"Exec tasks"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_EXEC_TASK

inherit

	GEANT_TASK
		redefine make_from_element
	end
	GEANT_EXEC_COMMAND

creation

	make, make_from_element

feature {NONE} -- Initialization

	make_from_element (a_target: GEANT_TARGET; an_element: GEANT_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			precursor (a_target, an_element)
			make
			if an_element.has_attribute (Executable_attribute_name) then
				a_value := attribute_value (an_element, Executable_attribute_name.out)
				if a_value.count > 0 then
					set_command_line (a_value.out)
				end
			end
		end

feature {NONE} -- Constants

	Executable_attribute_name: UC_STRING is
			-- Name of xml attribute executable.
		once
			!! Result.make_from_string ("executable")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

end -- class GEANT_EXEC_TASK
