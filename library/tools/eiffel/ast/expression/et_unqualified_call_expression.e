note

	description:

		"Eiffel unqualified call expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_UNQUALIFIED_CALL_EXPRESSION

inherit

	ET_UNQUALIFIED_REGULAR_FEATURE_CALL
		undefine
			parenthesis_call
		redefine
			reset
		end

	ET_UNQUALIFIED_FEATURE_CALL_EXPRESSION
		undefine
			reset,
			parenthesis_call
		end

	ET_CALL_EXPRESSION
		undefine
			reset,
			is_qualified_call
		end

create

	make

feature -- Initialization

	reset
			-- Reset call as it was when it was last parsed.
		do
			Precursor {ET_UNQUALIFIED_REGULAR_FEATURE_CALL}
			parenthesis_call := Void
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_unqualified_call_expression (Current)
		end

end
