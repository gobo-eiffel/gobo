indexing

	description:

		"Eiffel indexing clauses followed by a semicolon"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INDEXING_SEMICOLON

inherit

	ET_INDEXING_ITEM

creation

	make

feature {NONE} -- Initialization

	make (an_indexing: like indexing_item_item; a_semicolon: like semicolon) is
			-- Create a new indexing-semicolon.
		require
			an_indexing_not_void: an_indexing /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			indexing_item_item := an_indexing
			semicolon := a_semicolon
		ensure
			indexing_item_item_set: indexing_item_item = an_indexing
			semicolon_set: semicolon = a_semicolon
		end

feature -- Access

	indexing_item: ET_INDEXING is
			-- Indexing clause in semicolon-separated list
		do
			Result := indexing_item_item.indexing_item
		end

	indexing_item_item: ET_INDEXING_ITEM
			-- Indexing clause item
			-- (This allows several semicolons by nesting
			-- objects of current type.)

	semicolon: ET_SYMBOL
			-- Semicolon separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := indexing_item_item.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := semicolon.break
		end

invariant

	indexing_item_item_not_void: indexing_item_item /= Void
	semicolon_not_void: semicolon /= Void

end
