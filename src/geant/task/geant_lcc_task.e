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
			set_executable(get_attribute_value(a_el, attr_executable))

			-- -sourcefilename
			set_sourcefilename(get_attribute_value(a_el, attr_sourcefilename))

		end

attr_executable			: STRING is "executable"
attr_sourcefilename		: STRING is "sourcefilename"


end
