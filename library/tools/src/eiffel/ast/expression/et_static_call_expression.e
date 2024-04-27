note

	description:

		"Eiffel static call expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

class ET_STATIC_CALL_EXPRESSION

inherit

	ET_STATIC_FEATURE_CALL
		redefine
			parenthesis_call
		end

	ET_CALL_EXPRESSION_WITH_ACTUAL_ARGUMENT_LIST
		undefine
			reset,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test
		end

	ET_CHOICE_CONSTANT
		undefine
			reset,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test
		end

create

	make

feature -- Access

	parenthesis_call: detachable ET_PARENTHESIS_EXPRESSION
			-- <Precursor>

feature -- Setting

	set_parenthesis_call (a_target: ET_EXPRESSION; a_name: ET_PARENTHESIS_SYMBOL; a_arguments: ET_ACTUAL_ARGUMENT_LIST)
			-- <Precursor>
		do
			create parenthesis_call.make (a_target, a_name, a_arguments)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_static_call_expression (Current)
		end

end
