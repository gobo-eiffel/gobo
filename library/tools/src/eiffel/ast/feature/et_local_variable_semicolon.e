note

	description:

		"Eiffel local variables followed by a semicolon"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"

class ET_LOCAL_VARIABLE_SEMICOLON

inherit

	ET_LOCAL_VARIABLE_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_variable: like local_variable; a_semicolon: like semicolon)
			-- Create a new local_variable-semicolon.
		require
			a_variable_not_void: a_variable /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			local_variable := a_variable
			semicolon := a_semicolon
		ensure
			local_variable_set: local_variable = a_variable
			semicolon_set: semicolon = a_semicolon
		end

feature -- Access

	local_variable: ET_LOCAL_VARIABLE
			-- Local variable in semicolon-separated list

	semicolon: ET_SYMBOL
			-- Semicolon separator

	name: ET_IDENTIFIER
			-- Name
		do
			Result := local_variable.name
		end

	type: ET_TYPE
			-- Type
		do
			Result := local_variable.type
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := local_variable.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := local_variable.first_leaf
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
			a_processor.process_local_variable_semicolon (Current)
		end

invariant

	semicolon_not_void: semicolon /= Void

end
