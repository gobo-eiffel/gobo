indexing

	description:

		"Eiffel indexing clauses followed by a semicolon"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_INDEXING_SEMICOLON

inherit

	ET_INDEXING_ITEM

create

	make

feature {NONE} -- Initialization

	make (an_indexing: like indexing_item; a_semicolon: like semicolon) is
			-- Create a new indexing-semicolon.
		require
			an_indexing_not_void: an_indexing /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			indexing_item := an_indexing
			semicolon := a_semicolon
		ensure
			indexing_item_set: indexing_item = an_indexing
			semicolon_set: semicolon = a_semicolon
		end

feature -- Access

	indexing_clause: ET_INDEXING is
			-- Indexing clause in semicolon-separated list
		do
			Result := indexing_item.indexing_clause
		end

	indexing_item: ET_INDEXING_ITEM
			-- Indexing clause item
			-- (This allows several semicolons by nesting
			-- objects of current type.)

	semicolon: ET_SYMBOL
			-- Semicolon separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := indexing_item.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := indexing_item.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := semicolon
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := semicolon.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_indexing_semicolon (Current)
		end

invariant

	indexing_item_not_void: indexing_item /= Void
	semicolon_not_void: semicolon /= Void

end
