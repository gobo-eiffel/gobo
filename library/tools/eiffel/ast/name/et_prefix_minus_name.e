indexing

	description:

		"Names of Eiffel prefix '-' features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PREFIX_MINUS_NAME

inherit

	ET_PREFIX_MINUS

	ET_PREFIX_NAME
		undefine
			is_prefix_minus
		end

creation

	make

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_prefix_minus_name (Current)
		end

end
