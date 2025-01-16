note

	description:

		"Eiffel inheritance clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2016, Eric Bezault and others"
	license: "MIT License"

class ET_PARENT_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_PARENT_ITEM]
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new class parent list.
		do
			inherit_keyword := tokens.inherit_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new class parent list with capacity `nb'.
		do
			inherit_keyword := tokens.inherit_keyword
			precursor (nb)
		end

feature -- Initialization

	reset
			-- Reset parents as they were when they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).parent.reset
				i := i + 1
			end
		end

feature -- Status report

	is_conforming: BOOLEAN
			-- Is current parent list a conforming parent clause?
		do
			Result := clients_clause = Void
		ensure
			has_no_clients_clause: Result implies clients_clause = Void
		end

	has_conforming_parent: BOOLEAN
			-- Is current parent list a conforming parent clause
			-- containing at least one parent?
		do
			Result := clients_clause = Void and count > 0
		ensure
			not_empty: Result implies not is_empty
			has_no_clients_clause: Result implies clients_clause = Void
		end

feature -- Access

	parent (i: INTEGER): ET_PARENT
			-- Class parent at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).parent
		ensure
			parent_not_void: Result /= Void
		end

	inherit_keyword: ET_KEYWORD
			-- 'inherit' keyword

	clients_clause: detachable ET_CLIENTS
			-- Clients clause

	first_semicolon: detachable ET_SEMICOLON_SYMBOL
			-- Semicolon before the first parent, if any

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := inherit_keyword.position
			if Result.is_null then
				if attached clients_clause as l_clients_clause then
					Result := l_clients_clause.position
				elseif not is_empty then
					Result := first.position
				elseif attached first_semicolon as l_first_semicolon then
					Result := l_first_semicolon.position
				end
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := inherit_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if not is_empty then
				Result := last.last_leaf
			elseif attached first_semicolon as l_first_semicolon then
				Result := l_first_semicolon.last_leaf
			elseif attached clients_clause as l_clients_clause then
				Result := l_clients_clause.last_leaf
			else
				Result := inherit_keyword
			end
		end

feature -- Setting

	set_inherit_keyword (an_inherit: like inherit_keyword)
			-- Set `inherit_keyword' to `an_inherit'.
		require
			an_inherit_not_void: an_inherit /= Void
		do
			inherit_keyword := an_inherit
		ensure
			inherit_keyword_set: inherit_keyword = an_inherit
		end

	set_clients_clause (a_clients_clause: like clients_clause)
			-- Set `clients_clause' to `a_clients_clause'.
		do
			clients_clause := a_clients_clause
		ensure
			clients_clause_set: clients_clause = a_clients_clause
		end

	set_first_semicolon (a_first_semicolon: like first_semicolon)
			-- Set `first_semicolon' to `a_first_semicolon'.
		do
			first_semicolon := a_first_semicolon
		ensure
			first_semicolon_set: first_semicolon = a_first_semicolon
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_parent_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_PARENT_ITEM]
			-- Fixed array routines
		once
			create Result
		end

invariant

	inherit_keyword_not_void: inherit_keyword /= Void

end
