indexing

	description:

		"Eiffel comment assertions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_COMMENT_ASSERTION

inherit

	ET_ASSERTION

creation

	make

feature {NONE} -- Initialization

	make (a_tag: like tag) is
			-- Create a new comment assertion.
		do
			tag := a_tag
		ensure
			tag_set: tag = a_tag
		end

end -- class ET_COMMENT_ASSERTION
