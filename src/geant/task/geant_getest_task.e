indexing

	description:

		"getest task"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_GETEST_TASK
	inherit
		GEANT_GETEST_COMMAND
		GEANT_TASK
		end

	
creation
	make, load_from_element

feature -- Initialization

	load_from_element(a_el : GEANT_ELEMENT) is
			-- Initialize from a_el.
		local
			s	: UC_STRING
		do
			s := a_el.get_attributevalue_by_name(Configfile_attribute_name)
			set_configfile(s.out)
		end


	Configfile_attribute_name : UC_STRING is
			-- Name of xml attribute for getest configfile.
		once
			!!Result.make_from_string("configfile")
		end

end
