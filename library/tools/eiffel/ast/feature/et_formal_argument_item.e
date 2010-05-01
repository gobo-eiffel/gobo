note

	description:

		"Eiffel formal arguments in semicolon-separated list of formal arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FORMAL_ARGUMENT_ITEM

inherit

	ET_ENTITY_DECLARATION

feature -- Access

	formal_argument: ET_FORMAL_ARGUMENT is
			-- Formal argument in semicolon-separated list
		deferred
		ensure
			formal_argument_not_void: Result /= Void
		end

feature -- Duplication

	cloned_argument: like Current is
			-- Cloned formal argument;
			-- Do not recursively clone the type
		deferred
		ensure
			argument_not_void: Result /= Void
		end

end
