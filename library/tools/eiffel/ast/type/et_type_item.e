indexing

	description:

		"Eiffel types which appear in a comma-separated list of types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPE_ITEM

inherit

	ET_AST_NODE

feature -- Access

	type: ET_TYPE is
			-- Type in comma-separated list
		deferred
		ensure
			type_not_void: Result /= Void
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_TYPE_ITEM is
			-- Version of current type where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		require
			a_parameters_not_void: a_parameters /= Void
		deferred
		ensure
			resolved_type_not_void: Result /= Void
		end

end
