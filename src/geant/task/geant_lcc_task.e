indexing

	description:

		"lcc C-Compiler task"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEANT_LCC_TASK
	inherit
		GEANT_LCC_COMMAND
		GEANT_TASK
		end

	
creation
	make, load_from_element

	
	
feature
	load_from_element(a_el : GEANT_ELEMENT) is
		do
			-- -Fo
			set_executable(get_attribute_value(a_el, Attribute_name_executable.out))

			-- -sourcefilename
			set_sourcefilename(get_attribute_value(a_el, Attribute_name_sourcefilename.out))

		end

	Attribute_name_executable : UC_STRING is
			-- Name of xml attribute for executable
		once
			!!Result.make_from_string("executable")
		end

	Attribute_name_sourcefilename : UC_STRING is
			-- Name of xml attribute for sourcefilename
		once
			!!Result.make_from_string("sourcefilename")
		end

end
