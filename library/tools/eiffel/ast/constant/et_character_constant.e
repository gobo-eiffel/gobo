indexing

	description:

		"Eiffel character constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CHARACTER_CONSTANT

inherit

	ET_CONSTANT
		undefine
			first_position, last_position
		redefine
			is_character_constant
		end

	ET_CHOICE_CONSTANT
		rename
			expression as expression_item
		undefine
			reset, first_position, last_position
		end

	ET_INDEXING_TERM
		undefine
			first_position, last_position
		end

	ET_AST_LEAF
		rename
			make as make_leaf,
			make_with_position as make_leaf_with_position
		end

feature -- Status report

	is_character_constant: BOOLEAN is True
			-- Is current constant a CHARACTER constant?

feature -- Access

	value: CHARACTER
			-- Character value

end
