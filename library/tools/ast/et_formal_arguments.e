indexing

	description:

		"Eiffel formal argument lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FORMAL_ARGUMENTS

creation

	make

feature {NONE} -- Initialization

	make (a_name: ET_IDENTIFIER; a_type: ET_TYPE) is
			-- Create a new formal argument list with initially
			-- one argument `a_name' of type `a_type'.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			!! arguments.make (a_name, a_type)
		ensure
			name_set: arguments.name = a_name
			type_set: arguments.type = a_type
		end

feature -- Access

	arguments: ET_FORMAL_ARGUMENT
			-- Arguments

feature -- Element change

	put_first (a_name: ET_IDENTIFIER; a_type: ET_TYPE) is
			-- Add formal argument `a_name' with type
			-- `a_type' to argument list.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		local
			an_argument: like arguments
		do
			!! an_argument.make (a_name, a_type)
			an_argument.set_next (arguments)
			arguments := an_argument
		ensure
			one_more: arguments.next = old arguments
			name_set: arguments.name = a_name
			type_set: arguments.type = a_type
		end

	put_name_first (a_name: ET_IDENTIFIER) is
			-- Add formal argument `a_name' to argument list
			-- with same type as previously inserted argument.
		require
			a_name_not_void: a_name /= Void
		local
			an_argument: like arguments
			a_type: ET_TYPE
		do
			a_type := arguments.type
			!! an_argument.make (a_name, a_type)
			an_argument.set_next (arguments)
			arguments := an_argument
		ensure
			one_more: arguments.next = old arguments
			name_set: arguments.name = a_name
			type_set: arguments.type = (old arguments).type
		end

invariant

	arguments_not_void: arguments /= Void

end -- class ET_FORMAL_ARGUMENTS
