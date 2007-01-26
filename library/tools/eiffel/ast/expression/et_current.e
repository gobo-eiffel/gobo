indexing

	description:

		"Eiffel current entities"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CURRENT

inherit

	ET_EXPRESSION
		undefine
			first_position, last_position
		redefine
			is_current
		end

	ET_KEYWORD
		rename
			make_current as make
		undefine
			is_current
		redefine
			process
		end

create

	make

feature -- Status report

	is_current: BOOLEAN is True
			-- Is current expression the 'Current' entity (possibly parenthesized)?

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_current (Current)
		end

invariant

	is_current: is_current

end
