note

	description: "[
		Eiffel repetition instructions (either across instructions,
		repeat instructions or loop instructions).
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2012-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_REPETITION_INSTRUCTION

inherit

	ET_REPETITION_COMPONENT
		redefine
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test
		end

	ET_INSTRUCTION
		redefine
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test
		end

feature -- Access

	from_compound: detachable ET_COMPOUND
			-- From compound
		deferred
		end

	loop_compound: detachable ET_COMPOUND
			-- Loop compound
		deferred
		end

feature -- Status report

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current repetition instruction
			-- or (recursively) in one of its subexpressions?
		do
			Result := attached from_compound as l_from_compound and then l_from_compound.has_result or
				attached loop_compound as l_loop_compound and then l_loop_compound.has_result or
				precursor {ET_REPETITION_COMPONENT}
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current repetition instruction
			-- or (recursively) in one of its subexpressions?
		do
			Result := attached from_compound as l_from_compound and then l_from_compound.has_address_expression or
				attached loop_compound as l_loop_compound and then l_loop_compound.has_address_expression or
				precursor {ET_REPETITION_COMPONENT}
		end

	has_agent: BOOLEAN
			-- Does an agent appear in current repetition instruction
			-- or (recursively) in one of its subexpressions?
		do
			Result := attached from_compound as l_from_compound and then l_from_compound.has_agent or
				attached loop_compound as l_loop_compound and then l_loop_compound.has_agent or
				precursor {ET_REPETITION_COMPONENT}
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current repetition instruction
			-- or (recursively) in one of its subexpressions?
		do
			Result := attached from_compound as l_from_compound and then l_from_compound.has_typed_object_test or
				attached loop_compound as l_loop_compound and then l_loop_compound.has_typed_object_test or
				precursor {ET_REPETITION_COMPONENT}
		end

end
