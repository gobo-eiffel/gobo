indexing

	description:

		"Eiffel 'elseif' parts"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ELSEIF_PART

inherit

	ET_AST_NODE

creation

	make

feature {NONE} -- Initialization

	make (an_elseif: like elseif_keyword; an_expression: like expression;
		a_then: like then_keyword; a_compound: like compound) is
			-- Create a new elseif part.
		require
			an_elseif_not_void: an_elseif /= Void
			an_expression_not_void: an_expression /= Void
			a_then_not_void: a_then /= Void
		do
			elseif_keyword := an_elseif
			expression := an_expression
			then_keyword := a_then
			compound := a_compound
		ensure
			elseif_keyword_set: elseif_keyword = an_elseif
			expression_set: expression = an_expression
			then_keyword_set: then_keyword = a_then
			compound_set: compound = a_compound
		end

feature -- Access

	elseif_keyword: ET_TOKEN
			-- 'elseif' keyword

	expression: ET_EXPRESSION
			-- Condition

	then_keyword: ET_TOKEN
			-- 'then' keyword

	compound: ET_COMPOUND
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
			if compound /= Void then
				Result := compound.break
			else
				Result := then_keyword.break
			end
		end

invariant

	elseif_keyword_not_void: elseif_keyword /= Void
	expression_not_void: expression /= Void
	then_keyword_not_void: then_keyword /= Void

end -- class ET_ELSEIF_PART
