indexing

	description:

		"Eiffel formal arguments whose names are followed by a colon"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_COLON_FORMAL_ARGUMENT

inherit

	ET_FORMAL_ARGUMENT

creation

	make

feature -- Access

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := type.break
		end

feature -- Duplication

	cloned_argument: like Current is
			-- Cloned formal argument;
			-- Do not recursively clone the type
		do
			!! Result.make (name_item, type)
		end

end -- class ET_COLON_FORMAL_ARGUMENT
