indexing

	description:

		"Names of Eiffel prefix 'not' features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PREFIX_NOT_NAME

inherit

	ET_PREFIX_NOT

	ET_PREFIX_NAME
		undefine
			is_prefix_not
		end

creation

	make

end
