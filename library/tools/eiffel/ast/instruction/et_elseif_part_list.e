indexing

	description:

		"Eiffel lists of elseif parts"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ELSEIF_PART_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_ELSEIF_PART]

creation

	make, make_with_capacity

feature -- Initialization

	reset is
			-- Reset elseif parts as they were when they were first parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).reset
				i := i + 1
			end
		end

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
			a_processor.process_elseif_part_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_ELSEIF_PART] is
			-- Fixed array routines
		once
			create Result
		end

end
