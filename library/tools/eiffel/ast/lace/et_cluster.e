indexing

	description:

		"Eiffel clusters"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_CLUSTER

feature -- Access

	classes (a_universe: ET_UNIVERSE): DS_ARRAYED_LIST [ET_CLASS] is
			-- Classes of `a_universe' which are in current cluster
		require
			a_universe_not_void: a_universe /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_IDENTIFIER]
			a_class: ET_CLASS
		do
			!! Result.make (Initial_classes_capacity)
			a_cursor := a_universe.classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.cluster = Current then
					Result.force_last (a_class)
				end
				a_cursor.forth
			end
		ensure
			classes_not_void: Result /= Void
			no_void_class: not Result.has (Void)
		end

feature -- Parsing

	parse_all (a_universe: ET_UNIVERSE) is
			-- Parse all classes in cluster.
		require
			a_universe_not_void: a_universe /= Void
		deferred
		end

feature {NONE} -- Constants

	Initial_classes_capacity: INTEGER is 20
			-- Initial capacity for `classes'

end -- class ET_CLUSTER
