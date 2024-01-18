note

	description:

		"Eiffel note clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

class ET_NOTE

inherit

	ET_NOTE_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_terms: like terms)
			-- Create a new note clause.
		require
			a_terms_not_void: a_terms /= Void
		do
			terms := a_terms
		ensure
			terms_set: terms = a_terms
		end

feature -- Access

	tag: detachable ET_TAG
			-- Tag
		do
		end

	terms: ET_NOTE_TERM_LIST
			-- Note terms

	note_clause: ET_NOTE
			-- Note clause in semicolon-separated list
		do
			Result := Current
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if attached tag as l_tag then
				Result := l_tag.position
			else
				Result := terms.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if attached tag as l_tag then
				Result := l_tag.first_leaf
			else
				Result := terms.first_leaf
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := terms.last_leaf
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_note (Current)
		end

invariant

	terms_not_void: terms /= Void

end
