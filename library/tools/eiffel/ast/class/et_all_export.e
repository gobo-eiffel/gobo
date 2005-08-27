indexing

	description:

		"Eiffel 'all' export clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ALL_EXPORT

inherit

	ET_EXPORT
		redefine
			is_all
		end

create

	make

feature {NONE} -- Initialization

	make (a_clients_clause: like clients_clause) is
			-- Create a new 'all' export clause.
		require
			a_clients_clause_not_void: a_clients_clause /= Void
		do
			clients_clause := a_clients_clause
			all_keyword := tokens.all_keyword
		ensure
			clients_clause_set: clients_clause = a_clients_clause
		end

feature -- Access

	clients (a_name: ET_FEATURE_NAME): ET_CLIENTS is
			-- Clients for feature `a_name'
		do
			Result := clients_clause
		end

	clients_clause: ET_CLIENTS
			-- Clients clause

	all_keyword: ET_KEYWORD
			-- 'all' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := clients_clause.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := clients_clause.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := all_keyword
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

	is_all: BOOLEAN is True
			-- Is current export clause of the form 'export {CLIENT} all'?

feature -- Setting

	set_all_keyword (an_all: like all_keyword) is
			-- Set `all_keyword' to `an_all'.
		require
			an_all_not_void: an_all /= Void
		do
			all_keyword := an_all
		ensure
			all_keyword_set: all_keyword = an_all
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_all_export (Current)
		end

invariant

	clients_clause_not_void: clients_clause /= Void
	all_keyword_not_void: all_keyword /= Void

end
