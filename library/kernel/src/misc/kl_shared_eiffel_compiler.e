note

	description:

		"Shared Eiffel compiler used to compile this program"

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_SHARED_EIFFEL_COMPILER

feature -- Acess

	eiffel_compiler: KL_EIFFEL_COMPILER
			-- Eiffel compiler used to compile this program
		once
			create Result
		ensure
			instance_free: class
			eiffel_compiler_not_void: Result /= Void
		end

end
