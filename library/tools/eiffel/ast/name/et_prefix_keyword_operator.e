indexing

	description:

		"Eiffel prefix operators made up of a keyword"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_PREFIX_KEYWORD_OPERATOR

inherit

	ET_PREFIX_OPERATOR

	ET_TOKEN
		undefine
			process
		end

end
