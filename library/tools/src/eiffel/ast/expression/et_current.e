note

	description:

		"Eiffel current entities"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CURRENT

inherit

	ET_EXPRESSION
		undefine
			first_position,
			last_position,
			break
		redefine
			is_current,
			is_never_void
		end

	ET_KEYWORD
		rename
			make_current as make
		undefine
			is_current,
			is_false
		redefine
			process
		end

create

	make

feature -- Status report

	is_current: BOOLEAN = True
			-- Is current expression the 'Current' entity (possibly parenthesized)?

	is_never_void: BOOLEAN = True
			-- Can current expression never be void?

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_current (Current)
		end

invariant

	is_current: is_current

end
