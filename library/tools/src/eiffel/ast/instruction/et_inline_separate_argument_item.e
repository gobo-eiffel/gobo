note

	description:

		"Eiffel arguments of inline separate instructions which appear in a comma-separated list of inline separate arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2022-2023, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INLINE_SEPARATE_ARGUMENT_ITEM

inherit

	ET_AST_NODE

feature -- Access

	argument: ET_INLINE_SEPARATE_ARGUMENT
			-- Inline separate argument in comma-separated list
		deferred
		ensure
			argument_not_void: Result /= Void
		end

end
