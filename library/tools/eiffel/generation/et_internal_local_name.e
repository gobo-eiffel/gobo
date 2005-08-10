indexing

	description:

		"Eiffel internal local names used to hold result of expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INTERNAL_LOCAL_NAME

inherit

	ET_IDENTIFIER
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name) is
			-- Create a new internal local name.
		do
			make_with_hash_code (a_name, new_hash_code (a_name))
			set_local (True)
		end

end
