indexing

	description:

		"Eiffel infix feature names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_INFIX_NAME

inherit

	ET_FEATURE_NAME
		redefine
			is_infix
		end

feature {NONE} -- Initialization

	make (a_position: like position) is
			-- Create a new infix feature name.
		require
			a_position_not_void: a_position /= Void
		do
			position := a_position
		ensure
			position_set: position = a_position
		end

feature -- Status report

	is_infix: BOOLEAN is True
			-- Is current feature name of the form 'infix ...'?

end -- class ET_INFIX_NAME
