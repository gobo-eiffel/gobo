indexing

	description:

		"Eiffel lists of inspect when parts"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_WHEN_PART_LIST

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_WHEN_PART]

creation

	make, make_with_capacity

feature -- Access

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if not is_empty then
				Result := item (1).position
			else
				Result := tokens.null_position
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if not is_empty then
				Result := item (count).break
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_when_part_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_WHEN_PART] is
			-- Fixed array routines
		once
			create Result
		end

end
