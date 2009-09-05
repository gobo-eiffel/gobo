indexing

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

	make (a_name: STRING; a_system: ET_SYSTEM) is
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

	kind_name: STRING is
			-- Kind name (e.g. "assembly", "library", etc.)
		once
			Result := "library"
		end

feature -- Relations

	add_library_recursive (a_visited: DS_HASH_SET [ET_LIBRARY]) is
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

	recursive_add_dependences (a_visited: DS_HASH_TOPOLOGICAL_SORTER [ET_LIBRARY]; other_library: ET_LIBRARY) is
			-- Add current library to `a_visited', and if `other_library'
			-- is not void add the dependence link between `other_library'
			-- and the current library (i.e. `other_library' depends
			-- on current library). Add recursively the libraries that
			-- current library depends on as well as the dependence links
			-- between these libraries.
		require
			a_visited_not_void: a_visited /= Void
		do
			if not a_visited.has (Current) then
				a_visited.force (Current)
				libraries.do_all (agent {ET_LIBRARY}.recursive_add_dependences (a_visited, Current))
			end
			if other_library /= Void then
				a_visited.force_relation (Current, other_library)
			end
		end

invariant

	self_adapted: library = Current

end
