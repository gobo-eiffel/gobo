note

	description:

		"Eiffel unqualified feature call expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2014-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_UNQUALIFIED_FEATURE_CALL_EXPRESSION

inherit

	ET_FEATURE_CALL_EXPRESSION
		undefine
			is_qualified_call,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions
		end

	ET_UNQUALIFIED_FEATURE_CALL
		undefine
			parenthesis_call
		end

end
