indexing

	description:

		"Eiffel 'all' export clauses"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ALL_EXPORT

inherit

	ET_EXPORT

creation

	make

feature {NONE} -- Initialization

	make (a_clients: like clients) is
			-- Create a new 'all' export clause.
		require
			a_clients_not_void: a_clients /= Void
		do
			clients := a_clients
		ensure
			clients_set: clients = a_clients
		end

feature -- Status report

	has_feature_name (a_name: ET_FEATURE_NAME): BOOLEAN is
			-- Is `a_name' listed in current export clause?
		do
			Result := True
		end

end -- class ET_ALL_EXPORT
