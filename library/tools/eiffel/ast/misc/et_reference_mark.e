indexing

	description:

		"Eiffel 'reference' type marks"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_REFERENCE_MARK

inherit

	ET_TYPE_MARK
		redefine
			is_reference
		end

creation

	make, make_with_position

feature -- Status report

	is_reference: BOOLEAN is True
			-- Is mark 'reference'?

end -- class ET_REFERENCE_MARK
