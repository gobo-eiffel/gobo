note

	description:

		"Eiffel lists of indexing terms"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_INDEXING_TERM_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_INDEXING_TERM_ITEM]

create

	make, make_with_capacity

feature -- Access

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if not is_empty then
				Result := first.position
			else
				Result := tokens.null_position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			if not is_empty then
				Result := first.first_leaf
			end
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if not is_empty then
				Result := last.last_leaf
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if not is_empty then
				Result := last.break
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_indexing_term_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_INDEXING_TERM_ITEM] is
			-- Fixed array routines
		once
			create Result
		end

end
