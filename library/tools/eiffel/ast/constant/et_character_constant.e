indexing

	description:

		"Eiffel character constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CHARACTER_CONSTANT

inherit

	ET_CONSTANT

	ET_CHOICE_CONSTANT

	ET_AST_LEAF
		rename
			make as make_leaf,
			make_with_position as make_leaf_with_position
		end

creation

end -- class ET_CHARACTER_CONSTANT
