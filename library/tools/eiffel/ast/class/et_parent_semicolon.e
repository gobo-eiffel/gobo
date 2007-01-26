indexing

	description:

		"Eiffel class parents followed by a semicolon"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_PARENT_SEMICOLON

inherit

	ET_PARENT_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_parent: like parent; a_semicolon: like semicolon) is
			-- Create a new parent-semicolon.
		require
			a_parent_not_void: a_parent /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			parent := a_parent
			semicolon := a_semicolon
		ensure
			parent_set: parent = a_parent
			semicolon_set: semicolon = a_semicolon
		end

feature -- Access

	parent: ET_PARENT
			-- Class parent in semicolon-separated list

	semicolon: ET_SYMBOL
			-- Semicolon separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := parent.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := parent.first_leaf
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
			a_processor.process_parent_semicolon (Current)
		end

invariant

	semicolon_not_void: semicolon /= Void

end
