note

	description:

		"Eiffel instruction compounds"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

class ET_COMPOUND

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_INSTRUCTION]
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new compound.
		do
			keyword := tokens.do_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new compound with capacity `nb'.
		do
			keyword := tokens.do_keyword
			precursor (nb)
		end

feature -- Initialization

	reset
			-- Reset instructions as they were when they were last parsed.
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

	has_non_null_instruction: BOOLEAN
			-- Does current compound contain at least one non-null instruction?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if not attached {ET_NULL_INSTRUCTION} storage.item (i) then
					Result := True
						-- Jump out of the loop.
					i := nb + 1
				end
				i := i + 1
			end
		end

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in one of the instructions
			-- or (recursively) in one of their subinstructions or subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).has_result then
					Result := True
						-- Jump out of the loop.
					i := nb + 1
				end
				i := i + 1
			end
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in one of the instructions
			-- or (recursively) in one of their subinstructions or subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).has_address_expression then
					Result := True
						-- Jump out of the loop.
					i := nb + 1
				end
				i := i + 1
			end
		end

	has_agent: BOOLEAN
			-- Does an agent appear in one of the instructions
			-- or (recursively) in one of their subinstructions or subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).has_agent then
					Result := True
						-- Jump out of the loop.
					i := nb + 1
				end
				i := i + 1
			end
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in one of the instructions
			-- or (recursively) in one of their subinstructions or subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).has_typed_object_test then
					Result := True
						-- Jump out of the loop.
					i := nb + 1
				end
				i := i + 1
			end
		end

	has_inline_separate_instruction: BOOLEAN
			-- Does an inline separate instruction appear in current compound or
			-- (recursively) in one of its subinstructions?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).has_inline_separate_instruction then
					Result := True
						-- Jump out of the loop.
					i := nb + 1
				end
				i := i + 1
			end
		end

feature -- Access

	keyword: ET_KEYWORD
			-- Keyword preceding the list of instructions

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if is_empty then
				Result := keyword
			else
				Result := last.last_leaf
			end
		end

feature -- Measurement

	nested_instruction_count: INTEGER
			-- Number of instructions contained in current compound and
			-- (recursively) in its subinstructions?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				Result := Result + storage.item (i).nested_instruction_count
				i := i + 1
			end
		end

feature -- Setting

	set_keyword (a_keyword: like keyword)
			-- Set `keyword' to `a_keyword'.
		require
			a_keyword_not_void: a_keyword /= Void
		do
			keyword := a_keyword
		ensure
			keyword_set: keyword = a_keyword
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_compound (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_INSTRUCTION]
			-- Fixed array routines
		once
			create Result
		end

invariant

	keyword_not_void: keyword /= Void

end
