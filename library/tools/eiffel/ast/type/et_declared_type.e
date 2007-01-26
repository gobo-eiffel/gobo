indexing

	description:

		"Eiffel entity declared types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DECLARED_TYPE

inherit

	ET_AST_NODE

feature -- Access

	type: ET_TYPE is
			-- Declared type
		deferred
		ensure
			type_not_void: Result /= Void
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_DECLARED_TYPE is
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
