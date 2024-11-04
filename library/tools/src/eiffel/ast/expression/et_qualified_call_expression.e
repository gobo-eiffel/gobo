note

	description:

		"Eiffel qualified call expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2014-2024, Eric Bezault and others"
	license: "MIT License"

class ET_QUALIFIED_CALL_EXPRESSION

inherit

	ET_QUALIFIED_REGULAR_FEATURE_CALL
		undefine
			parenthesis_call
		redefine
			reset
		end

	ET_QUALIFIED_FEATURE_CALL_EXPRESSION
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
			add_old_expressions,
			add_separate_arguments
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
			precursor {ET_QUALIFIED_REGULAR_FEATURE_CALL}
			parenthesis_call := Void
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_qualified_call_expression (Current)
		end

end
