indexing

	description:

		"Eiffel client lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CLIENTS

creation

	make, make_none, make_any

feature {NONE} -- Initialization

	make (a_client: like clients) is
			-- Create a new client list with initially
			-- one client `a_client'.
		require
			a_client_not_void: a_client /= Void
		do
			clients := a_client
		ensure
			clients_set: clients = a_client
		end

	make_none is
			-- Create a new empty client list
			-- (i.e. "feature {}").
		do
			is_none := True
		ensure
			is_none: is_none
		end

	make_any is
			-- Create a new absent client list
			-- (i.e. "feature").
		do
			is_any := True
		ensure
			is_any: is_any
		end

feature -- Status report

	is_none: BOOLEAN
			-- Has client list been declared as empty
			-- (i.e. "feature {}")?

	is_any: BOOLEAN
			-- Has client list not been declared
			-- (i.e. "feature")?

feature -- Access

	clients: ET_CLIENT
			-- Client names

feature -- Element change

	put_first (a_client: like clients) is
			-- Add `a_client' to the list of clients.
		require
			a_client_not_void: a_client /= Void
		do
			a_client.set_next (clients)
			clients := a_client
		ensure
			one_more: clients.next = old clients
			assertion_added: clients = a_client
		end

invariant

--	clients_not_void: clients /= Void

end -- class ET_CLIENTS
