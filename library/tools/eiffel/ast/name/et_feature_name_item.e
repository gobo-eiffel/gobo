indexing

	description:

		"Eiffel feature names which appear in a comma-separated list of feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FEATURE_NAME_ITEM

inherit

	ET_AST_NODE

feature -- Access

	feature_name: ET_FEATURE_NAME is
			-- Feature name in comma-separated list
		deferred
		ensure
			feature_name_not_void: Result /= Void
		end

end
