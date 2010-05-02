note
	description: "Ancestor of SPECIAL to perform queries on SPECIAL without knowing its actual generic type."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ABSTRACT_SPECIAL

inherit
	DEBUG_OUTPUT

feature -- Measurement

	count: INTEGER
			-- Count of special area
		deferred
		ensure
			count_non_negative: Result >= 0
		end

feature -- Output

	debug_output: STRING
			-- String that should be displayed in debugger to represent `Current'.
		do
			create Result.make (12)
			Result.append_string ("count=")
			Result.append_integer (count)
		end

end
