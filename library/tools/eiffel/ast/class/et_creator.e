indexing

	description:

		"Eiffel creation clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CREATOR

inherit

	ET_FEATURE_NAME_LIST
		rename
			make as make_feature_name_list,
			make_with_capacity as make_feature_name_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_creation: like creation_keyword; a_clients: like clients) is
			-- Create a new creation clause.
		require
			a_creation_not_void: a_creation /= Void
			a_clients_not_void: a_clients /= Void
		do
			creation_keyword := a_creation
			clients := a_clients
			make_feature_name_list
		ensure
			creation_keyword_set: creation_keyword = a_creation
			clients_set: clients = a_clients
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (a_creation: like creation_keyword; a_clients: like clients; nb: INTEGER) is
			-- Create a new creation clause with capacity `nb'.
		require
			a_creation_not_void: a_creation /= Void
			a_clients_not_void: a_clients /= Void
			nb_positive: nb >= 0
		do
			creation_keyword := a_creation
			clients := a_clients
			make_feature_name_list_with_capacity (nb)
		ensure
			creation_keyword_set: creation_keyword = a_creation
			clients_set: clients = a_clients
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	creation_keyword: ET_TOKEN
			-- 'creation' keyword

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
			Result := creation_keyword.position
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
					Result := creation_keyword.break
				end
			else
				Result := item (count).break
			end
		end

feature -- Status report

	is_exported_to (a_name: ET_FEATURE_NAME; a_class: ET_CLASS): BOOLEAN is
			-- Is feature name listed in current creation clause
			-- and is it exported to `a_class'?
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		do
			if not is_empty then
				if clients.has_descendant (a_class) then
					Result := has_feature_name (a_name)
				end
			end
		end

	is_directly_exported_to (a_name: ET_FEATURE_NAME; a_class: ET_CLASS): BOOLEAN is
			-- Is feature name listed in current creation clause
			-- and is it directly exported to `a_class'?
			-- This is different from `is_exported_to' where `a_class' can
			-- be a descendant of a class appearing in the list of clients.
			-- Note: The use of 'direct' in the name of this feature has not
			-- the same meaning as 'direct and indirect client' in ETL2 p.91.
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		do
			if not is_empty then
				if clients.has (a_class) then
					Result := has_feature_name (a_name)
				end
			end
		end

feature -- Setting

	set_creation_keyword (a_creation: like creation_keyword) is
			-- Set `creation_keyword' to `a_creation'.
		require
			a_creation_not_void: a_creation /= Void
		do
			creation_keyword := a_creation
		ensure
			creation_keyword_set: creation_keyword = a_creation
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

invariant

	creation_keyword_not_void: creation_keyword /= Void
	clients_not_void: clients /= Void

end
