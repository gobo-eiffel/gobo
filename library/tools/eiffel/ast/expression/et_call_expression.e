note

	description:

		"Eiffel call expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CALL_EXPRESSION

inherit

	ET_REGULAR_FEATURE_CALL

	ET_FEATURE_CALL_EXPRESSION
		undefine
			parenthesis_call,
			reset
		end

	ET_CHOICE_CONSTANT
		undefine
			reset
		end

create

	make

feature -- Setting

	set_parenthesis_call (a_target: ET_EXPRESSION; a_name: ET_PARENTHESIS_SYMBOL; a_arguments: ET_ACTUAL_ARGUMENT_LIST)
			-- Set `parenthesis_call' with `a_target', `a_name' and `a_arguments'.
		do
			create parenthesis_call.make (a_target, a_name, a_arguments)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_call_expression (Current)
		end

end
