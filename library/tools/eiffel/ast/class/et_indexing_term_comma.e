indexing

	description:

		"Eiffel indexing terms followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_INDEXING_TERM_COMMA

inherit

	ET_INDEXING_TERM_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_term: like indexing_term; a_comma: like comma) is
			-- Create a new indexing_term-comma.
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
			-- Indexing term in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := indexing_term.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := indexing_term.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := comma
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := comma.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_indexing_term_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
