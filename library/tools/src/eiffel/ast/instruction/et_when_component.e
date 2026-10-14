note

	description:

		"Eiffel 'when' components in inspect instructions/expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

deferred class ET_WHEN_COMPONENT

inherit

	ET_AST_NODE

feature -- Initialization

	reset
			-- Reset when part as it was when it was last parsed.
		do
			choices.reset
		end

feature -- Access

	choices: ET_CHOICE_LIST
			-- Choices

	then_part: detachable ET_AST_NODE
			-- Then part
		deferred
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := choices.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := choices.first_leaf
		end

invariant

	choices_not_void: choices /= Void

end
