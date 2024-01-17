note

	description:

		"Eiffel entity declared types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2010, Eric Bezault and others"
	license: "MIT License"

deferred class ET_DECLARED_TYPE

inherit

	ET_AST_NODE

feature -- Access

	type: ET_TYPE
			-- Declared type
		deferred
		ensure
			type_not_void: Result /= Void
		end

end
