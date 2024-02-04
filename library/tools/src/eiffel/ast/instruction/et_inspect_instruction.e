note

	description:

		"Eiffel inspect instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
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

	conditional: ET_CONDITIONAL
			-- Condition

	expression: ET_EXPRESSION
			-- Inspected expression
		do
			Result := conditional.expression
		ensure
			expression_not_void: Result /= Void
		end

	when_parts: detachable ET_WHEN_PART_LIST
			-- When parts

	else_compound: detachable ET_COMPOUND
			-- Else part

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := conditional.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := conditional.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := end_keyword
		end

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

	set_end_keyword (an_end: like end_keyword)
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_inspect_instruction (Current)
		end

invariant

	conditional_not_void: conditional /= Void
	end_keyword_not_void: end_keyword /= Void

end
