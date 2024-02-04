note

	description:

		"Eiffel loop instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

class ET_LOOP_INSTRUCTION

inherit

	ET_INSTRUCTION
		undefine
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test
		redefine
			reset,
			has_inline_separate_instruction,
			nested_instruction_count
		end

	ET_LOOP_COMPONENT

create

	make

feature {NONE} -- Initialization

	make (a_from_compound: like from_compound;
		an_until_conditional: like until_conditional;
		a_loop_compound: like loop_compound)
			-- Create a new loop instruction.
		require
			an_until_conditional_not_void: an_until_conditional /= Void
		do
			from_compound := a_from_compound
			until_conditional := an_until_conditional
			loop_compound := a_loop_compound
			end_keyword := tokens.end_keyword
		ensure
			from_compound_set: from_compound = a_from_compound
			until_conditional_set: until_conditional = an_until_conditional
			loop_compound_set: loop_compound = a_loop_compound
		end

feature -- Initialization

	reset
			-- Reset instruction as it was just after it was last parsed.
		do
			if attached from_compound as l_from_compound then
				l_from_compound.reset
			end
			if attached invariant_part as l_invariant_part then
				l_invariant_part.reset
			end
			if attached variant_part as l_variant_part then
				l_variant_part.reset
			end
			until_expression.reset
			if attached loop_compound as l_loop_compound then
				l_loop_compound.reset
			end
		end

feature -- Status report

	has_old_variant_syntax: BOOLEAN
			-- Does the variant clause appears after the invariant clause
			-- (instead of before the end keyword as specified in ECMA)?

	has_inline_separate_instruction: BOOLEAN
			-- Does an inline separate instruction appear in current instruction or
			-- (recursively) in one of its subinstructions?
		do
			Result := attached from_compound as l_from_compound and then l_from_compound.has_inline_separate_instruction or
				attached loop_compound as l_loop_compound and then l_loop_compound.has_inline_separate_instruction
		end

feature -- Access

	from_compound: detachable ET_COMPOUND
			-- From compound

	invariant_part: detachable ET_LOOP_INVARIANTS
			-- Invariant part

	variant_part: detachable ET_VARIANT
			-- Variant part

	until_conditional: ET_CONDITIONAL
			-- Until conditional

	until_expression: ET_EXPRESSION
			-- Until boolean expression
		do
			Result := until_conditional.expression
		ensure
			until_expression_not_void: Result /= Void
		end

	loop_compound: detachable ET_COMPOUND
			-- Loop compound

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if attached from_compound as l_from_compound then
				Result := l_from_compound.position
			elseif attached invariant_part as l_invariant_part then
				Result := l_invariant_part.position
			elseif has_old_variant_syntax and then attached variant_part as l_variant_part then
				Result := l_variant_part.position
			else
				Result := until_conditional.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if attached from_compound as l_from_compound then
				Result := l_from_compound.first_leaf
			elseif attached invariant_part as l_invariant_part then
				Result := l_invariant_part.first_leaf
			elseif has_old_variant_syntax and then attached variant_part as l_variant_part then
				Result := l_variant_part.first_leaf
			else
				Result := until_conditional.first_leaf
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := end_keyword
		end

feature -- Measurement

	nested_instruction_count: INTEGER
			-- Number of instructions contained in current instruction and
			-- (recursively) in its subinstructions?
		do
			Result := 1
			if attached from_compound as l_from_compound then
				Result := Result + l_from_compound.nested_instruction_count
			end
			if attached loop_compound as l_loop_compound then
				Result := Result + l_loop_compound.nested_instruction_count
			end
		end

feature -- Status setting

	set_has_old_variant_syntax (b: BOOLEAN)
			-- Set `has_old_variant_syntax' to `b'.
		do
			has_old_variant_syntax := b
		ensure
			has_old_variant_syntax_set: has_old_variant_syntax = b
		end

feature -- Setting

	set_invariant_part (an_invariant: like invariant_part)
			-- Set `invariant_part' to `an_invariant'.
		do
			invariant_part := an_invariant
		ensure
			invariant_part_set: invariant_part = an_invariant
		end

	set_variant_part (a_variant: like variant_part)
			-- Set `variant_part' to `a_variant'.
		do
			variant_part := a_variant
		ensure
			variant_part_set: variant_part = a_variant
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
			a_processor.process_loop_instruction (Current)
		end

invariant

	until_conditional_not_void: until_conditional /= Void
	end_keyword_not_void: end_keyword /= Void

end
