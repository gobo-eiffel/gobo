note

	description:

		"Eiffel actual argument operand lists (either feature call or agent actual arguments)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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
			-- Number of actual arguments
		deferred
		ensure
			count_non_negative: Result >= 0
		end

end
