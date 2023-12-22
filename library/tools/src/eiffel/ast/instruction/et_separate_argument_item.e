note

	description:

		"Eiffel arguments of separate instructions which appear in a comma-separated list of separate arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2022-2023, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_SEPARATE_ARGUMENT_ITEM

inherit

	ET_AST_NODE

feature -- Access

	argument: ET_SEPARATE_ARGUMENT
			-- Separate argument in comma-separated list
		deferred
		ensure
			argument_not_void: Result /= Void
		end

end
