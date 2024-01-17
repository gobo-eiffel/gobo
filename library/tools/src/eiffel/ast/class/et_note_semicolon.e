note

	description:

		"Eiffel note clauses followed by a semicolon"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

class ET_NOTE_SEMICOLON

inherit

	ET_NOTE_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_note: like note_item; a_semicolon: like semicolon)
			-- Create a new note-semicolon.
		require
			a_note_not_void: a_note /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			note_item := a_note
			semicolon := a_semicolon
		ensure
			note_item_set: note_item = a_note
			semicolon_set: semicolon = a_semicolon
		end

feature -- Access

	note_clause: ET_NOTE
			-- Note clause in semicolon-separated list
		do
			Result := note_item.note_clause
		end

	note_item: ET_NOTE_ITEM
			-- Note clause item
			-- (This allows several semicolons by nesting
			-- objects of current type.)

	semicolon: ET_SYMBOL
			-- Semicolon separator

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := note_item.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := note_item.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := semicolon
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_note_semicolon (Current)
		end

invariant

	note_item_not_void: note_item /= Void
	semicolon_not_void: semicolon /= Void

end
