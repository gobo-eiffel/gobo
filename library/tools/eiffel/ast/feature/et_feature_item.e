indexing

	description:

		"Eiffel features in semicolon-separated list of features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FEATURE_ITEM

inherit

	ET_AST_NODE

feature -- Access

	feature_item: ET_FEATURE is
			-- Feature in semicolon-separated list
		deferred
		ensure
			feature_item_not_void: Result /= Void
		end

end
