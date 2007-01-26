indexing

	description:

		"Shared Xace option names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SHARED_XACE_OPTION_NAMES

feature -- Access

	options: ET_XACE_OPTION_NAMES is
			-- Option names
		once
			create Result
		ensure
			options_not_void: Result /= Void
		end

end
