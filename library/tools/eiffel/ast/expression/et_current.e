indexing

	description:

		"Eiffel current entities"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CURRENT

inherit

	ET_EXPRESSION
		undefine
			first_position, last_position
		end

	ET_KEYWORD
		rename
			make_current as make
		redefine
			process
		end

create

	make

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_current (Current)
		end

invariant

	is_current: is_current

end
