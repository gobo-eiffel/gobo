indexing

	description:

		"Eiffel expression lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXPRESSIONS

feature -- Access

	expression (i: INTEGER): ET_EXPRESSION is
			-- Expression at index `i'
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		deferred
		ensure
			expression_not_void: Result /= Void
		end

feature -- Measurement

	count: INTEGER is
			-- Number of expressions
		deferred
		ensure
			count_not_negative: Result >= 0
		end

end
