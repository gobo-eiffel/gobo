indexing

	description:

		"Eiffel export clauses"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_EXPORT

feature -- Access

	clients: ET_CLIENTS
			-- Clients

feature -- Status report

	has_feature_name (a_name: ET_FEATURE_NAME): BOOLEAN is
			-- Is `a_name' listed in current export clause?
		require
			a_name_not_void: a_name /= Void
		deferred
		end

invariant

	clients_not_void: clients /= Void

end -- class ET_EXPORT
