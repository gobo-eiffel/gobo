indexing

	description:

		"Eiffel if instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_IF_INSTRUCTION

inherit

	ET_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (an_if: like if_keyword; an_expression: like expression; a_then: like then_keyword;
		a_compound: like compound; an_end: like end_keyword) is
			-- Create a new if instruction.
		require
			an_if_not_void: an_if /= Void
			an_expression_not_void: an_expression /= Void
			a_then_not_void: a_then /= Void
			an_end_not_void: an_end /= Void
		do
			if_keyword := an_if
			expression := an_expression
			then_keyword := a_then
			compound := a_compound
			end_keyword := an_end
		ensure
			if_keyword_set: if_keyword = an_if
			expression_set: expression = an_expression
			then_keyword_set: then_keyword = a_then
			compound_set: compound = a_compound
			end_keyword_set: end_keyword = an_end
		end

feature -- Access

	if_keyword: ET_TOKEN
			-- 'if' keyword

	expression: ET_EXPRESSION
			-- Condition

	then_keyword: ET_TOKEN
			-- 'then' keyword

	compound: ET_COMPOUND
			-- Then part

	elseif_parts: DS_ARRAYED_LIST [ET_ELSEIF_PART]
			-- Elseif parts

	else_part: ET_ELSE_PART
			-- Else part

	end_keyword: ET_TOKEN
			-- 'end' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := if_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := end_keyword.break
		end

feature -- Setting

	set_elseif_parts (an_elseif_parts: like elseif_parts) is
			-- Set `elseif_parts' to `an_elseif_parts'.
		require
			no_void_elseif: an_elseif_parts /= Void implies not an_elseif_parts.has (Void)
		do
			elseif_parts := an_elseif_parts
		ensure
			elseif_parts_set: elseif_parts = an_elseif_parts
		end

	set_else_part (an_else_part: like else_part) is
			-- Set `else_part' to `an_else_part'.
		do
			else_part := an_else_part
		ensure
			else_part_set: else_part = an_else_part
		end

invariant

	if_keyword_not_void: if_keyword /= Void
	expression_not_void: expression /= Void
	then_keyword_not_void: then_keyword /= Void
	end_keyword_not_void: end_keyword /= Void
	no_void_elseif: elseif_parts /= Void implies not elseif_parts.has (Void)

end -- class ET_IF_INSTRUCTION
