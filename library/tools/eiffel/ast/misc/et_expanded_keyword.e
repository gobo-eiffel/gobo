indexing

	description:

		"Eiffel 'expanded' keywords"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXPANDED_KEYWORD

inherit

	ET_TYPE_MARK
		redefine
			is_expanded
		end

	ET_CLASS_MARK
		undefine
			is_reference, is_separate
		redefine
			is_expanded
		end

creation

	make, make_with_position

feature -- Status report

	is_expanded: BOOLEAN is True
			-- Is mark 'expanded'?

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_expanded_keyword (Current)
		end

end
