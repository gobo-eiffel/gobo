indexing

	description:

		"Eiffel 'all' export clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ALL_EXPORT

inherit

	ET_EXPORT

creation

	make

feature {NONE} -- Initialization

	make (a_clients_clause: like clients_clause; an_all: like all_keyword) is
			-- Create a new 'all' export clause.
		require
			a_clients_clause_not_void: a_clients_clause /= Void
			an_all_not_void: an_all /= Void
		do
			clients_clause := a_clients_clause
			all_keyword := an_all
		ensure
			clients_clause_set: clients_clause = a_clients_clause
			all_keyword_set: all_keyword = an_all
		end

feature -- Access

	clients (a_name: ET_FEATURE_NAME): ET_CLIENTS is
			-- Clients for feature `a_name'
		do
			Result := clients_clause
		end

	clients_clause: ET_CLIENTS
			-- Clients clause

	all_keyword: ET_TOKEN
			-- 'all' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := clients_clause.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := all_keyword.break
		end

feature -- Status report

	has_feature_name (a_name: ET_FEATURE_NAME): BOOLEAN is
			-- Is `a_name' listed in current export clause?
		do
			Result := True
		end

invariant

	clients_clause_not_void: clients_clause /= Void
	all_keyword_not_void: all_keyword /= Void

end -- class ET_ALL_EXPORT
