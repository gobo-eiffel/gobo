indexing

	description:

		"Eiffel lists of local variables"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_LOCAL_VARIABLE_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_LOCAL_VARIABLE_ITEM]
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make is
			-- Create a new local variable list.
		do
			local_keyword := tokens.local_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new local variable list with capacity `nb'.
		do
			local_keyword := tokens.local_keyword
			precursor (nb)
		end

feature -- Initialization

	reset is
			-- Reset local variables as they were when they were first parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).local_variable.reset
				i := i + 1
			end
		end

feature -- Access

	local_variable (i: INTEGER): ET_LOCAL_VARIABLE is
			-- Local variable at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).local_variable
		ensure
			local_variable_not_void: Result /= Void
		end

	local_keyword: ET_KEYWORD
			-- 'local' keyword

	index_of (a_name: ET_IDENTIFIER): INTEGER is
			-- Index of local variable `a_name';
			-- 0 if it does not exist
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).local_variable.name.same_identifier (a_name) then
					Result := count - i
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			index_large_enough: Result >= 0
			index_small_enough: Result <= count
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := local_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := local_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if is_empty then
				Result := local_keyword
			else
				Result := last.last_leaf
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if is_empty then
				Result := local_keyword.break
			else
				Result := last.break
			end
		end

feature -- Setting

	set_local_keyword (a_local: like local_keyword) is
			-- Set `local_keyword' to `a_local'.
		require
			a_local_not_void: a_local /= Void
		do
			local_keyword := a_local
		ensure
			local_keyword_set: local_keyword = a_local
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_local_variable_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_LOCAL_VARIABLE_ITEM] is
			-- Fixed array routines
		once
			create Result
		end

invariant

	local_keyword_not_void: local_keyword /= Void

end
