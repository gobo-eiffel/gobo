indexing

	description:

		"Eiffel class names which appear in a comma-separated list of class names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_CLASS_NAME_ITEM

inherit

	ET_AST_NODE

feature -- Access

	class_name_item: ET_CLASS_NAME is
			-- Class name in comma-separated list
		deferred
		ensure
			class_name_item_not_void: Result /= Void
		end

end -- class ET_CLASS_NAME_ITEM
