note

	description:

		"Eiffel inheritance clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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
			-- Reset convert parents as they were when they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).parent.reset
				i := i + 1
			end
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

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := inherit_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
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
			if is_empty then
				Result := inherit_keyword
			else
				Result := last.last_leaf
			end
		end

	break: ET_BREAK
			-- Break which appears just after current node
		do
			if is_empty then
				Result := inherit_keyword.break
			else
				Result := last.break
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
