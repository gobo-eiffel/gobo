indexing

	description:

		"Eiffel 'separate' keywords"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_SEPARATE_KEYWORD

inherit

	ET_TYPE_MARK
		redefine
			is_separate
		end

	ET_CLASS_MARK
		undefine
			is_expanded, is_reference
		redefine
			is_separate
		end

creation

	make, make_with_position

feature -- Status report

	is_separate: BOOLEAN is True
			-- Is mark 'separate'?

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_separate_keyword (Current)
		end

end
