indexing

	description:

		"Names of Eiffel prefix '+' features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PREFIX_PLUS_NAME

inherit

	ET_PREFIX_PLUS

	ET_PREFIX_NAME
		undefine
			is_prefix_plus
		end

creation

	make

end
