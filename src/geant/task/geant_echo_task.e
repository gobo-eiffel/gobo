indexing

	description:

		"exec task"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_ECHO_TASK

inherit

	GEANT_ECHO_COMMAND
	GEANT_TASK
	
creation

	make, load_from_element
	
feature
	load_from_element(a_el : GEANT_ELEMENT) is
		local
			s	: UC_STRING
		do
			s := a_el.get_attributevalue_by_name(Attribute_name_message)
			set_message(s.out)
		end


	Attribute_name_message : UC_STRING is
			-- Name of xml attribute message.
		once
			!!Result.make_from_string("message")
		end

end
