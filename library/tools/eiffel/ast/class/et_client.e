indexing

	description:

		"Eiffel client class names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CLIENT

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name) is
			-- Create a new client.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

feature -- Access

	name: ET_IDENTIFIER
			-- Class name

	next: ET_CLIENT
			-- Next client in client list

feature -- Setting

	set_next (a_client: like next) is
			-- Set `next' to `a_client'.
		do
			next := a_client
		ensure
			next_set: next = a_client
		end

end -- class ET_CLIENT
