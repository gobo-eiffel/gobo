indexing

	description:

		"Eiffel binary free operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_FREE_OPERATOR

inherit

	ET_INFIX_FREE

	ET_INFIX_OPERATOR
		undefine
			is_infix_free
		end

	ET_TOKEN
		rename
			text as free_operator_name
		redefine
			process
		end

creation

	make, make_with_position

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_infix_free_operator (Current)
		end

end
