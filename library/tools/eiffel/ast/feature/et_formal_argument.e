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

	make (a_name: like name_item; a_type: like declared_type) is
			-- Create a new formal argument.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			name_item := a_name
			declared_type := a_type
		ensure
			name_item_set: name_item = a_name
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

	name_item: ET_ARGUMENT_NAME
			-- Name follow by a comma or semicolon

	declared_type: ET_DECLARED_TYPE
			-- Declared type (type preceded by a colon)

	formal_argument: ET_FORMAL_ARGUMENT is
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

	set_declared_type (a_type: like declared_type) is
			-- Set `declared_type' to `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			declared_type := a_type
		ensure
			declared_type_set: declared_type = a_type
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
			declared_type := declared_type.resolved_identifier_types (a_feature, args, a_class)
		end

invariant

	name_item_not_void: name_item /= Void
	declared_type_not_void: declared_type /= Void

end
