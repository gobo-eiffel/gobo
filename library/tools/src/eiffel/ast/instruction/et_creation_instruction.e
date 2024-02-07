note

	description:

		"Eiffel creation instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_CREATION_INSTRUCTION

inherit

	ET_INSTRUCTION
		undefine
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test
		redefine
			reset
		end

	ET_CREATION_COMPONENT
		redefine
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test
		end

feature -- Initialization

	reset
			-- Reset instruction as it was just after it was last parsed.
		do
			target.reset
			if attached type as l_type then
				l_type.reset
			end
			if attached creation_call as l_creation_call then
				l_creation_call.reset
			end
			if attached default_create_name as l_default_create_name then
				l_default_create_name.reset
			end
			if attached internal_separate_target as l_internal_separate_target then
				l_internal_separate_target.reset
			end
		end

feature -- Access

	target: ET_WRITABLE
			-- Target of the creation

	creation_call: detachable ET_QUALIFIED_CALL
			-- Call to creation procedure

feature -- Status report

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current instruction
			-- or (recursively) in one of its subexpressions?
		do
			Result := target.has_result or
				attached arguments as l_arguments and then l_arguments.has_result
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current instruction
			-- or (recursively) in one of its subexpressions?
		do
			Result := target.has_address_expression or
				attached arguments as l_arguments and then l_arguments.has_address_expression
		end

	has_agent: BOOLEAN
			-- Does an agent appear in current instruction
			-- or (recursively) in one of its subexpressions?
		do
			Result := target.has_agent or
				attached arguments as l_arguments and then l_arguments.has_agent
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current instruction
			-- or (recursively) in one of its subexpressions?
		do
			Result := target.has_typed_object_test or
				attached arguments as l_arguments and then l_arguments.has_typed_object_test
		end

invariant

	target_not_void: target /= Void

end
