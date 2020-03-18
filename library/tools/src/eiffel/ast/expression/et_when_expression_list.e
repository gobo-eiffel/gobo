note

	description:

		"Eiffel lists of 'when' parts in inspect expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_WHEN_EXPRESSION_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_WHEN_EXPRESSION]

create

	make, make_with_capacity

feature -- Initialization

	reset
			-- Reset when parts as they were when they were last parsed.
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

feature -- Status report

	is_instance_free: BOOLEAN
			-- Are all when parts instance-free (i.e. not dependent
			-- on 'Current' or its attributes)?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		local
			i, nb: INTEGER
		do
			Result := True
			nb := count
			from i := 1 until i > nb loop
				if not item (i).is_instance_free then
					Result := False
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_when_expression_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_WHEN_EXPRESSION]
			-- Fixed array routines
		once
			create Result
		end

end
