indexing

	description:

		"Eiffel infix operators made up of symbols"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INFIX_SYMBOL_OPERATOR

inherit

	ET_INFIX_OPERATOR

	ET_SYMBOL
		undefine
			process
		end

end
