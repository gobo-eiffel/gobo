note

	description:

		"Eiffel class libraries"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LIBRARY

inherit

	ET_INTERNAL_UNIVERSE
		rename
			universe as library
		redefine
			library,
			kind_name
		end

	ET_ADAPTED_LIBRARY
		rename
			make as make_adapted
		redefine
			library
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: STRING; a_system: ET_SYSTEM)
			-- Create a new Eiffel class library.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			make_from_system (a_name, a_system)
		ensure
			name_set: name = a_name
			current_system_set: current_system = a_system
		end

feature -- Access

	library: ET_LIBRARY
			-- Eiffel library being adapted

	kind_name: STRING
			-- Name of the kind of universe (e.g. "library", "assembly", etc.)
		once
			Result := "library"
		end

feature -- Relations

	add_library_recursive (a_visited: DS_HASH_SET [ET_LIBRARY])
			-- Add current library to `a_visited' and
			-- recursively the libraries it depends on.
		require
			a_visited_not_void: a_visited /= Void
		do
			if not a_visited.has (Current) then
				a_visited.force_last (Current)
				libraries.do_all (agent {ET_LIBRARY}.add_library_recursive (a_visited))
			end
		end

invariant

	self_adapted: library = Current

end
