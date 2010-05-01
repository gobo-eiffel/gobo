note

	description:

		"Built-in groups for class NONE"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_NONE_GROUP

inherit

	ET_BUILTIN_GROUP
		redefine
			is_none
		end

create

	make

feature {NONE} -- Initialization

	make (a_universe: ET_UNIVERSE) is
			-- Create a new built-in group for class "NONE".
		require
			a_universe_not_void: a_universe /= Void
		do
			name := "none"
			universe := a_universe
		ensure
			universe_set: universe = a_universe
		end

feature -- status report

	is_none: BOOLEAN is True
			-- Is current group a built-in group for class "NONE"?

feature -- Access

	universe: ET_UNIVERSE
			-- Surrounding universe

invariant

	is_none: is_none

end
