indexing

	description:

		"Eiffel keywords"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_KEYWORD

inherit

	ET_TOKEN
		redefine
			process
		end

creation

	make, make_with_position

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_keyword (Current)
		end

end
