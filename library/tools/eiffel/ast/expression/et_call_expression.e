indexing

	description:

		"Eiffel call expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CALL_EXPRESSION

inherit

	ET_FEATURE_CALL
	ET_EXPRESSION
	ET_CHOICE_CONSTANT

creation

	make

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_call_expression (Current)
		end

end
