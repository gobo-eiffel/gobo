indexing

	description:

		"Eiffel creation instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CREATION_INSTRUCTION

inherit

	ET_INSTRUCTION

feature -- Access

	target: ET_WRITABLE
			-- Target of the creation

	type: ET_TYPE is
			-- Creation type
		deferred
		end

	creation_call: ET_QUALIFIED_CALL
			-- Call to creation procedure

invariant

	target_not_void: target /= Void

end
