note

	description:
	"[
		Eiffel iteration instructions (either across instructions,
		or repeat instructions).
	]"
	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_ITERATION_INSTRUCTION

inherit

	ET_ITERATION_COMPONENT
		redefine
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			reset
		end

	ET_REPETITION_INSTRUCTION
		redefine
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			reset
		end

feature -- Initialization

	reset
			-- Reset instruction as it was just after it was last parsed.
		do
			if attached from_compound as l_from_compound then
				l_from_compound.reset
			end
			if attached loop_compound as l_loop_compound then
				l_loop_compound.reset
			end
			precursor {ET_ITERATION_COMPONENT}
		end

feature -- Status report

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current iteration instruction
			-- or (recursively) in one of its subexpressions?
		do
			Result := iterable_expression.has_result or
				precursor {ET_REPETITION_INSTRUCTION}
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current iteration instruction
			-- or (recursively) in one of its subexpressions?
		do
			Result := iterable_expression.has_address_expression or
				precursor {ET_REPETITION_INSTRUCTION}
		end

	has_agent: BOOLEAN
			-- Does an agent appear in current iteration instruction
			-- or (recursively) in one of its subexpressions?
		do
			Result := iterable_expression.has_agent or
				precursor {ET_REPETITION_INSTRUCTION}
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current iteration instruction
			-- or (recursively) in one of its subexpressions?
		do
			Result := iterable_expression.has_typed_object_test or
				precursor {ET_REPETITION_INSTRUCTION}
		end

end
