indexing

  description:
        "var task"

    library:    "bonbon/geant"
    author:     "Sven Ehrke"
    id:         "$Id$"
    copyright:  ""
    license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
    date:       "$Date$"
    revision:   "$Revision$"


class GEANT_VAR_TASK
	inherit
		GEANT_VAR_COMMAND
		GEANT_TASK
		end

	
creation
	make, load_from_element

	
	
feature
	load_from_element(a_el : GEANT_ELEMENT) is
		local
			s	: STRING
		do
			-- name
			set_name(get_attribute_value(a_el, attr_name))


			-- value
			s := get_attribute_value(a_el, attr_value)

			-- support for environment variables
			if s.item(1) = '$' then
				s := s.substring(2, s.count)
				s := get_environment_variable(s)
			end

			set_value(s)

		end

attr_name			: STRING is "name"
attr_value			: STRING is "value"


end
