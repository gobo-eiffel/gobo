indexing

	description:

		"Eiffel static call expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_STATIC_CALL_EXPRESSION

inherit

	ET_CALL_EXPRESSION
		rename
			make as make_unqualified_call
		undefine
			position
		end

	ET_STATIC_FEATURE_CALL

creation

	make

end
