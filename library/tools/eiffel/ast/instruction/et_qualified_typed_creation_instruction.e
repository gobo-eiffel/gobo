indexing

	description:

		"Eiffel qualified typed creation instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_QUALIFIED_TYPED_CREATION_INSTRUCTION

inherit

	ET_QUALIFIED_CREATION_INSTRUCTION
		undefine
			add_to_system
		end

	ET_TYPED_CREATION_INSTRUCTION

end -- class ET_QUALIFIED_TYPED_CREATION_INSTRUCTION
