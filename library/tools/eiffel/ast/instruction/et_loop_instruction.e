indexing

	description:

		"Eiffel loop instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_LOOP_INSTRUCTION

inherit

	ET_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (a_from_compound: like from_compound;
		an_invariant: like invariant_part; a_variant: like variant_part;
		an_until: like until_keyword; an_until_expression: like until_expression;
		a_loop_compound: like loop_compound;
		an_end: like end_keyword) is
			-- Create a new loop instruction.
		require
			a_from_compound_not_void: a_from_compound /= Void
			an_until_not_void: an_until /= Void
			an_until_expression_not_void: an_until_expression /= Void
			a_loop_compound_not_void: a_loop_compound /= Void
			an_end_not_void: an_end /= Void
		do
			from_compound := a_from_compound
			invariant_part := an_invariant
			variant_part := a_variant
			until_keyword := an_until
			until_expression := an_until_expression
			loop_compound := a_loop_compound
			end_keyword := an_end
		ensure
			from_compound_set: from_compound = a_from_compound
			invariant_part_set: invariant_part = an_invariant
			variant_part_set: variant_part = a_variant
			until_keyword_set: until_keyword = an_until
			until_expression_set: until_expression = an_until_expression
			loop_compound_set: loop_compound = a_loop_compound
			end_keyword_set: end_keyword = an_end
		end

feature -- Access

	from_compound: ET_COMPOUND
			-- From compound

	invariant_part: ET_INVARIANTS
			-- Invariant part

	variant_part: ET_VARIANT
			-- Variant part

	until_keyword: ET_KEYWORD
			-- 'until' keyword

	until_expression: ET_EXPRESSION
			-- Until boolean expression

	loop_compound: ET_COMPOUND
			-- Loop compound

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := from_compound.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := end_keyword.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_loop_instruction (Current)
		end

invariant

	from_compound_not_void: from_compound /= Void
	until_keyword_not_void: until_keyword /= Void
	until_expression_not_void: until_expression /= Void
	loop_compound_not_void: loop_compound /= Void
	end_keyword_not_void: end_keyword /= Void

end
