indexing

	description:

		"Eiffel assigners"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ASSIGNER

inherit

	ET_AST_NODE

feature -- Access

	feature_name: ET_FEATURE_NAME is
			-- Feature name
		deferred
		ensure
			feature_name_not_void: Result /= Void
		end

end
