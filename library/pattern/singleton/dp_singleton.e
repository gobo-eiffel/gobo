indexing

	description: "Singleton base class."
	thanks: "Thanks to Design Patterns and Contracts."

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2002, Berend de Boer and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


deferred class

	DP_SINGLETON


feature {NONE} -- Access

	singleton: DP_SINGLETON is
			-- Effect this as a (frozen) once routine. It should return
			-- `Current'.
		deferred
		end


invariant

	remain_single: Current = singleton

end
