indexing

	description:

		"Eiffel actual generic parameters which appear in a comma-separated list of parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ACTUAL_PARAMETER_ITEM

inherit

	ET_AST_NODE

feature -- Access

	actual_parameter: ET_ACTUAL_PARAMETER is
			-- Actual parameter in comma-separated list
		deferred
		ensure
			actual_parameter_not_void: Result /= Void
		end

	type: ET_TYPE is
			-- Type of `actual_parameter'
		deferred
		ensure
			type_not_void: Result /= Void
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_ACTUAL_PARAMETER_ITEM is
			-- Version of current actual parameter where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		require
			a_parameters_not_void: a_parameters /= Void
		deferred
		ensure
			resolved_type_not_void: Result /= Void
		end

end
