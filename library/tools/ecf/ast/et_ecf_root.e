note

	description:

		"ECF root classes and creation procedures"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ECF_ROOT

feature -- Element change

	fill_root (a_system: ET_ECF_SYSTEM) is
			-- Fill `a_system' with root information.
		require
			a_system_not_void: a_system /= Void
		deferred
		end

end
