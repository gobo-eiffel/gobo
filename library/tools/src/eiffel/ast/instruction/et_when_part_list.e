note

	description:

		"Eiffel lists of inspect when parts"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

class ET_WHEN_PART_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_WHEN_PART]

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

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in one of current when parts or
			-- (recursively) in one of their subinstructions or subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).has_result then
					Result := True
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in one of current when parts or
			-- (recursively) in one of their subinstructions or subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).has_address_expression then
					Result := True
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		end

	has_agent: BOOLEAN
			-- Does an agent appear in one of current when parts or
			-- (recursively) in one of their subinstructions or subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).has_agent then
					Result := True
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		end

	has_typed_object_test: BOOLEAN
			-- Does an typed object-test appear in one of current when parts or
			-- (recursively) in one of their subinstructions or subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).has_typed_object_test then
					Result := True
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		end

	has_inline_separate_instruction: BOOLEAN
			-- Does an inline separate instruction appear in current when parts or
			-- (recursively) in one of their subinstructions?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).has_inline_separate_instruction then
					Result := True
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		end

feature -- Measurement

	nested_instruction_count: INTEGER
			-- Number of instructions contained in current when parts and
			-- (recursively) in their subinstructions?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				Result := Result + storage.item (i).nested_instruction_count
				i := i + 1
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_when_part_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_WHEN_PART]
			-- Fixed array routines
		once
			create Result
		end

end
