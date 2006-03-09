indexing

	description:

		"Eiffel identifiers followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_IDENTIFIER_COMMA

inherit

	ET_LOCAL_NAME
	ET_ARGUMENT_NAME
	ET_LABEL

create

	make

feature {NONE} -- Initialization

	make (a_name: like identifier; a_comma: like comma) is
			-- Create a new identifier-comma.
		require
			a_name_not_void: a_name /= Void
			a_comma_not_void: a_comma /= Void
		do
			identifier := a_name
			comma := a_comma
		ensure
			identifier_set: identifier = a_name
			comma_set: comma = a_comma
		end

feature -- Access

	identifier: ET_IDENTIFIER
			-- Identifier

	comma: ET_SYMBOL
			-- Comma separator

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
			a_processor.process_identifier_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
