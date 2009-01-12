note
	description: "Objects that provide an output in debugger"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	DEBUG_OUTPUT

feature -- Status report

	debug_output: STRING
			-- String that should be displayed in debugger to represent `Current'.
		deferred
		ensure
			result_not_void: Result /= Void
		end

end
