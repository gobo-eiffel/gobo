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
			if has_attribute_uc(a_el, Attribute_name_ace_file) then
				s := get_attribute_value_with_default(a_el, Attribute_name_ace_file.out, "")
				set_ace_file(s)
			else
				-- root_class
				s := get_attribute_value(a_el, Attribute_name_root_class.out)
				set_root_class(s)

				-- creation_procedure
				s := get_attribute_value(a_el, Attribute_name_creation_procedure.out)
				set_creation_procedure(s)
	
				-- executable
				s := get_attribute_value(a_el, Attribute_name_executable.out)
				set_executable(s)
	
				-- case_insensitive
				if has_attribute_uc(a_el, Attribute_case_insensitive) then
					set_case_insensitive(get_boolean_value(a_el, Attribute_case_insensitive.out))
				end
	
				-- no_style_warning
				if has_attribute_uc(a_el, Attribute_no_style_warning) then
					set_no_style_warning(get_boolean_value(a_el, Attribute_no_style_warning.out))
				end
	
			end


	
		end

	Attribute_name_ace_file: UC_STRING is
			-- Name of xml attribute for ace_file
		once
			!!Result.make_from_string("ace_file")
		end

	Attribute_name_root_class: UC_STRING is
			-- Name of xml attribute for root_class
		once
			!!Result.make_from_string("root_class")
		end

	Attribute_name_creation_procedure: UC_STRING is
			-- Name of xml attribute for creation_procedure
		once
			!!Result.make_from_string("creation_procedure")
		end

	Attribute_name_executable: UC_STRING is
			-- Name of xml attribute for executable
		once
			!!Result.make_from_string("executable")
		end

	Attribute_case_insensitive: UC_STRING is
			-- Name of xml attribute for case_insensitive
		once
			!!Result.make_from_string("case_insensitive")
		end

	Attribute_no_style_warning: UC_STRING is
			-- Name of xml attribute for no_style_warning
		once
			!!Result.make_from_string("no_style_warning")
		end


end
