note

	description:

		"Eiffel note terms followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2017, Eric Bezault and others"
	license: "MIT License"

class ET_INDEXING_TERM_COMMA

inherit

	ET_INDEXING_TERM_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_term: like indexing_term; a_comma: like comma)
			-- Create a new note_term-comma.
		require
			a_term_not_void: a_term /= Void
			a_comma_not_void: a_comma /= Void
		do
			indexing_term := a_term
			comma := a_comma
		ensure
			indexing_term_set: indexing_term = a_term
			comma_set: comma = a_comma
		end

feature -- Access

	indexing_term: ET_INDEXING_TERM
			-- Note term in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	indexing_term_value: STRING
			-- Value of current indexing term
		do
			Result := indexing_term.indexing_term_value
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := indexing_term.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := indexing_term.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := comma
		end

feature -- Status report

	has_indexing_term_value (a_value: STRING): BOOLEAN
			-- Does current indexing term have value `a_value'?
			-- (case-insensitive comparison)
		do
			Result := indexing_term.has_indexing_term_value (a_value)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_indexing_term_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
