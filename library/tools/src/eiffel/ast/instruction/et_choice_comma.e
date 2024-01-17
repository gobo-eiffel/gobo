note

	description:

		"Eiffel inspect choices followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"

class ET_CHOICE_COMMA

inherit

	ET_CHOICE_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_choice: like choice; a_comma: like comma)
			-- Create a new choice-comma.
		require
			a_choice_not_void: a_choice /= Void
			a_comma_not_void: a_comma /= Void
		do
			choice := a_choice
			comma := a_comma
		ensure
			choice_set: choice = a_choice
			comma_set: comma = a_comma
		end

feature -- Access

	choice: ET_CHOICE
			-- Choice in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := choice.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := choice.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := comma
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_choice_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
