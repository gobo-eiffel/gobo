indexing

	description:

		"Eiffel 'like Identifier' types"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_LIKE_IDENTIFIER

inherit

	ET_TYPE

creation

	make

feature {NONE} -- Initialization

	make (an_id: like identifier) is
			-- Create a new 'like Identifier' type.
		require
			an_id_not_void: an_id /= Void
		do
			identifier := an_id
		ensure
			identifier_set: identifier = an_id
		end

feature -- Access

	identifier: ET_IDENTIFIER
			-- Name of the feature or argument
			-- associated with current type

invariant

	identifier_not_void: identifier /= Void

end -- class ET_LIKE_IDENTIFIER
