indexing

	description:

		"Eiffel local variables"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_LOCAL_VARIABLE

inherit

	ET_LOCAL_VARIABLE_ITEM

feature {NONE} -- Initialization

	make (a_name: like name_item; a_type: like type) is
			-- Create a new local variable.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			name_item := a_name
			type := a_type
		ensure
			name_set: name_item = a_name
			type_set: type = a_type
		end

feature -- Access

	name: ET_IDENTIFIER is
			-- Name
		do
			Result := name_item.identifier_item
		ensure
			name_not_void: Result /= Void
		end

	type: ET_TYPE
			-- Type

	name_item: ET_LOCAL_NAME
			-- Name follow by a comma or semicolon

	local_variable_item: ET_LOCAL_VARIABLE is
			-- Local variable in semicolon-separated list
		do
			Result := Current
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := name_item.position
		end

invariant

	name_item_not_void: name_item /= Void

end -- class ET_LOCAL_VARIABLE
