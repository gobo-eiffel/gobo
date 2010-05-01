note

	description:

		"Eiffel identifiers followed by a colon"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_IDENTIFIER_COLON

inherit

	ET_TAG

create

	make

feature {NONE} -- Initialization

	make (a_name: like identifier; a_colon: like colon) is
			-- Create a new identifier-colon.
		require
			a_name_not_void: a_name /= Void
			a_colon_not_void: a_colon /= Void
		do
			identifier := a_name
			colon := a_colon
		ensure
			identifier_set: identifier = a_name
			colon_set: colon = a_colon
		end

feature -- Access

	identifier: ET_IDENTIFIER
			-- Identifier

	colon: ET_SYMBOL
			-- Colon symbol

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := identifier.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := identifier
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := colon
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := colon.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_identifier_colon (Current)
		end

invariant

	colon_not_void: colon /= Void

end
