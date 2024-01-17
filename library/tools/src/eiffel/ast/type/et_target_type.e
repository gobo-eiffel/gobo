note

	description:

		"Eiffel types surrounded by braces"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2010, Eric Bezault and others"
	license: "MIT License"

deferred class ET_TARGET_TYPE

inherit

	ET_AST_NODE

feature -- Access

	type: ET_TYPE
			-- Type
		deferred
		ensure
			type_not_void: Result /= Void
		end

end
