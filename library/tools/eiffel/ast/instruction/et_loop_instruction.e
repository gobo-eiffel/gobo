indexing

	description:

		"Eiffel loop instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_LOOP_INSTRUCTION

inherit

	ET_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (a_from: like from_keyword; a_from_compound: like from_compound;
		an_invariant: like invariant_part; a_variant: like variant_part;
		an_until: like until_keyword; an_until_expression: like until_expression;
		a_loop: like loop_keyword; a_loop_compound: like loop_compound;
		an_end: like end_keyword) is
			-- Create a new loop instruction.
		require
			a_from_not_void: a_from /= Void
			an_until_not_void: an_until /= Void
			an_until_expression_not_void: an_until_expression /= Void
			a_loop_not_void: a_loop /= Void
			an_end_not_void: an_end /= Void
		do
			from_keyword := a_from
			from_compound := a_from_compound
			invariant_part := an_invariant
			variant_part := a_variant
			until_keyword := an_until
			until_expression := an_until_expression
			loop_keyword := a_loop
			loop_compound := a_loop_compound
			end_keyword := an_end
		ensure
			from_keyword_set: from_keyword = a_from
			from_compound_set: from_compound = a_from_compound
			invariant_part_set: invariant_part = an_invariant
			variant_part_set: variant_part = a_variant
			until_keyword_set: until_keyword = an_until
			until_expression_set: until_expression = an_until_expression
			loop_keyword_set: loop_keyword = a_loop
			loop_compound_set: loop_compound = a_loop_compound
			end_keyword_set: end_keyword = an_end
		end

feature -- Access

	from_keyword: ET_TOKEN
			-- 'from' keyword

	from_compound: ET_COMPOUND
			-- From compound

	invariant_part: ET_INVARIANTS
			-- Invariant part

	variant_part: ET_VARIANT
			-- Variant part

	until_keyword: ET_TOKEN
			-- 'until' keyword

	until_expression: ET_EXPRESSION
			-- Until boolean expression

	loop_keyword: ET_TOKEN
			-- 'loop' keyword

	loop_compound: ET_COMPOUND
			-- Loop compound

	end_keyword: ET_TOKEN
			-- 'end' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := from_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := end_keyword.break
		end

invariant

	from_keyword_not_void: from_keyword /= Void
	until_keyword_not_void: until_keyword /= Void
	until_expression_not_void: until_expression /= Void
	loop_keyword_not_void: loop_keyword /= Void
	end_keyword_not_void: end_keyword /= Void

end -- class ET_LOOP_INSTRUCTION
