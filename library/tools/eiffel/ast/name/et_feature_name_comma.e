indexing

	description:

		"Eiffel feature names followed by a comma"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FEATURE_NAME_COMMA

inherit

	ET_FEATURE_NAME_ITEM

creation

	make

feature {NONE} -- Initialization

	make (a_name: like feature_name_item; a_comma: like comma) is
			-- Create a new feature_name-comma.
		require
			a_name_not_void: a_name /= Void
		do
			feature_name_item := a_name
		ensure
			feature_name_item_set: feature_name_item = a_name
		end

feature -- Access

	feature_name_item: ET_FEATURE_NAME
			-- Feature name in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := feature_name_item.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := comma.break
		end

invariant

	comma_not_void: comma /= Void

end -- class ET_FEATURE_NAME_COMMA
