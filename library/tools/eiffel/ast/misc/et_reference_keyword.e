indexing

	description:

		"Eiffel 'reference' keywords"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_REFERENCE_KEYWORD

inherit

	ET_TYPE_MARK
		redefine
			is_reference
		end

	ET_CLASS_MARK
		undefine
			is_expanded, is_separate
		redefine
			is_reference
		end

creation

	make, make_with_position

feature -- Status report

	is_reference: BOOLEAN is True
			-- Is mark 'reference'?

end
