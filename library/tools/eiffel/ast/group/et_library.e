note

	description:

		"Eiffel class libraries"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LIBRARY

inherit

	ET_PRIMARY_GROUP
		undefine
			current_system, hash_code,
			library,
			lower_name,
			full_name, full_lower_name,
			relative_name, relative_lower_name
		redefine
			is_library,
			kind_name
		end

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

feature -- Status report

	is_library: BOOLEAN = True
			-- Is current group a library?

	is_override: BOOLEAN = False
			-- Is current group an override group?
			-- In other words, do classes in this group and other override
			-- groups take precedence over classes with same names but in
			-- non-override group? (see 'override_cluster' in ISE's LACE.)

feature -- Access

	pathname: STRING
			-- Library pathname (may be Void)
		do
		end

	library: ET_LIBRARY
			-- Eiffel library being adapted

	universe: ET_UNIVERSE
			-- Surrounding universe
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	kind_name: STRING
			-- Name of the kind of group or universe (e.g. "cluster", "assembly", "library", etc.)
		once
			Result := "library"
		end

feature -- Nested

	parent: ET_LIBRARY
			-- Parent group
		do
			-- Result := Void
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
