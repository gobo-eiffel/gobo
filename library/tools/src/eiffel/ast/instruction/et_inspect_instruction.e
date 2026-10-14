note

	description:

		"Eiffel inspect instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2026, Eric Bezault and others"
	license: "MIT License"

class ET_INSPECT_INSTRUCTION

inherit

	ET_INSTRUCTION
		redefine
			reset,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			has_inline_separate_instruction,
			nested_instruction_count
		end

	ET_INSPECT_COMPONENT
		rename
			else_part as else_compound
		end

create

	make

feature {NONE} -- Initialization

	make (a_conditional: like conditional; a_when_parts: like when_parts)
			-- Create a new inspect instruction.
		require
			a_conditional_not_void: a_conditional /= Void
		do
			conditional := a_conditional
			when_parts := a_when_parts
			end_keyword := tokens.end_keyword
		ensure
			conditional_set: conditional = a_conditional
			when_parts_set: when_parts = a_when_parts
		end

feature -- Initialization

	reset
			-- Reset instruction as it was just after it was last parsed.
		do
			expression.reset
			if attached when_parts as l_when_parts then
				l_when_parts.reset
			end
			if attached else_compound as l_else_compound then
				l_else_compound.reset
			end
		end

feature -- Access

	when_parts: detachable ET_WHEN_COMPOUND_LIST
			-- When parts

	else_compound: detachable ET_COMPOUND
			-- Else part

feature -- Status report

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current instruction or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			Result := expression.has_result or
				attached when_parts as l_when_parts and then l_when_parts.has_result or
				attached else_compound as l_else_compound and then l_else_compound.has_result
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current instruction or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			Result := expression.has_address_expression or
				attached when_parts as l_when_parts and then l_when_parts.has_address_expression or
				attached else_compound as l_else_compound and then l_else_compound.has_address_expression
		end

	has_agent: BOOLEAN
			-- Does an agent appear in current instruction or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			Result := expression.has_agent or
				attached when_parts as l_when_parts and then l_when_parts.has_agent or
				attached else_compound as l_else_compound and then l_else_compound.has_agent
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current instruction or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			Result := expression.has_typed_object_test or
				attached when_parts as l_when_parts and then l_when_parts.has_typed_object_test or
				attached else_compound as l_else_compound and then l_else_compound.has_typed_object_test
		end

	has_inline_separate_instruction: BOOLEAN
			-- Does an inline separate instruction appear in current instruction or
			-- (recursively) in one of its subinstructions?
		do
			Result := attached when_parts as l_when_parts and then l_when_parts.has_inline_separate_instruction or
				attached else_compound as l_else_compound and then l_else_compound.has_inline_separate_instruction
		end

feature -- Measurement

	nested_instruction_count: INTEGER
			-- Number of instructions contained in current instruction and
			-- (recursively) in its subinstructions?
		do
			Result := 1
			if attached when_parts as l_when_parts then
				Result := Result + l_when_parts.nested_instruction_count
			end
			if attached else_compound as l_else_compound then
				Result := Result + l_else_compound.nested_instruction_count
			end
		end

feature -- Setting

	set_else_compound (a_compound: like else_compound)
			-- Set `else_compound' to `a_compound'.
		do
			else_compound := a_compound
		ensure
			else_compound_set: else_compound = a_compound
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_inspect_instruction (Current)
		end

end
