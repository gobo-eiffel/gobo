indexing

	description:

		"Eiffel typed creation instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPED_CREATION_INSTRUCTION

inherit

	ET_CREATION_INSTRUCTION
		redefine
			add_to_system
		end

feature -- Access

	type: ET_TYPE
			-- Type of object being created

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current instruction.
		do
			type.add_to_system
		end

invariant

	type_not_void: type /= Void

end
