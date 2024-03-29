﻿note

	description:

		"Eiffel lists of feature clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"

class ET_FEATURE_CLAUSE_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_FEATURE_CLAUSE]

create

	make, make_with_capacity

feature -- Access

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if not is_empty then
				Result := first.position
			else
				Result := tokens.null_position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if not is_empty then
				Result := first.first_leaf
			else
				Result := tokens.null_leaf
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if not is_empty then
				Result := last.last_leaf
			else
				Result := tokens.null_leaf
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_feature_clause_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_FEATURE_CLAUSE]
			-- Fixed array routines
		once
			create Result
		end

end
