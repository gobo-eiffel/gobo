﻿note

	description:

		"Eiffel result entities"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2016, Eric Bezault and others"
	license: "MIT License"

class ET_RESULT

inherit

	ET_WRITABLE
		undefine
			first_position,
			last_position,
			break
		redefine
			is_result,
			has_result
		end

	ET_KEYWORD
		rename
			make_result as make
		undefine
			is_current,
			is_false,
			is_true,
			is_result
		redefine
			process
		end

create

	make

feature -- Status report

	is_result: BOOLEAN = True
			-- Is current expression the 'Result' entity?

	has_result: BOOLEAN = True
			-- Does the entity 'Result' appear in current expression
			-- or (recursively) in one of its subexpressions?

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_result (Current)
		end

invariant

	is_result: is_result

end
