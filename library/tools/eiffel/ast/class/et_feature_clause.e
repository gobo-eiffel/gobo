note

	description:

		"Eiffel feature clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_CLAUSE

inherit

	ET_AST_NODE

create

	make

feature {NONE} -- Initialization

	make (a_clients: like clients)
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

	clients: detachable ET_CLIENT_LIST
			-- Clients

	clients_clause: detachable ET_CLIENTS
			-- Clients clause
		do
			if attached {ET_CLIENTS} clients as l_result then
				Result := l_result
			end
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := feature_keyword.position
			if Result.is_null then
				if attached clients_clause as l_clients_clause then
					Result := l_clients_clause.position
				end
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := feature_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached clients_clause as l_clients_clause then
				Result := l_clients_clause.last_leaf
			else
				Result := feature_keyword
			end
		end

	header_break: detachable ET_BREAK
			-- Break which appears where the header comment is expected
		do
			Result := break
		end

feature -- Status report

	has_header_comment: BOOLEAN
			-- Does current feature clause have a header comment?
		do
			if attached header_break as l_break then
				Result := l_break.has_comment
			end
		end

	has_non_empty_header_comment: BOOLEAN
			-- Does current feature clause have a non-empty header comment?
			-- (Comments only made up of white characters or minus signs are not taken into account.)
		do
			if attached header_break as l_break then
				Result := l_break.has_non_empty_comment
			end
		end

feature -- Setting

	set_feature_keyword (a_feature: like feature_keyword)
			-- Set `feature_keyword' to `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			feature_keyword := a_feature
		ensure
			feature_keyword_set: feature_keyword = a_feature
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_feature_clause (Current)
		end

invariant

	feature_keyword_not_void: feature_keyword /= Void
	clients_not_void: clients /= Void

end
