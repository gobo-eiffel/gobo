note

	description:

		"Eiffel loop components (either loop instructions or across instructions)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2012-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_LOOP_COMPONENT

inherit

	ET_AST_NODE

feature -- Access

	from_compound: detachable ET_COMPOUND
			-- From compound
		deferred
		end

	invariant_part: detachable ET_LOOP_INVARIANTS
			-- Invariant part
		deferred
		end

	variant_part: detachable ET_VARIANT
			-- Variant part
		deferred
		end

	until_conditional: detachable ET_CONDITIONAL
			-- Until conditional
		deferred
		end

	loop_compound: detachable ET_COMPOUND
			-- Loop compound
		deferred
		end

feature -- Status report

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current iteration instruction
			-- or (recursively) in one of its subexpressions?
		do
			Result := attached from_compound as l_from_compound and then l_from_compound.has_result or
				attached loop_compound as l_loop_compound and then l_loop_compound.has_result or
				attached until_conditional as l_until_conditional and then l_until_conditional.expression.has_result or
				attached invariant_part as l_invariant_part and then l_invariant_part.has_result or
				attached variant_part as l_variant_part and then l_variant_part.expression.has_result
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current iteration instruction
			-- or (recursively) in one of its subexpressions?
		do
			Result := attached from_compound as l_from_compound and then l_from_compound.has_address_expression or
				attached loop_compound as l_loop_compound and then l_loop_compound.has_address_expression or
				attached until_conditional as l_until_conditional and then l_until_conditional.expression.has_address_expression or
				attached invariant_part as l_invariant_part and then l_invariant_part.has_address_expression or
				attached variant_part as l_variant_part and then l_variant_part.expression.has_address_expression
		end

	has_agent: BOOLEAN
			-- Does an agent appear in current iteration instruction
			-- or (recursively) in one of its subexpressions?
		do
			Result := attached from_compound as l_from_compound and then l_from_compound.has_agent or
				attached loop_compound as l_loop_compound and then l_loop_compound.has_agent or
				attached until_conditional as l_until_conditional and then l_until_conditional.expression.has_agent or
				attached invariant_part as l_invariant_part and then l_invariant_part.has_agent or
				attached variant_part as l_variant_part and then l_variant_part.expression.has_agent
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current iteration instruction
			-- or (recursively) in one of its subexpressions?
		do
			Result := attached from_compound as l_from_compound and then l_from_compound.has_typed_object_test or
				attached loop_compound as l_loop_compound and then l_loop_compound.has_typed_object_test or
				attached until_conditional as l_until_conditional and then l_until_conditional.expression.has_typed_object_test or
				attached invariant_part as l_invariant_part and then l_invariant_part.has_typed_object_test or
				attached variant_part as l_variant_part and then l_variant_part.expression.has_typed_object_test
		end

end
