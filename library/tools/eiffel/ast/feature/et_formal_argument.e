indexing

	description:

		"Eiffel formal arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FORMAL_ARGUMENT

inherit

	ET_FORMAL_ARGUMENT_ITEM

feature {NONE} -- Initialization

	make (a_name: like name_item; a_type: like type) is
			-- Create a new formal argument.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			name_item := a_name
			type := a_type
		ensure
			name_item_set: name_item = a_name
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

	name_item: ET_ARGUMENT_NAME
			-- Name follow by a comma or semicolon

	formal_argument_item: ET_FORMAL_ARGUMENT is
			-- Formal argument in semicolon-separated list
		do
			Result := Current
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := name_item.position
		end

feature -- Setting

	set_type (a_type: like type) is
			-- Set `type' to `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			type := a_type
		ensure
			type_set: type = a_type
		end

feature -- Type processing

	resolve_identifier_types (a_feature: ET_FEATURE; args: ET_FORMAL_ARGUMENTS; a_class: ET_CLASS) is
			-- Replace any 'like identifier' types that appear in the
			-- implementation of current feature in class `a_class' by
			-- the corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types and check validity
			-- of arguments' name. Set `a_class.has_flatten_error' to
			-- true if an error occurs.
		require
			a_feature_not_void: a_feature /= Void
			args_not_void: args /= Void
			a_class_not_void: a_class /= Void
			immediate_or_redeclared: a_feature.implementation_class = a_class
		do
			type := type.resolved_identifier_types (a_feature, args, a_class)
		end

end -- class ET_FORMAL_ARGUMENT
