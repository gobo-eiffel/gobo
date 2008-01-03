indexing

	description:

		"Eiffel result entities"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_RESULT

inherit

	ET_WRITABLE
		undefine
			first_position, last_position
		redefine
			is_result
		end

	ET_KEYWORD
		rename
			make_result as make
		undefine
			is_current, is_result
		redefine
			process
		end

create

	make

feature -- Status report

	is_result: BOOLEAN is True
			-- Is current expression the 'Result' entity?

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_result (Current)
		end

invariant

	is_result: is_result

end
