indexing

	description:

		"Eiffel '=' symbols"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_EQUAL_SYMBOL

inherit

	ET_EQUALITY_SYMBOL

creation

	make, make_with_position

feature -- Status report

	is_not_equal: BOOLEAN is False
			-- Is symbol '/='?

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_equal_symbol (Current)
		end

end
