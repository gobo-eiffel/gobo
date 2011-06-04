note

	description:

		"Eiffel once routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ONCE_ROUTINE

inherit

	ET_INTERNAL_ROUTINE
		redefine
			is_once
		end

	ET_ONCE_ROUTINE_CLOSURE
		rename
			implementation_closure as implementation_feature
		undefine
			implementation_feature
		end

feature -- Status report

	is_once: BOOLEAN = True
			-- Is current feature a once feature?
			
end
