indexing

	description:

		"Eiffel formal generic parameters in comma-separated list of parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FORMAL_PARAMETER_ITEM

inherit

	ET_AST_NODE

feature -- Access

	formal_parameter: ET_FORMAL_PARAMETER is
			-- Formal generic parameter in comma-separated list
		deferred
		ensure
			formal_parameter_not_void: Result /= Void
		end

end
