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
	-- assigns 'a_name' to 'name'
	-- the client is responsible to clone 'a_name' before
	-- calling this routine if that's what he likes
	require
		valid_name : a_name /= void and then a_name.count > 0
	do
		name := a_name
	end

set_value(a_value : UC_STRING) is
	-- assigns 'a_value' to 'value'
	-- the client is responsible to clone 'a_value' before
	-- calling this routine if that's what he likes
	require
		valid_value : a_value /= void
	do
		value := a_value
	end

to_xml : UC_STRING is
    do
    Result := STRING_.make(10)
	Result.append(name)
	Result.append("=%"")
	Result.append(value)
	Result.append("%"")
	end

name	: UC_STRING
value	: UC_STRING

invariant
	valid_name : name /= void and then not name.is_empty
	valid_value : value /= void

end


