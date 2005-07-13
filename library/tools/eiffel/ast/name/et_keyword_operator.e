indexing

	description:

		"Eiffel keyword operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_KEYWORD_OPERATOR

inherit

	ET_KEYWORD
		rename
			is_infix as is_infix_keyword,
			is_prefix as is_prefix_keyword,
			is_local as is_local_keyword
		undefine
			is_precursor
		redefine
			process
		end

	ET_OPERATOR
		undefine
			first_position, last_position
		end

create

	make_and,
	make_implies,
	make_or,
	make_xor,
	make_not

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_keyword_operator (Current)
		end

end
