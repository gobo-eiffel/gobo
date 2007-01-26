indexing

	description:

		"Eiffel formal arguments followed by a semicolon"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_ARGUMENT_SEMICOLON

inherit

	ET_FORMAL_ARGUMENT_ITEM

create

	make

feature {NONE} -- Initialization

	make (an_argument: like formal_argument; a_semicolon: like semicolon) is
			-- Create a new formal_argument-semicolon.
		require
			an_argument_not_void: an_argument /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			formal_argument := an_argument
			semicolon := a_semicolon
		ensure
			formal_argument_set: formal_argument = an_argument
			semicolon_set: semicolon = a_semicolon
		end

feature -- Access

	formal_argument: ET_FORMAL_ARGUMENT
			-- Formal argument in semicolon-separated list

	semicolon: ET_SYMBOL
			-- Semicolon separator

	type: ET_TYPE is
			-- Type
		do
			Result := formal_argument.type
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := formal_argument.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := formal_argument.first_leaf
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

feature -- Duplication

	cloned_argument: like Current is
			-- Cloned formal argument;
			-- Do not recursively clone the type
		do
			create Result.make (formal_argument, semicolon)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_formal_argument_semicolon (Current)
		end

invariant

	semicolon_not_void: semicolon /= Void

end
