indexing

	description:

		"Eiffel client lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CLIENTS

inherit

	ANY
		redefine
			copy, is_equal
		end

creation

	make, make_none, make_any

feature {NONE} -- Initialization

	make (a_client: ET_CLIENT) is
			-- Create a new client list with initially
			-- one client `a_client'.
		require
			a_client_not_void: a_client /= Void
		do
			!! clients.make
			clients.put_first (a_client)
		ensure
			clients_set: clients.first = a_client
		end

	make_none (a_position: ET_POSITION; a_universe: ET_UNIVERSE) is
			-- Create a new empty client list
			-- (i.e. "feature {}").
		require
			a_position_not_void: a_position /= Void
			a_universe_not_void: a_universe /= Void
		local
			a_client: ET_CLIENT
		do
			!! a_client.make_none (a_position, a_universe)
			make (a_client)
		ensure
			is_none: is_none
		end

	make_any (a_position: ET_POSITION; a_universe: ET_UNIVERSE) is
			-- Create a new absent client list
			-- (i.e. "feature").
		require
			a_position_not_void: a_position /= Void
			a_universe_not_void: a_universe /= Void
		local
			a_client: ET_CLIENT
		do
			!! a_client.make_any (a_position, a_universe)
			make (a_client)
		ensure
			is_any: is_any
		end

feature -- Status report

	is_none: BOOLEAN is
			-- Has client list been declared as empty
			-- (i.e. "feature {}")?
		do
			Result := clients.count = 1 and then clients.first.is_none
		ensure
			definition: Result = (clients.count = 1 and then clients.first.is_none)
		end

	is_any: BOOLEAN is
			-- Has client list not been declared
			-- (i.e. "feature")?
		do
			Result := clients.count = 1 and then clients.first.is_any
		ensure
			definition: Result = (clients.count = 1 and then clients.first.is_any)
		end

	is_exported_to (a_class: ET_CLASS): BOOLEAN is
			-- Is `a_class' a descendant of any of the current clients?
		require
			a_class_not_void: a_class /= Void
		local
			a_cursor: DS_LINKED_LIST_CURSOR [ET_CLIENT]
		do
			a_cursor := clients.new_cursor
			from a_cursor.start until a_cursor.after loop
				if a_cursor.item.is_exported_to (a_class) then
					Result := True
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		end

feature -- Access

	clients: DS_LINKED_LIST [ET_CLIENT]
			-- Client names

feature -- Element change

	put_first (a_client: ET_CLIENT) is
			-- Add `a_client' to the list of clients.
		require
			a_client_not_void: a_client /= Void
		do
			clients.put_first (a_client)
		ensure
			one_more: clients.count = old clients.count + 1
			clients_set: clients.first = a_client
		end

	append_last (other: ET_CLIENTS) is
			-- Append clients held in `other' to end of `clients'.
		require
			other_not_void: other /= Void
		do
			clients.append_last (other.clients)
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to `Current'.
		do
			standard_copy (other)
			clients := clone (clients)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Are `Current' and `other' considered equal?
		do
			if other = Current then
				Result := True
			elseif same_type (other) then
				Result := clients.is_equal (other.clients)
			end
		end

invariant

	clients_not_void: clients /= Void
	clients_not_empty: not clients.is_empty
	no_void_client: not clients.has (Void)

end -- class ET_CLIENTS
