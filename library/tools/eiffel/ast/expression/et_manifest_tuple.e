indexing

	description:

		"Eiffel manifest tuples"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_MANIFEST_TUPLE

inherit

	ET_EXPRESSION

	ET_EXPRESSION_LIST
		redefine
			process
		end

creation

	make, make_with_capacity

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_manifest_tuple (Current)
		end

end
