note

	description:

		"Eiffel feature call instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_FEATURE_CALL_INSTRUCTION

inherit

	ET_FEATURE_CALL

	ET_INSTRUCTION
		undefine
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test
		end

end
