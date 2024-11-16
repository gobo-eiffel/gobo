note

	description:

		"Eiffel lists of 'elseif' parts in 'if' expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2024, Eric Bezault and others"
	license: "MIT License"

class ET_ELSEIF_EXPRESSION_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_ELSEIF_EXPRESSION]

create

	make, make_with_capacity

feature -- Initialization

	reset
			-- Reset elseif parts as they were when they were last parsed.
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
			-- Are all elseif parts instance-free (i.e. not dependent
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

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in one of elseif parts
			-- or (recursively) in one of their subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if item (i).has_result then
					Result := True
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in one of elseif parts
			-- or (recursively) in one of their subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if item (i).has_address_expression then
					Result := True
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		end

	has_agent: BOOLEAN
			-- Does an agent appear in one of elseif parts
			-- or (recursively) in one of their subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if item (i).has_agent then
					Result := True
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test in one of elseif parts
			-- or (recursively) in one of their subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if item (i).has_typed_object_test then
					Result := True
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		end

feature -- Assertions

	add_old_expressions (a_list: DS_ARRAYED_LIST [ET_OLD_EXPRESSION])
			-- Add to `a_list' all old expressions appearing in current elseif parts
			-- and (recursively) in its subexpressions.
		require
			a_list_not_void: a_list /= Void
			no_void_item: not a_list.has_void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				item (i).add_old_expressions (a_list)
				i := i + 1
			end
		ensure
			no_void_item: not a_list.has_void
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_elseif_expression_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_ELSEIF_EXPRESSION]
			-- Fixed array routines
		once
			create Result
		end

end
