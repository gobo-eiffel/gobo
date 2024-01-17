note

	description:

		"Eiffel note terms followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

class ET_NOTE_TERM_COMMA

inherit

	ET_NOTE_TERM_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_term: like note_term; a_comma: like comma)
			-- Create a new note_term-comma.
		require
			a_term_not_void: a_term /= Void
			a_comma_not_void: a_comma /= Void
		do
			note_term := a_term
			comma := a_comma
		ensure
			note_term_set: note_term = a_term
			comma_set: comma = a_comma
		end

feature -- Access

	note_term: ET_NOTE_TERM
			-- Note term in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	note_term_value: STRING
			-- Value of current note term
		do
			Result := note_term.note_term_value
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := note_term.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := note_term.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := comma
		end

feature -- Status report

	has_note_term_value (a_value: STRING): BOOLEAN
			-- Does current note term have value `a_value'?
			-- (case-insensitive comparison)
		do
			Result := note_term.has_note_term_value (a_value)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_note_term_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
