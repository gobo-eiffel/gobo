indexing

	description:

		"Contexts to evaluate Eiffel types, appearing in a stack"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_STACKED_TYPE_CONTEXT

inherit

	ET_TYPE_CONTEXT
		redefine
			previous_stacked_context
		end

creation

	make

feature {NONE} -- Initialization

	make (a_current: like current_context; a_previous: like previous_stacked_context) is
			-- Create a new context make up of `current_context' appearing
			-- on top of `a_previous' in a stack of contexts.
		require
			a_current_void: a_current /= Void
			a_current_valid: a_current.is_valid_context
			a_previous_not_void: a_previous /= Void
			a_previous_valid: a_previous.is_valid_context
			no_cycle: not a_previous.has_stacked_context (a_current)
		do
			current_context := a_current
			previous_stacked_context := a_previous
		ensure
			current_context_set: current_context = a_current
			previous_stacked_context_set: previous_stacked_context = a_previous
		end

feature -- Access

	type: ET_BASE_TYPE is
			-- Base type of current context
		do
			Result := current_context.type
		end

	context: ET_TYPE_CONTEXT is
			-- Context in which `type' is viewed
		do
			Result := current_context.context
		end

feature -- Linkable

	current_context: ET_TYPE_CONTEXT
			-- Current context in a stack

	previous_stacked_context: ET_TYPE_CONTEXT
			-- Previous context in a stack

invariant

	current_context_not_void: current_context /= Void
	current_context_valid: current_context.is_valid_context
	previous_stacked_context_not_void: previous_stacked_context /= Void
	previous_stacked_context_valid: previous_stacked_context.is_valid_context
	is_valid_context: is_valid_context

end
