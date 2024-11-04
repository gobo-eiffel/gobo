note

	description:

		"Eiffel formal arguments in semicolon-separated list of formal arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_FORMAL_ARGUMENT_ITEM

inherit

	ET_ENTITY_DECLARATION

feature -- Access

	formal_argument: ET_FORMAL_ARGUMENT
			-- Formal argument in semicolon-separated list
		deferred
		ensure
			formal_argument_not_void: Result /= Void
		end

feature -- Duplication

	cloned_argument: like Current
			-- Cloned formal argument;
			-- Do not recursively clone the type
		deferred
		ensure
			cloned_argument_not_void: Result /= Void
		end

end
