note

	description:

		"Eiffel inline separate arguments followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2022-2023, Eric Bezault and others"
	license: "MIT License"

class ET_INLINE_SEPARATE_ARGUMENT_COMMA

inherit

	ET_INLINE_SEPARATE_ARGUMENT_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_argument: like argument; a_comma: like comma)
			-- Create a new inline_separate_argument-comma.
		require
			a_argument_not_void: a_argument /= Void
			a_comma_not_void: a_comma /= Void
		do
			argument := a_argument
			comma := a_comma
		ensure
			argument_set: argument = a_argument
			comma_set: comma = a_comma
		end

feature -- Access

	argument: ET_INLINE_SEPARATE_ARGUMENT
			-- Inline separate argument in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := argument.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := argument.first_leaf
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
			a_processor.process_inline_separate_argument_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
