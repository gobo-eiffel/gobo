indexing

	description:

		"Eiffel prefix 'not' feature names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_PREFIX_NOT

inherit

	ET_PREFIX_NAME

creation

	make

feature -- Access

	name: STRING is "prefix %"not%""
			-- Name of feature

	hash_code: INTEGER is 21
			-- Hash code

end -- class ET_PREFIX_NOT
