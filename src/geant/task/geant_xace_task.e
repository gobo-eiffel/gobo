indexing

  description:
        "xace task"

    library:    "gobo/geant"
    author:     "Sven Ehrke"
    id:         "$Id$"
    copyright:  ""
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
			s := get_attribute_value_with_default(a_el, attr_options, "")
			set_options(s)

			-- command
			s := get_attribute_value(a_el, attr_command)
			set_command(s)

			-- command_options (optional)
			s := get_attribute_value_with_default(a_el, attr_command_options, "")
			set_command_options(s)

			-- xace_filename
			s := get_attribute_value(a_el, attr_xace_filename)
			set_xace_filename(s)

			-- compile
			b := get_boolean_value_with_default(a_el, attr_compile, false)
			set_compile(b)

		end

attr_options			: STRING is "options"
attr_command			: STRING is "command"
attr_command_options	: STRING is "command_options"
attr_xace_filename		: STRING is "xace_filename"
attr_compile			: STRING is "compile"

end
