indexing

	description:

		"Eiffel if instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_IF_INSTRUCTION

inherit

	ET_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (an_if: like if_keyword; an_expression: like expression;
		a_compound: like then_compound; an_end: like end_keyword) is
			-- Create a new if instruction.
		require
			an_if_not_void: an_if /= Void
			an_expression_not_void: an_expression /= Void
			a_compound_not_void: a_compound /= Void
			an_end_not_void: an_end /= Void
		do
			if_keyword := an_if
			expression := an_expression
			then_compound := a_compound
			end_keyword := an_end
		ensure
			if_keyword_set: if_keyword = an_if
			expression_set: expression = an_expression
			then_compound_set: then_compound = a_compound
			end_keyword_set: end_keyword = an_end
		end

feature -- Access

	if_keyword: ET_TOKEN
			-- 'if' keyword

	expression: ET_EXPRESSION
			-- Condition

	then_compound: ET_COMPOUND
			-- Then part

	elseif_parts: ET_ELSEIF_PART_LIST
			-- Elseif parts

	else_compound: ET_COMPOUND
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
		do
			elseif_parts := an_elseif_parts
		ensure
			elseif_parts_set: elseif_parts = an_elseif_parts
		end

	set_else_compound (a_compound: like else_compound) is
			-- Set `else_compound' to `a_compound'.
		do
			else_compound := a_compound
		ensure
			else_compound_set: else_compound = a_compound
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_if_instruction (Current)
		end

invariant

	if_keyword_not_void: if_keyword /= Void
	expression_not_void: expression /= Void
	then_compound_not_void: then_compound /= Void
	end_keyword_not_void: end_keyword /= Void

end
