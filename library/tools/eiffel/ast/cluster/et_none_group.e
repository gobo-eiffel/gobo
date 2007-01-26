indexing

	description:

		"Built-in groups for class NONE"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_NONE_GROUP

inherit

	ET_BUILTIN_GROUP
		rename
			make as make_builtin
		redefine
			is_none
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new built-in group for class NONE.
		do
			make_builtin ("none")
		end

feature -- status report 

	is_none: BOOLEAN is True
			-- Is current group a built-in group for class NONE?

invariant

	is_none: is_none

end
