note

	description:

		"Eiffel call expressions with actual arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_CALL_EXPRESSION_WITH_ACTUAL_ARGUMENTS

inherit

	ET_CALL_WITH_ACTUAL_ARGUMENTS

	ET_EXPRESSION
		undefine
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions
		end

end
