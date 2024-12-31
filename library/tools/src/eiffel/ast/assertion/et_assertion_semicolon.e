note

	description:

		"Eiffel assertions followed by a semicolon"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

class ET_ASSERTION_SEMICOLON

inherit

	ET_ASSERTION_ITEM

create

	make

feature {NONE} -- Initialization

	make (an_assertion: like assertion; a_semicolon: like semicolon)
			-- Create a new assertion-semicolon.
		require
			an_assertion_not_void: an_assertion /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			assertion := an_assertion
			semicolon := a_semicolon
		ensure
			assertion_set: assertion = an_assertion
			semicolon_set: semicolon = a_semicolon
		end

feature -- Access

	assertion: ET_ASSERTION
			-- Assertion in list of assertions

	semicolon: ET_SEMICOLON_SYMBOL
			-- Semicolon separator

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := assertion.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := assertion.first_leaf
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
			a_processor.process_assertion_semicolon (Current)
		end

invariant

	semicolon_not_void: semicolon /= Void

end
