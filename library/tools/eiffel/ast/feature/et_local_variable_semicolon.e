indexing

	description:

		"Eiffel local variables followed by a semicolon"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_LOCAL_VARIABLE_SEMICOLON

inherit

	ET_LOCAL_VARIABLE_ITEM

creation

	make

feature {NONE} -- Initialization

	make (a_variable: like local_variable_item; a_semicolon: like semicolon) is
			-- Create a new local_variable-semicolon.
		require
			a_variable_not_void: a_variable /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			local_variable_item := a_variable
			semicolon := a_semicolon
		ensure
			local_variable_item_set: local_variable_item = a_variable
			semicolon_set: semicolon = a_semicolon
		end

feature -- Access

	local_variable_item: ET_LOCAL_VARIABLE
			-- Local variable in semicolon-separated list

	semicolon: ET_SYMBOL
			-- Semicolon separator

	type: ET_TYPE is
			-- Type
		do
			Result := local_variable_item.type
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := local_variable_item.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := semicolon.break
		end

invariant

	semicolon_not_void: semicolon /= Void

end -- class ET_LOCAL_VARIABLE_SEMICOLON
