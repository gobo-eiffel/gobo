indexing

	description:

		"Eiffel formal generic parameters"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FORMAL_GENERIC_PARAMETER

inherit

	HASHABLE

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_constraint: like constraint) is
			-- Create a new formal generic parameter.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
			constraint := a_constraint
			index := 1
		ensure
			name_set: name = a_name
			constraint_set: constraint = a_constraint
		end

feature -- Access

	name: ET_IDENTIFIER
			-- Name

	constraint: ET_TYPE
			-- Generic constraint

	index: INTEGER
			-- Position in list of generic parameters

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := index
		end

feature -- Setting

	set_constraint (a_constraint: like constraint) is
			-- Set `a_constraint' to `constraint'.
		do
			constraint := a_constraint
		ensure
			constraint_set: constraint = a_constraint
		end

	set_index (an_index: INTEGER) is
			-- Set `index' to `an_index'.
		require
			an_index_positive: an_index >= 1
		do
			index := an_index
		ensure
			index_set: index = an_index
		end

invariant

	name_not_void: name /= Void
	index_positive: index >= 1

end -- class ET_FORMAL_GENERIC_PARAMETER
