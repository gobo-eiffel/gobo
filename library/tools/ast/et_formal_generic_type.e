indexing

	description:

		"Eiffel formal generic parameters"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FORMAL_GENERIC_TYPE

inherit

	ET_TYPE

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_constraint: like constraint) is
			-- Create a new formal generic type.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
			constraint := a_constraint
		ensure
			name_set: name = a_name
			constraint_set: constraint = a_constraint
		end

feature -- Access

	name: ET_IDENTIFIER
			-- Name

	constraint: ET_TYPE
			-- Generic constraint

	position: INTEGER
			-- Position in the list of generic parameters

feature -- Setting

	set_position (a_position: INTEGER) is
			-- Set `position' to `a_position'.
		do
			position := a_position
		ensure
			position_set: position = a_position
		end

invariant

	name_not_void: name /= Void

end -- class ET_FORMAL_GENERIC_TYPE
