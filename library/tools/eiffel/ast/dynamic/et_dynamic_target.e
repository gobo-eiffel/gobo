indexing

	description:

		"Eiffel targets when propagating dynamic types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DYNAMIC_TARGET

feature -- Element change

	put_type (a_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM) is
			-- Add `a_type' to current target.
		require
			a_type_not_void: a_type /= Void
			a_system_not_void: a_system /= Void
		deferred
		end

end
