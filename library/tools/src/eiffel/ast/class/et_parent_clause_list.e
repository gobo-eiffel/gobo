note

	description:

		"Eiffel lists of inheritance clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"

class ET_PARENT_CLAUSE_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_PARENT_LIST]

create

	make, make_with_capacity

feature -- Initialization

	reset
			-- Reset parents as they were when they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).reset
				i := i + 1
			end
		end

feature -- Status report

	has_conforming_parent: BOOLEAN
			-- Do current parent clauses contain at least one conforming parent?
		local
			i: INTEGER
		do
			from
				i := count - 1
			until
				i < 0
			loop
				if storage.item (i).has_conforming_parent then
					Result := True
						-- Jump out of the loop.
					i := 0
				end
				i := i - 1
			end
		ensure
			definition: Result = there_exists (agent {ET_PARENT_LIST}.has_conforming_parent)
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

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_parent_clause_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_PARENT_LIST]
			-- Fixed array routines
		once
			create Result
		end

end
