indexing

	description:

		"Shared Eiffel token and symbol constants"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_SHARED_TOKEN_CONSTANTS

feature -- Access

	tokens: ET_TOKEN_CONSTANTS is
			-- Shared token and symbol constants
		once
			!! Result
		ensure
			tokens_not_void: Result /= Void
		end

end -- class ET_SHARED_TOKEN_CONSTANTS
