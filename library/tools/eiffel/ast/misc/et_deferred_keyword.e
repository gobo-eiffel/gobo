indexing

	description:

		"Eiffel 'deferred' keywords"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DEFERRED_KEYWORD

inherit

	ET_CLASS_MARK
		redefine
			is_deferred
		end

creation

	make, make_with_position

feature -- Status report

	is_deferred: BOOLEAN is True
			-- Is mark 'deferred'?

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_deferred_keyword (Current)
		end

end
