note

	description:

		"Eiffel 'if' expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_IF_EXPRESSION

inherit

	ET_EXPRESSION
		redefine
			reset
		end

create

	make

feature {NONE} -- Initialization

	make (a_conditional: like conditional; a_then_expression: like then_expression; a_else_expression: like else_expression)
			-- Create a new 'if' expression.
		require
			a_conditional_not_void: a_conditional /= Void
			a_then_expression_not_void: a_then_expression /= Void
			a_else_expression_not_void: a_else_expression /= Void
		do
			conditional := a_conditional
			then_keyword := tokens.then_keyword
			then_expression := a_then_expression
			else_keyword := tokens.else_keyword
			else_expression := a_else_expression
			end_keyword := tokens.end_keyword
		ensure
			conditional_set: conditional = a_conditional
			then_expression_set: then_expression = a_then_expression
			else_expression_set: else_expression = a_else_expression
		end

feature -- Initialization

	reset
			-- Reset expression as it was just after it was last parsed.
		do
			conditional_expression.reset
			then_expression.reset
			if attached elseif_parts as l_elseif_parts then
				l_elseif_parts.reset
			end
			else_expression.reset
		end

feature -- Access

	conditional: ET_CONDITIONAL
			-- Condition

	conditional_expression: ET_EXPRESSION
			-- Boolean expression
		do
			Result := conditional.expression
		ensure
			conditional_xpression_not_void: Result /= Void
		end

	then_keyword: ET_KEYWORD
			-- Then keyword

	then_expression: ET_EXPRESSION
			-- Then expression

	elseif_parts: detachable ET_ELSEIF_EXPRESSION_LIST
			-- Elseif parts

	else_keyword: ET_KEYWORD
			-- Then keyword

	else_expression: ET_EXPRESSION
			-- Then expression

	end_keyword: ET_KEYWORD
			-- 'end' keyword

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
			Result := end_keyword
		end

feature -- Setting

	set_elseif_parts (an_elseif_parts: like elseif_parts)
			-- Set `elseif_parts' to `an_elseif_parts'.
		do
			elseif_parts := an_elseif_parts
		ensure
			elseif_parts_set: elseif_parts = an_elseif_parts
		end

	set_then_keyword (a_then: like then_keyword)
			-- Set `then_keyword' to `a_then'.
		do
			then_keyword := a_then
		ensure
			then_keyword_set: then_keyword = a_then
		end

	set_else_keyword (a_else: like else_keyword)
			-- Set `else_keyword' to `a_else'.
		do
			else_keyword := a_else
		ensure
			else_keyword_set: else_keyword = a_else
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
			a_processor.process_if_expression (Current)
		end

invariant

	conditional_not_void: conditional /= Void
	then_keyword_not_void: then_keyword /= Void
	then_expression_not_void: then_expression /= Void
	else_keyword_not_void: else_keyword /= Void
	else_expression_not_void: else_expression /= Void
	end_keyword_not_void: end_keyword /= Void

end
