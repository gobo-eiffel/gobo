indexing

	description:

		"Eiffel 'like Current' types"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_LIKE_CURRENT

inherit

	ET_TYPE

creation

	make

feature {NONE} -- Initialization

	make (p: like position) is
			-- Create a new 'like Current' type.
		require
			p_not_void: p /= Void
		do
			position := p
		ensure
			position_set: position = p
		end

feature -- Access

	position: ET_POSITION
			-- Position of keyword 'Current' in source code

invariant

	position_not_void: position /= Void

end -- class ET_LIKE_CURRENT
