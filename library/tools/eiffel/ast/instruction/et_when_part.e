indexing

	description:

		"Eiffel 'when' parts in inspect instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_WHEN_PART

inherit

	ET_AST_NODE

creation

	make

feature {NONE} -- Initialization

	make (a_when: like when_keyword; a_choices: like choices;
		a_then: like then_keyword; a_compound: like compound) is
			-- Create a new when part.
		require
			a_when_not_void: a_when /= Void
			no_void_choice: a_choices /= Void implies not a_choices.has (Void)
			a_then_not_void: a_then /= Void
		do
			when_keyword := a_when
			choices := a_choices
			then_keyword := a_then
			compound := a_compound
		ensure
			when_keyword_set: when_keyword = a_when
			choices_set: choices = a_choices
			then_keyword_set: then_keyword = a_then
			compound_set: compound = a_compound
		end

feature -- Access

	when_keyword: ET_TOKEN
			-- 'when' keyword

	choices: DS_ARRAYED_LIST [ET_CHOICE_ITEM]
			-- Choices

	then_keyword: ET_TOKEN
			-- 'then' keyword

	compound: ET_COMPOUND
			-- Then part

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := when_keyword.position
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

	when_keyword_not_void: when_keyword /= Void
	no_void_choice: choices /= Void implies not choices.has (Void)
	then_keyword_not_void: then_keyword /= Void

end -- class ET_WHEN_PART
