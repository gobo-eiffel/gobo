indexing

	description:

		"Shared Eiffel compiler used to compiled this program"

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class KL_SHARED_EIFFEL_COMPILER

feature -- Acess

	eiffel_compiler: KL_EIFFEL_COMPILER is
			-- Eiffel compiler used to compile this program
		once
			!! Result
		ensure
			eiffel_compiler_not_void: Result /= Void
		end

end -- class KL_SHARED_EIFFEL_COMPILER
