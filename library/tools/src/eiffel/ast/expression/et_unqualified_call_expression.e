﻿note

	description:

		"Eiffel unqualified call expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2014-2024, Eric Bezault and others"
	license: "MIT License"

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
			is_qualified_call,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions
		redefine
			reset
		end

create

	make

feature -- Initialization

	reset
			-- Reset call as it was when it was last parsed.
		do
			precursor {ET_CALL_EXPRESSION}
			precursor {ET_UNQUALIFIED_REGULAR_FEATURE_CALL}
			parenthesis_call := Void
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_unqualified_call_expression (Current)
		end

end
