indexing

	description:

		"Eiffel formal arguments"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FORMAL_ARGUMENT

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_type: like type) is
			-- Create a new formal argument.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			name := a_name
			type := a_type
		ensure
			name_set: name = a_name
			type_set: type = a_type
		end

feature -- Access

	name: ET_IDENTIFIER
			-- Name

	type: ET_TYPE
			-- Type

	next: ET_FORMAL_ARGUMENT
			-- Next argument in argument list

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

	set_next (an_argument: like next) is
			-- Set `next' to `an_argument'.
		do
			next := an_argument
		ensure
			next_set: next = an_argument
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

invariant

	name_not_void: name /= Void
	type_not_void: type /= Void

end -- class ET_FORMAL_ARGUMENT
