indexing

	description:

		"Eiffel qualified precursor expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUALIFIED_PRECURSOR_EXPRESSION

inherit

	ET_PRECURSOR_EXPRESSION
		rename
			make as make_unqualfied_precursor
		undefine
			parent, position, break
		end

	ET_QUALIFIED_PRECURSOR

creation

	make

end -- class ET_QUALIFIED_PRECURSOR_EXPRESSION
