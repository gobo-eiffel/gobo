indexing

	description:

		"Eiffel client class names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CLIENT

creation

	make, make_none, make_any

feature {NONE} -- Initialization

	make (a_name: like name) is
			-- Create a new client.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	make_none (a_position: ET_POSITION; a_universe: ET_UNIVERSE) is
			-- Create a new client associated with an empty client list
			-- (i.e. "feature {}").
		require
			a_position_not_void: a_position /= Void
			a_universe_not_void: a_universe /= Void
		local
			a_name: like name
		do
			!! a_name.make (a_universe.none_class.name.name, a_position)
			make (a_name)
			is_none := True
		ensure
			is_none: is_none
		end

	make_any (a_position: ET_POSITION; a_universe: ET_UNIVERSE) is
			-- Create a new associated with an absent client list
			-- (i.e. "feature").
		require
			a_position_not_void: a_position /= Void
			a_universe_not_void: a_universe /= Void
		local
			a_name: like name
		do
			!! a_name.make (a_universe.any_class.name.name, a_position)
			make (a_name)
			is_any := True
		ensure
			is_any: is_any
		end

feature -- Access

	name: ET_IDENTIFIER
			-- Class name

feature -- Status report

	is_none: BOOLEAN
			-- Has associated client list been declared as empty
			-- (i.e. "feature {}")?

	is_any: BOOLEAN
			-- Has associated client list not been declared
			-- (i.e. "feature")?

	is_exported_to (a_class: ET_CLASS): BOOLEAN is
			-- Is `a_class' a descendant of current client?
		require
			a_class_not_void: a_class /= Void
		local
			a_universe: ET_UNIVERSE
		do
			a_universe := a_class.universe
			if a_class = a_universe.none_class then
					-- NONE is a descendant of all classes.
				Result := True
			else
					-- Search ancestors of `a_class' first to make sure that if
					-- `a_class' is a descendant of current client then the
					-- class corresponding to this client is in the universe
					-- (it is possible to specify class names in the client
					-- clauses which are not in the universe).
				if a_class.is_parsed and then not a_class.has_syntax_error then
					a_class.search_ancestors
					if not a_class.has_ancestors_error then
						if a_universe.has_class (name) then
							Result := a_class.has_ancestor (a_universe.eiffel_class (name))
						end
					end
				end
			end
		end

invariant

	name_not_void: name /= Void

end -- class ET_CLIENT
