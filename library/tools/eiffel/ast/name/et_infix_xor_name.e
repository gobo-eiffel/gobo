indexing

	description:

		"Names of Eiffel infix 'xor' features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_XOR_NAME

inherit

	ET_INFIX_XOR

	ET_INFIX_NAME
		undefine
			is_infix_xor
		end

creation

	make

end
