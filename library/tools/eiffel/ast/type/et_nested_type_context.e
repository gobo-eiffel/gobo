indexing

	description:

		"Nested contexts to evaluate Eiffel types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_NESTED_TYPE_CONTEXT

inherit

	ET_TYPE_CONTEXT

creation

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_context: like context) is
			-- Create a new nested type context.
		require
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
			type := a_type
			context := a_context
		ensure
			type_set: type = a_type
			context_set: context = a_context
		end

feature -- Access

	type: ET_TYPE
			-- Type of current context

	context: ET_TYPE_CONTEXT
			-- Context in which `type' is viewed

feature -- Setting

	set (a_type: like type; a_context: like context) is
			-- Create a new nested type context.
		require
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			no_cycle: not a_context.has_context (Current)
			a_context_valid: a_context.is_valid_context
		do
			type := a_type
			context := a_context
		ensure
			type_set: type = a_type
			context_set: context = a_context
		end

invariant

	is_valid_context: is_valid_context

end
