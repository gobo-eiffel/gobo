indexing

	description:

		"Eiffel fetaure names which appear in a comma-separated list of fetaure names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_FEATURE_NAME_ITEM

inherit

	ET_AST_NODE

feature -- Access

	feature_name_item: ET_FEATURE_NAME is
			-- Feature name in comma-separated list
		deferred
		ensure
			feature_name_item_not_void: Result /= Void
		end

end -- class ET_FEATURE_NAME_ITEM
