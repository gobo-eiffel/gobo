indexing

	description:

		"Lexical analyzer description overriders"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class LX_DESCRIPTION_OVERRIDER

feature -- Basic operations

	override_description (a_description: LX_DESCRIPTION) is
			-- Override values specified in `a_description'.
		require
			a_description_not_void: a_description /= Void
		deferred
		end

end -- class LX_DESCRIPTION_OVERRIDER
