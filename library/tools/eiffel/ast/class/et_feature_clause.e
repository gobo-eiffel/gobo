indexing

	description:

		"Eiffel feature clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_CLAUSE

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_FEATURE_ITEM]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_feature: like feature_keyword; a_clients: like clients) is
			-- Create a new feature clause.
		require
			a_feature_not_void: a_feature /= Void
			a_clients_not_void: a_clients /= Void
		do
			feature_keyword := a_feature
			clients := a_clients
			make_ast_list
		ensure
			feature_keyword_set: feature_keyword = a_feature
			clients_set: clients = a_clients
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (a_feature: like feature_keyword; a_clients: like clients; nb: INTEGER) is
			-- Create a new feature clause with capacity `nb'.
		require
			a_feature_not_void: a_feature /= Void
			a_clients_not_void: a_clients /= Void
			nb_positive: nb >= 0
		do
			feature_keyword := a_feature
			clients := a_clients
			make_ast_list_with_capacity (nb)
		ensure
			feature_keyword_set: feature_keyword = a_feature
			clients_set: clients = a_clients
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	feature_keyword: ET_TOKEN
			-- 'feature' keyword

	clients: ET_CLASS_NAME_LIST
			-- Clients

	clients_clause: ET_CLIENTS is
			-- Clients clause
		do
			Result ?= clients
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := feature_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		local
			a_clients_clause: ET_CLIENTS
		do
			if is_empty then
				a_clients_clause := clients_clause
				if a_clients_clause /= Void then
					Result := a_clients_clause.break
				else
					Result := feature_keyword.break
				end
			else
				Result := item (count).break
			end
		end

feature -- Setting

	set_feature_keyword (a_feature: like feature_keyword) is
			-- Set `feature_keyword' to `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			feature_keyword := a_feature
		ensure
			feature_keyword_set: feature_keyword = a_feature
		end

	set_clients (a_clients: like clients) is
			-- Set `clients' to `a_clients'.
		require
			a_clients_not_void: a_clients /= Void
		do
			clients := a_clients
		ensure
			clients_set: clients = a_clients
		end

feature {NONE} -- Implementation

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_FEATURE_ITEM] is
			-- Fixed array routines
		once
			!! Result
		end

invariant

	feature_keyword_not_void: feature_keyword /= Void
	clients_not_void: clients /= Void

end
