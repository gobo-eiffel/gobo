indexing

	description:

		"Eiffel ';' symbols"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_SEMICOLON_SYMBOL

inherit

	ET_SYMBOL

	ET_NULL_EXPORT
		redefine
			is_semicolon
		end

	ET_NULL_INSTRUCTION
		undefine
			is_semicolon
		end

creation

	make, make_with_position

feature -- Status report

	is_semicolon: BOOLEAN is True
			-- Is current node a semicolon?

end
