note

	description:

		"Eiffel argument names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ARGUMENT_NAME

inherit

	ET_EXPRESSION

feature -- Access

	identifier: ET_IDENTIFIER is
			-- Identifier
		deferred
		ensure
			identifier_not_void: Result /= Void
		end

end
