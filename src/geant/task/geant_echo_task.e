indexing

	description:

		"Echo tasks"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_ECHO_TASK

inherit

	GEANT_TASK
	GEANT_ECHO_COMMAND

creation

	make, make_from_element

feature {NONE} -- Initialization

	make_from_element (an_element: GEANT_ELEMENT) is
			-- Create a new task with information held in `an_element'.
		local
			a_value: STRING
		do
			if an_element.has_attribute (Message_attribute_name) then
				a_value := attribute_value (an_element, Message_attribute_name.out)
				set_message (a_value)
			end
		end

feature {NONE} -- Constants

	Message_attribute_name: UC_STRING is
			-- Name of xml attribute message.
		once
			!! Result.make_from_string ("message")
		ensure
			attribute_name_not_void: Result /= Void
			atribute_name_not_empty: not Result.empty
		end

end -- class GEANT_ECHO_TASK
