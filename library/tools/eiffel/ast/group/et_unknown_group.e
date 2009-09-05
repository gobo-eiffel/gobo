indexing

	description:

		"Built-in groups for class *UNKNOWN*"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_UNKNOWN_GROUP

inherit

	ET_BUILTIN_GROUP
		redefine
			is_unknown
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new built-in group for the class "*UNKNOWN*".
		do
			name := "unknown"
		end

feature -- status report

	is_unknown: BOOLEAN is True
			-- Is current group a built-in group for class "*UNKNOWN*"?

feature -- Access

	universe: ET_UNIVERSE is
			-- Surrounding universe
		do
			Result := tokens.unknown_system
		end

invariant

	is_unknown: is_unknown

end
