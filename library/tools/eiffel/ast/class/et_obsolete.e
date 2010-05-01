note

	description:

		"Eiffel obsolete clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_OBSOLETE

inherit

	ET_AST_NODE

feature -- Access

	manifest_string: ET_MANIFEST_STRING is
			-- Obsolete message
		deferred
		ensure
			manifest_string_not_void: Result /= Void
		end

end
