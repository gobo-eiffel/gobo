note

	description:

		"Eiffel assertion lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_ASSERTIONS

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_ASSERTION_ITEM]

feature -- Initialization

	reset
			-- Reset assertions as they were just after they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).assertion.reset
				i := i + 1
			end
		end

feature -- Status report

	has_false: BOOLEAN
			-- Is there at least one assertion expression which is the 'False' entity (possibly parenthesized)?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if attached assertion (i).expression as l_expression then
					if l_expression.is_false then
						Result := True
							-- Jump out of the loop.
						i := nb
					end
				end
				i := i + 1
			end
		end

	are_all_true: BOOLEAN
			-- Are all assertion expressions, if any, the 'True' entity (possibly parenthesized)?
		local
			i, nb: INTEGER
		do
			Result := True
			nb := count
			from i := 1 until i > nb loop
				if attached assertion (i).expression as l_expression then
					if not l_expression.is_true then
						Result := False
							-- Jump out of the loop.
						i := nb
					end
				end
				i := i + 1
			end
		end

	is_instance_free: BOOLEAN
			-- Are all assertion expressions instance-free (i.e. not dependent
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
				if attached assertion (i).expression as l_expression then
					if not l_expression.is_instance_free then
						Result := False
							-- Jump out of the loop.
						i := nb
					end
				end
				i := i + 1
			end
		end

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in one of the current assertions
			-- or (recursively) in one of their subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if attached assertion (i).expression as l_expression then
					if l_expression.has_result then
						Result := True
							-- Jump out of the loop.
						i := nb
					end
				end
				i := i + 1
			end
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in one of the current assertions
			-- or (recursively) in one of their subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if attached assertion (i).expression as l_expression then
					if l_expression.has_address_expression then
						Result := True
							-- Jump out of the loop.
						i := nb
					end
				end
				i := i + 1
			end
		end

	has_agent: BOOLEAN
			-- Does an agent appear in one of the current assertions
			-- or (recursively) in one of their subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if attached assertion (i).expression as l_expression then
					if l_expression.has_agent then
						Result := True
							-- Jump out of the loop.
						i := nb
					end
				end
				i := i + 1
			end
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in one of the current assertions
			-- or (recursively) in one of their subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if attached assertion (i).expression as l_expression then
					if l_expression.has_typed_object_test then
						Result := True
							-- Jump out of the loop.
						i := nb
					end
				end
				i := i + 1
			end
		end

	has_class_assertion: BOOLEAN
			-- Is one of the assertions a 'class' assertion?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if assertion (i).is_class_assertion then
					Result := True
						-- Jump out of the loop.
					i := nb
				end
				i := i + 1
			end
		end

feature -- Access

	first_semicolon: detachable ET_SEMICOLON_SYMBOL
			-- Semicolon before the first assertion, if any

	assertion (i: INTEGER): ET_ASSERTION
			-- Assertion at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).assertion
		ensure
			assertion_not_void: Result /= Void
		end

feature -- Setting

	set_first_semicolon (a_first_semicolon: like first_semicolon)
			-- Set `first_semicolon' to `a_first_semicolon'.
		do
			first_semicolon := a_first_semicolon
		ensure
			first_semicolon_set: first_semicolon = a_first_semicolon
		end

feature -- Element change

	add_old_expressions (a_list: DS_ARRAYED_LIST [ET_OLD_EXPRESSION])
			-- Add to `a_list' all old expressions appearing in current assertions
			-- and (recursively) in their subexpressions.
		require
			a_list_not_void: a_list /= Void
			no_void_item: not a_list.has_void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if attached assertion (i).expression as l_expression then
					l_expression.add_old_expressions (a_list)
				end
				i := i + 1
			end
		ensure
			no_void_item: not a_list.has_void
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_ASSERTION_ITEM]
			-- Fixed array routines
		once
			create Result
		end

end
