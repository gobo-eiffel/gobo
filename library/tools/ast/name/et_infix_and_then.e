indexing

	description:

		"Eiffel infix 'and then' feature names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_INFIX_AND_THEN

inherit

	ET_INFIX_NAME

creation

	make

feature -- Access

	name: STRING is "infix %"and then%""
			-- Name of feature

	hash_code: INTEGER is 2
			-- Hash code

end -- class ET_INFIX_AND_THEN
