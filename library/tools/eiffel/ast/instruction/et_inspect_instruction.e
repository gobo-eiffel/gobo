indexing

	description:

		"Eiffel inspect instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_INSPECT_INSTRUCTION

inherit

	ET_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (an_inspect: like inspect_keyword; an_expression: like expression; an_end: like end_keyword) is
			-- Create a new inspect instruction.
		require
			an_inspect_not_void: an_inspect /= Void
			an_expression_not_void: an_expression /= Void
			an_end_not_void: an_end /= Void
		do
			inspect_keyword := an_inspect
			expression := an_expression
			end_keyword := an_end
		ensure
			inspect_keyword_set: inspect_keyword = an_inspect
			expression_set: expression = an_expression
			end_keyword_set: end_keyword = an_end
		end

feature -- Access

	inspect_keyword: ET_TOKEN
			-- 'inspect' keyword

	expression: ET_EXPRESSION
			-- Expression

	when_parts: DS_ARRAYED_LIST [ET_WHEN_PART]
			-- When parts

	else_compound: ET_COMPOUND
			-- Else part

	end_keyword: ET_TOKEN
			-- 'end' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := inspect_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := end_keyword.break
		end

feature -- Setting

	set_when_parts (a_when_parts: like when_parts) is
			-- Set `when_parts' to `a_when_parts'.
		require
			no_void_when: a_when_parts /= Void implies not a_when_parts.has (Void)
		do
			when_parts := a_when_parts
		ensure
			when_parts_set: when_parts = a_when_parts
		end

	set_else_compound (a_compound: like else_compound) is
			-- Set `else_compound' to `a_compound'.
		do
			else_compound := a_compound
		ensure
			else_compound_set: else_compound = a_compound
		end

invariant

	inspect_keyword_not_void: inspect_keyword /= Void
	expression_not_void: expression /= Void
	end_keyword_not_void: end_keyword /= Void
	no_void_when: when_parts /= Void implies not when_parts.has (Void)

end -- class ET_INSPECT_INSTRUCTION
