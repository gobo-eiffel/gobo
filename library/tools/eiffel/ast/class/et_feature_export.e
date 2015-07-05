note

	description:

		"Eiffel feature set export clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_EXPORT

inherit

	ET_EXPORT
		undefine
			reset
		end

	ET_FEATURE_NAME_LIST
		rename
			make as make_feature_name_list,
			make_with_capacity as make_feature_name_list_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_clients_clause: like clients_clause)
			-- Create a new feature set export clause.
		require
			a_clients_clause_not_void: a_clients_clause /= Void
		do
			clients_clause := a_clients_clause
			make_feature_name_list
		ensure
			clients_clause_set: clients_clause = a_clients_clause
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (a_clients_clause: like clients_clause; nb: INTEGER)
			-- Create a new feature set export clause with capacity `nb'.
		require
			a_clients_clause_not_void: a_clients_clause /= Void
			nb_positive: nb >= 0
		do
			clients_clause := a_clients_clause
			make_feature_name_list_with_capacity (nb)
		ensure
			clients_clause_set: clients_clause = a_clients_clause
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	clients (a_name: ET_FEATURE_NAME): ET_CLIENTS
			-- Clients for feature `a_name'
		do
			Result := clients_clause
		end

	clients_clause: ET_CLIENTS
			-- Clients clause

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := clients_clause.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := clients_clause.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if is_empty then
				Result := clients_clause.last_leaf
			else
				Result := last.last_leaf
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_feature_export (Current)
		end

invariant

	clients_clause_not_void: clients_clause /= Void

end
