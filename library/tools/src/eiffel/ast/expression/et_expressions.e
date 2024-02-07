note

	description:

		"Eiffel expression lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_EXPRESSIONS

feature -- Access

	expression (i: INTEGER): ET_EXPRESSION
			-- Expression at index `i'
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		deferred
		ensure
			expression_not_void: Result /= Void
		end

feature -- Status report

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in one of the current expressions
			-- or (recursively) in one of their subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if expression (i).has_result then
					Result := True
						-- Jump out o fthe loop.
					i := nb
				end
				i := i + 1
			end
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in one of the current expressions
			-- or (recursively) in one of their subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if expression (i).has_address_expression then
					Result := True
						-- Jump out o fthe loop.
					i := nb
				end
				i := i + 1
			end
		end

	has_agent: BOOLEAN
			-- Does an agent appear in one of the current expressions
			-- or (recursively) in one of their subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if expression (i).has_agent then
					Result := True
						-- Jump out o fthe loop.
					i := nb
				end
				i := i + 1
			end
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in one of the current expressions
			-- or (recursively) in one of their subexpressions?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if expression (i).has_typed_object_test then
					Result := True
						-- Jump out o fthe loop.
					i := nb
				end
				i := i + 1
			end
		end

feature -- Measurement

	count: INTEGER
			-- Number of expressions
		deferred
		ensure
			count_not_negative: Result >= 0
		end

end
