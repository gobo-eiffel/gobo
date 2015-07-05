note

	description:

		"Eiffel types preceded by a colon"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_COLON_TYPE

inherit

	ET_DECLARED_TYPE

create

	make

feature {NONE} -- Initialization

	make (a_colon: like colon; a_type: like type)
			-- Create a new colon-type.
		require
			a_colon_not_void: a_colon /= Void
			a_type_not_void: a_type /= Void
		do
			colon := a_colon
			type := a_type
		ensure
			colon_set: colon = a_colon
			type_set: type = a_type
		end

feature -- Access

	colon: ET_SYMBOL
			-- ':' symbol

	type: ET_TYPE
			-- Type

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := colon.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := colon
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := type.last_leaf
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_colon_type (Current)
		end

invariant

	colon_not_void: colon /= Void

end
