indexing

	description:

		"Eiffel adapted class universes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ADAPTED_UNIVERSE

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new adapted view of `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
		ensure
			universe_set: universe = a_universe
		end

feature -- Access

	universe: ET_UNIVERSE
			-- Eiffel class universe being adapted

feature -- Exporting classes

	export_classes (other_universe: ET_UNIVERSE) is
			-- Export non-hidden classes locally declared in `universe'
			-- so that they can be used in classes of `other_universe'.
		require
			other_universe_not_void: other_universe /= Void
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			l_class: ET_CLASS
		do
			l_cursor := universe.classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
				if l_class.universe = universe then
-- TODO: take into account class renaming and class name clashes.
					other_universe.classes.force_last (l_class, l_cursor.key)
				end
				l_cursor.forth
			end
		end

feature -- Parsing

	propagate_classes_modified (other_universe: ET_UNIVERSE) is
			-- Propagate to `other_universe', which is supposed to be a universe
			-- that depends on `universe', the fact that a class has been modified
			-- or added.
		require
			other_universe_not_void: other_universe /= Void
		do
			if universe.classes_modified or universe.classes_added then
				other_universe.set_classes_modified (True)
			end
		end

invariant

	universe_not_void: universe /= Void

end
