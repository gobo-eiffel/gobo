indexing

	description:

		"Eiffel instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INSTRUCTION

inherit

	ET_AST_NODE

feature -- Status report

	is_semicolon: BOOLEAN is
			-- Is current node a semicolon?
		do
			-- Result := False
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current instruction.
		do
		end

end
