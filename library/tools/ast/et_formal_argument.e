indexing

	description:

		"Eiffel formal arguments"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FORMAL_ARGUMENT

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_type: like type) is
			-- Create a new formal argument.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			name := a_name
			type := a_type
		ensure
			name_set: name = a_name
			type_set: type = a_type
		end

feature -- Access

	name: ET_IDENTIFIER
			-- Name

	type: ET_TYPE
			-- Type

	next: ET_FORMAL_ARGUMENT
			-- Next argument in argument list

feature -- Setting

	set_next (an_argument: like next) is
			-- Set `next' to `an_argument'.
		do
			next := an_argument
		ensure
			next_set: next = an_argument
		end

invariant

	name_not_void: name /= Void
	type_not_void: type /= Void

end -- class ET_FORMAL_ARGUMENT
