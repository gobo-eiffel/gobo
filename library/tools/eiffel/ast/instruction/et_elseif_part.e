indexing

	description:

		"Eiffel 'elseif' parts"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ELSEIF_PART

inherit

	ET_AST_NODE

creation

	make

feature {NONE} -- Initialization

	make (an_elseif: like elseif_keyword; an_expression: like expression;
		a_then_compound: like then_compound) is
			-- Create a new elseif part.
		require
			an_elseif_not_void: an_elseif /= Void
			an_expression_not_void: an_expression /= Void
			a_then_compound_not_void: a_then_compound /= Void
		do
			elseif_keyword := an_elseif
			expression := an_expression
			then_compound := a_then_compound
		ensure
			elseif_keyword_set: elseif_keyword = an_elseif
			expression_set: expression = an_expression
			then_compound_set: then_compound = a_then_compound
		end

feature -- Access

	elseif_keyword: ET_KEYWORD
			-- 'elseif' keyword

	expression: ET_EXPRESSION
			-- Condition

	then_compound: ET_COMPOUND
			-- Then part

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := elseif_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := then_compound.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_elseif_part (Current)
		end

invariant

	elseif_keyword_not_void: elseif_keyword /= Void
	expression_not_void: expression /= Void
	then_compound_not_void: then_compound /= Void

end
