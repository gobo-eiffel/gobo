indexing

	description:

		"Names of Eiffel infix '\\' features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_MOD_NAME

inherit

	ET_INFIX_MOD

	ET_INFIX_NAME
		undefine
			is_infix_mod
		end

creation

	make

end
