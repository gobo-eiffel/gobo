indexing

	description:

		"xace task"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class GEANT_XACE_TASK
	inherit
		GEANT_XACE_COMMAND
		GEANT_TASK
		end

	
creation
	make, load_from_element

	
	
feature
	load_from_element(a_el : GEANT_ELEMENT) is
		local
			s	: STRING
			b	: BOOLEAN
		do
			--!!1 if we do not call make here `compile' if true
			-- where is the bug ??
			make

			-- options (optional)
			s := get_attribute_value_with_default(a_el, Attribute_name_options.out, "")
			set_options(s)

			-- command
			s := get_attribute_value(a_el, Attribute_name_command.out)
			set_command(s)

			-- command_options (optional)
			s := get_attribute_value_with_default(a_el, Attribute_name_command_options.out, "")
			set_command_options(s)

			-- xace_filename
			s := get_attribute_value(a_el, Attribute_name_xace_filename.out)
			set_xace_filename(s)

			-- compile
			b := get_boolean_value_with_default(a_el, Attribute_name_compile.out, false)
			set_compile(b)

		end

	Attribute_name_options : UC_STRING is
			-- Name of xml attribute for options
		once
			!!Result.make_from_string("options")
		end

	Attribute_name_command : UC_STRING is
			-- Name of xml attribute for command
		once
			!!Result.make_from_string("command")
		end

	Attribute_name_command_options : UC_STRING is
			-- Name of xml attribute for command_options
		once
			!!Result.make_from_string("command_options")
		end

	Attribute_name_xace_filename : UC_STRING is
			-- Name of xml attribute for xace_filename
		once
			!!Result.make_from_string("xace_filename")
		end

	Attribute_name_compile : UC_STRING is
			-- Name of xml attribute for compile
		once
			!!Result.make_from_string("compile")
		end


end
