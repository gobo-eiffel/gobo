indexing

	description:

		"Eiffel 'when' parts in inspect instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_WHEN_PART

inherit

	ET_AST_NODE

creation

	make

feature {NONE} -- Initialization

	make (a_when: like when_keyword; a_choices: like choices;
		a_then_compound: like then_compound) is
			-- Create a new when part.
		require
			a_when_not_void: a_when /= Void
			a_then_compound_not_void: a_then_compound /= Void
		do
			when_keyword := a_when
			choices := a_choices
			then_compound := a_then_compound
		ensure
			when_keyword_set: when_keyword = a_when
			choices_set: choices = a_choices
			then_compound_set: then_compound = a_then_compound
		end

feature -- Access

	when_keyword: ET_TOKEN
			-- 'when' keyword

	choices: ET_CHOICE_LIST
			-- Choices

	then_compound: ET_COMPOUND
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
			Result := then_compound.break
		end

invariant

	when_keyword_not_void: when_keyword /= Void
	then_compound_not_void: then_compound /= Void

end -- class ET_WHEN_PART
