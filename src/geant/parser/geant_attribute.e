indexing

	description:

		"represents an XML attribute"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEANT_ATTRIBUTE
	inherit
        KL_IMPORTED_STRING_ROUTINES
        end

	creation
	make

feature

make(a_name, a_value : UC_STRING) is
	do
	set_name(a_name)
	set_value(a_value)
	end

set_name(a_name : UC_STRING) is
	-- Set `name' to `a_name'.
	require
		valid_name : a_name /= void and then a_name.count > 0
	do
		name := a_name
	ensure
		name_set : name = a_name
	end

set_value(a_value : UC_STRING) is
	-- Set `value' to `a_value'.
	require
		valid_value : a_value /= void
	do
		value := a_value
	ensure
		value_set : value = a_value
	end

as_xml : UC_STRING is
	-- XML representation.
    do
	    !!Result.make_from_string("")
		Result.append_uc_string(name)
		Result.append_string("=%"")
		Result.append_uc_string(value)
		Result.append_string("%"")

	end

name	: UC_STRING
value	: UC_STRING

invariant
	valid_name : name /= void and then name.count > 0
	valid_value : value /= void

end


