indexing

	description:

		"Eiffel feature set export clauses"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FEATURE_EXPORT

inherit

	ET_EXPORT

	ET_FEATURE_NAME_LIST
		rename
			make as make_feature_name_list,
			make_with_capacity as make_feature_name_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_clients: like clients) is
			-- Create a new feature set export clause.
		require
			a_clients_not_void: a_clients /= Void
		do
			clients := a_clients
			make_feature_name_list
		ensure
			clients_set: clients = a_clients
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (a_clients: like clients; nb: INTEGER) is
			-- Create a new feature set export clause with capacity `nb'.
		require
			a_clients_not_void: a_clients /= Void
			nb_positive: nb >= 0
		do
			clients := a_clients
			make_feature_name_list_with_capacity (nb)
		ensure
			clients_set: clients = a_clients
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
-- TODO.
--			Result := clients.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if is_empty then
-- TODO
--				Result := clients.break
			else
				Result := item (count).break
			end
		end

feature -- Setting

	set_clients (a_clients: like clients) is
			-- Set `clients' to `a_clients'.
		require
			a_clients_not_void: a_clients /= Void
		do
			clients := a_clients
		ensure
			clients_set: clients = a_clients
		end

end -- class ET_FEATURE_EXPORT
