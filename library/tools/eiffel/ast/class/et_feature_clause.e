indexing

	description:

		"Eiffel feature clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_CLAUSE

inherit

	ET_AST_NODE

create

	make

feature {NONE} -- Initialization

	make (a_clients: like clients) is
			-- Create a new feature clause.
		require
			a_clients_not_void: a_clients /= Void
		do
			feature_keyword := tokens.feature_keyword
			clients := a_clients
		ensure
			clients_set: clients = a_clients
		end

feature -- Access

	feature_keyword: ET_KEYWORD
			-- 'feature' keyword

	clients: ET_CLIENT_LIST
			-- Clients

	clients_clause: ET_CLIENTS is
			-- Clients clause
		do
			Result ?= clients
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		local
			a_clients_clause: ET_CLIENTS
		do
			Result := feature_keyword.position
			if Result.is_null then
				a_clients_clause := clients_clause
				if a_clients_clause /= Void then
					Result := a_clients_clause.position
				end
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := feature_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		local
			a_clients_clause: ET_CLIENTS
		do
			a_clients_clause := clients_clause
			if a_clients_clause /= Void then
				Result := a_clients_clause.last_leaf
			else
				Result := feature_keyword
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		local
			a_clients_clause: ET_CLIENTS
		do
			a_clients_clause := clients_clause
			if a_clients_clause /= Void then
				Result := a_clients_clause.break
			else
				Result := feature_keyword.break
			end
		end

	header_break: ET_BREAK is
			-- Break which appears where the header comment is expected
		do
			Result := break
		end

feature -- Status report

	has_header_comment: BOOLEAN is
			-- Does current feature clause have a header comment?
		local
			a_break: like break
		do
			a_break := header_break
			if a_break /= Void then
				Result := a_break.has_comment
			end
		end

	has_non_empty_header_comment: BOOLEAN is
			-- Does current feature clause have a non-empty header comment?
			-- (Comments only made up of white characters or minus signs are not taken into account.)
		local
			a_break: like break
		do
			a_break := header_break
			if a_break /= Void then
				Result := a_break.has_non_empty_comment
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

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_feature_clause (Current)
		end

invariant

	feature_keyword_not_void: feature_keyword /= Void
	clients_not_void: clients /= Void

end
