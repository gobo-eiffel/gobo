indexing

	description:

		"Eiffel local variables"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_LOCAL_VARIABLE

inherit

	ET_LOCAL_VARIABLE_ITEM

feature {NONE} -- Initialization

	make (a_name: like name_item; a_type: like declared_type) is
			-- Create a new local variable.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			name_item := a_name
			declared_type := a_type
		ensure
			name_set: name_item = a_name
			declared_type_set: declared_type = a_type
		end

feature -- Access

	name: ET_IDENTIFIER is
			-- Name
		do
			Result := name_item.identifier
		ensure
			name_not_void: Result /= Void
		end

	type: ET_TYPE is
			-- Type
		do
			Result := declared_type.declared_type
		end

	name_item: ET_LOCAL_NAME
			-- Name follow by a comma or semicolon

	declared_type: ET_DECLARED_TYPE
			-- Declared type (type preceded by a colon)

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
	declared_type_not_void: declared_type /= Void

end
