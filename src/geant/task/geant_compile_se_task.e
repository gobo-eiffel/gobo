indexing

	description:

		"compilation task for SmallEiffel"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_COMPILE_SE_TASK
	inherit
		GEANT_COMPILE_SE_COMMAND
		GEANT_TASK
		end

	
creation
	make, load_from_element

	
	
feature
	load_from_element(a_el : GEANT_ELEMENT) is
		local
			s	: STRING
		do
			-- ace_file (optional)
			if has_attribute(a_el, attr_ace_file) then
				s := get_attribute_value_with_default(a_el, attr_ace_file, "")
				set_ace_file(s)
			else
				-- root_class
				s := get_attribute_value(a_el, attr_root_class)
				set_root_class(s)

				-- creation_procedure
				s := get_attribute_value(a_el, attr_creation_procedure)
				set_creation_procedure(s)
	
				-- executable
				s := get_attribute_value(a_el, attr_executable)
				set_executable(s)
	
				-- case_insensitive
				if has_attribute(a_el, attr_case_insensitive) then
					set_case_insensitive(get_boolean_value(a_el, attr_case_insensitive))
				end
	
				-- no_style_warning
				if has_attribute(a_el, attr_no_style_warning) then
					set_no_style_warning(get_boolean_value(a_el, attr_no_style_warning))
				end
	
			end


	
		end

attr_ace_file			: STRING is "ace_file"
attr_root_class			: STRING is "root_class"
attr_creation_procedure	: STRING is "creation_procedure"
attr_executable			: STRING is "executable"
attr_case_insensitive	: STRING is "case_insensitive"
attr_no_style_warning	: STRING is "no_style_warning"


end
