note

	description:

		"Eiffel qualified feature call instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2014-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_QUALIFIED_FEATURE_CALL_INSTRUCTION

inherit

	ET_FEATURE_CALL_INSTRUCTION
		undefine
			is_qualified_call,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions
		redefine
			target
		end

	ET_QUALIFIED_FEATURE_CALL
		redefine
			target
		end

feature -- Access

	target: ET_EXPRESSION
			-- Target
		deferred
		end

end
