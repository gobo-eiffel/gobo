note

	description:

		"Eiffel assertion lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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

	has_class_assertion: BOOLEAN
			-- Is one of the assertions a class assertion?
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

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_ASSERTION_ITEM]
			-- Fixed array routines
		once
			create Result
		end

end
