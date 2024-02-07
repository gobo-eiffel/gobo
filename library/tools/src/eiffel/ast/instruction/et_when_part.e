note

	description:

		"Eiffel 'when' parts in inspect instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

class ET_WHEN_PART

inherit

	ET_AST_NODE

create

	make

feature {NONE} -- Initialization

	make (a_choices: like choices; a_then_compound: like then_compound)
			-- Create a new when part.
		require
			a_choices_not_void: a_choices /= Void
		do
			choices := a_choices
			then_compound := a_then_compound
		ensure
			choices_set: choices = a_choices
			then_compound_set: then_compound = a_then_compound
		end

feature -- Initialization

	reset
			-- Reset when part as it was when it was last parsed.
		do
			choices.reset
			if attached then_compound as l_then_compound then
				l_then_compound.reset
			end
		end

feature -- Access

	choices: ET_CHOICE_LIST
			-- Choices

	then_compound: detachable ET_COMPOUND
			-- Then part

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := choices.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := choices.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached then_compound as l_then_compound then
				Result := l_then_compound.last_leaf
			else
				Result := choices.last_leaf
			end
		end

feature -- Status report

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current when part or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			Result := choices.has_result or
				attached then_compound as l_then_compound and then l_then_compound.has_result
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current when part or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			Result := choices.has_address_expression or
				attached then_compound as l_then_compound and then l_then_compound.has_address_expression
		end

	has_agent: BOOLEAN
			-- Does an agent appear in current when part or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			Result := choices.has_agent or
				attached then_compound as l_then_compound and then l_then_compound.has_agent
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current when part or
			-- (recursively) in one of its subinstructions or subexpressions?
		do
			Result := choices.has_typed_object_test or
				attached then_compound as l_then_compound and then l_then_compound.has_typed_object_test
		end

	has_inline_separate_instruction: BOOLEAN
			-- Does an inline separate instruction appear in current when part or
			-- (recursively) in one of its subinstructions?
		do
			Result := attached then_compound as l_then_compound and then l_then_compound.has_inline_separate_instruction
		end

feature -- Measurement

	nested_instruction_count: INTEGER
			-- Number of instructions contained in current when part and
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
			a_processor.process_when_part (Current)
		end

invariant

	choices_not_void: choices /= Void

end
