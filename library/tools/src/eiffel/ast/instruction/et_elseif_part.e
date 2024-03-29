﻿note

	description:

		"Eiffel 'elseif' parts"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

class ET_ELSEIF_PART

inherit

	ET_AST_NODE

create

	make

feature {NONE} -- Initialization

	make (a_conditional: like conditional; a_then_compound: like then_compound)
			-- Create a new elseif part.
		require
			a_conditional_not_void: a_conditional /= Void
		do
			conditional := a_conditional
			then_compound := a_then_compound
		ensure
			conditional_set: conditional = a_conditional
			then_compound_set: then_compound = a_then_compound
		end

feature -- Initialization

	reset
			-- Reset elseif part as it was when it was last parsed.
		do
			expression.reset
			if attached then_compound as l_then_compound then
				l_then_compound.reset
			end
		end

feature -- Access

	conditional: ET_CONDITIONAL
			-- Condition

	expression: ET_EXPRESSION
			-- Boolean expression
		do
			Result := conditional.expression
		ensure
			expression_not_void: Result /= Void
		end

	then_compound: detachable ET_COMPOUND
			-- Then part

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
			if attached then_compound as l_then_compound then
				Result := l_then_compound.last_leaf
			else
				Result := conditional.last_leaf
			end
		end

feature -- Status report

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current elseif part or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			Result := expression.has_result or
				attached then_compound as l_then_compound and then l_then_compound.has_result
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current elseif part or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			Result := expression.has_address_expression or
				attached then_compound as l_then_compound and then l_then_compound.has_address_expression
		end

	has_agent: BOOLEAN
			-- Does an agent appear in current elseif part or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			Result := expression.has_agent or
				attached then_compound as l_then_compound and then l_then_compound.has_agent
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current elseif part or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			Result := expression.has_typed_object_test or
				attached then_compound as l_then_compound and then l_then_compound.has_typed_object_test
		end

	has_inline_separate_instruction: BOOLEAN
			-- Does an inline separate instruction appear in current elseif part or
			-- (recursively) in one of its subinstructions?
		do
			Result := attached then_compound as l_then_compound and then l_then_compound.has_inline_separate_instruction
		end

feature -- Measurement

	nested_instruction_count: INTEGER
			-- Number of instructions contained in current elseif part and
			-- (recursively) in its subinstructions?
		do
			Result := 1
			if attached then_compound as l_then_compound then
				Result := Result + l_then_compound.nested_instruction_count
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_elseif_part (Current)
		end

invariant

	conditional_not_void: conditional /= Void

end
