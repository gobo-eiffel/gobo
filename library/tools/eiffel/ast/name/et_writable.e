indexing

	description:

		"Eiffel writable entities"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_WRITABLE

inherit

	ET_AST_NODE

feature -- Initialization

	reset is
			-- Reset writable as it was when it was first parsed.
		do
		end

end
