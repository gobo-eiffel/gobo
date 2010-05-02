note

	description:

		"Eiffel precursor expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_PRECURSOR_EXPRESSION

inherit

	ET_PRECURSOR

	ET_EXPRESSION
		undefine
			reset
		end

create

	make

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_precursor_expression (Current)
		end

end
