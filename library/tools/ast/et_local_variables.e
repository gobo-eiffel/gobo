indexing

	description:

		"Eiffel local variable lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_LOCAL_VARIABLES

creation

	make

feature {NONE} -- Initialization

	make (a_name: ET_IDENTIFIER; a_type: ET_TYPE) is
			-- Create a new local variable list with initially
			-- one variable `a_name' of type `a_type'.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			!! variables.make (a_name, a_type)
		ensure
			name_set: variables.name = a_name
			type_set: variables.type = a_type
		end

feature -- Access

	variables: ET_LOCAL_VARIABLE
			-- Local variables

feature -- Element change

	put_first (a_name: ET_IDENTIFIER; a_type: ET_TYPE) is
			-- Add local variable `a_name' with type
			-- `a_type' to local variable list.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		local
			a_variable: like variables
		do
			!! a_variable.make (a_name, a_type)
			a_variable.set_next (variables)
			variables := a_variable
		ensure
			one_more: variables.next = old variables
			name_set: variables.name = a_name
			type_set: variables.type = a_type
		end

	put_name_first (a_name: ET_IDENTIFIER) is
			-- Add local variable `a_name' to variable list
			-- with same type as previously inserted variable.
		require
			a_name_not_void: a_name /= Void
		local
			a_variable: like variables
			a_type: ET_TYPE
		do
			a_type := variables.type
			!! a_variable.make (a_name, a_type)
			a_variable.set_next (variables)
			variables := a_variable
		ensure
			one_more: variables.next = old variables
			name_set: variables.name = a_name
			type_set: variables.type = (old variables).type
		end

invariant

	variables_not_void: variables /= Void

end -- class ET_LOCAL_VARIABLES
