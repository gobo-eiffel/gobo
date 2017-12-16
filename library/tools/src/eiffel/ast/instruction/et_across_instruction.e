note

	description:

		"Eiffel across instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2012-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ACROSS_INSTRUCTION

inherit

	ET_INSTRUCTION
		redefine
			reset
		end

	ET_LOOP_COMPONENT

	ET_ACROSS_COMPONENT

create

	make

feature {NONE} -- Initialization

	make (a_iterable_expression: like iterable_expression;
		a_cursor_name: like cursor_name;
		a_from_compound: like from_compound;
		an_until_conditional: like until_conditional;
		a_loop_compound: like loop_compound)
			-- Create a new across instruction.
		require
			a_iterable_expression_not_void: a_iterable_expression /= Void
			a_cursor_name_not_void: a_cursor_name /= Void
		do
			across_keyword := tokens.across_keyword
			iterable_expression := a_iterable_expression
			as_keyword := tokens.as_keyword
			cursor_name := a_cursor_name
			from_compound := a_from_compound
			until_conditional := an_until_conditional
			loop_compound := a_loop_compound
			end_keyword := tokens.end_keyword
			create_unfolded_form
		ensure
			iterable_expression_set: iterable_expression = a_iterable_expression
			cursor_name_set: cursor_name = a_cursor_name
			from_compound_set: from_compound = a_from_compound
			until_conditional_set: until_conditional = an_until_conditional
			loop_compound_set: loop_compound = a_loop_compound
		end

feature -- Initialization

	reset
			-- Reset instruction as it was just after it was last parsed.
		do
			iterable_expression.reset
			if attached from_compound as l_from_compound then
				l_from_compound.reset
			end
			if attached invariant_part as l_invariant_part then
				l_invariant_part.reset
			end
			if attached variant_part as l_variant_part then
				l_variant_part.reset
			end
			if attached until_conditional as l_until_conditional then
				l_until_conditional.expression.reset
			end
			if attached loop_compound as l_loop_compound then
				l_loop_compound.reset
			end
			reset_unfolded_form
		end

feature -- Access

	from_compound: detachable ET_COMPOUND
			-- From compound

	invariant_part: detachable ET_LOOP_INVARIANTS
			-- Invariant part

	variant_part: detachable ET_VARIANT
			-- Variant part

	until_conditional: detachable ET_CONDITIONAL
			-- Until conditional

	loop_compound: detachable ET_COMPOUND
			-- Loop compound

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if not across_keyword.position.is_null then
				Result := across_keyword.position
			else
				Result := iterable_expression.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := across_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := end_keyword
		end

feature -- Setting

	set_from_compound (a_compound: like from_compound)
			-- Set `from_compound' to `a_compound'.
		do
			from_compound := a_compound
		ensure
			from_compound_set: from_compound = a_compound
		end

	set_loop_compound (a_compound: like loop_compound)
			-- Set `loop_compound' to `a_compound'.
		do
			loop_compound := a_compound
		ensure
			loop_compound_set: loop_compound = a_compound
		end

	set_until_conditional (a_conditional: like until_conditional)
			-- Set `until_conditional' to `a_conditional'.
		do
			until_conditional := a_conditional
		ensure
			until_conditional_set: until_conditional = a_conditional
		end

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
			a_processor.process_across_instruction (Current)
		end

invariant

	end_keyword_not_void: end_keyword /= Void

end
