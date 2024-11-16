note

	description:

		"Eiffel actual argument operand lists (either feature call or agent actual arguments)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_ARGUMENT_OPERANDS

feature -- Status report

	is_one_argument: BOOLEAN
			-- Is there exactly one argument?
		do
			Result := (count = 1)
		ensure
			definition: Result = (count = 1)
		end

	is_empty: BOOLEAN
			-- Is there no actual argument?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

	valid_index (i: INTEGER): BOOLEAN
			-- Is `i' a valid index?
		do
			Result := i >= 1 and i <= count
		ensure
			definition: Result = (i >= 1 and i <= count)
		end

	is_instance_free: BOOLEAN
			-- Are all arguments instance-free (i.e. not dependent
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
				if not actual_argument (i).is_instance_free then
					Result := False
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		end

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in one of the current operands
			-- or (recursively) in one of their subexpressions?
		deferred
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in one of the current operands
			-- or (recursively) in one of their subexpressions?
		deferred
		end

	has_agent: BOOLEAN
			-- Does an agent appear in one of the current operands
			-- or (recursively) in one of their subexpressions?
		deferred
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in one of the current operands
			-- or (recursively) in one of their subexpressions?
		deferred
		end

feature -- Access

	actual_argument (i: INTEGER): ET_ARGUMENT_OPERAND
			-- Actual argument at index `i'
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		deferred
		ensure
			actual_argument_not_void: Result /= Void
		end

feature -- Measurement

	count: INTEGER
			-- Number of operands
		deferred
		ensure
			count_non_negative: Result >= 0
		end

feature -- Assertions

	add_old_expressions (a_list: DS_ARRAYED_LIST [ET_OLD_EXPRESSION])
			-- Add to `a_list' all old expressions appearing in current operands
			-- and (recursively) in its subexpressions.
		require
			a_list_not_void: a_list /= Void
			no_void_item: not a_list.has_void
		deferred
		ensure
			no_void_item: not a_list.has_void
		end

end
