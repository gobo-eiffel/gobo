indexing

	description:

		"Contexts to evaluate Eiffel types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPE_CONTEXT

feature -- Access

	type: ET_BASE_TYPE is
			-- Base type of current context
		deferred
		ensure
			type_not_void: Result /= Void
		end

	context: ET_TYPE_CONTEXT is
			-- Context in which `type' is viewed
		deferred
		ensure
			context_not_void: Result /= Void
			same_root_context: Result.root_context = root_context
			valid_context: is_valid_context implies Result.is_valid_context
		end

	root_context: ET_TYPE_CONTEXT is
			-- Context of `type', or recursively the context of
			-- its context, such that its context is itself
		do
			Result := context.root_context
		ensure
			root_context_not_void: Result /= Void
			is_root: Result.context = Result
			same_root_context: Result.root_context = Result
			valid_context: is_valid_context implies Result.is_valid_context
		end

feature -- Status report

	is_valid_context: BOOLEAN is
			-- A context is valid if the `type' of its `root_context'
			-- is only made up of class names and formal generic
			-- parameter names, and if the actual parameters of these
			-- formal parameters are themselves in current context
		local
			a_context: like root_context
		do
			a_context := root_context
			Result := a_context.type.is_valid_context_type (a_context)
		end

	is_root_context: BOOLEAN is
			-- Is current context its own root context?
		do
			-- Result := False
		ensure
			definition: Result = (root_context = Current)
		end

	has_context (a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Is `a_context' the current context, or
			-- recursively the context of its context?
		require
			a_context_not_void: a_context /= Void
		do
			if a_context = Current then
				Result := True
			else
				Result := context.has_context (a_context)
			end
		end

	same_context (other: ET_TYPE_CONTEXT): BOOLEAN is
			-- Are current context and `other' considered the same?
		require
			other_not_void: other /= Void
			same_root: same_root_context (other)
		do
			Result := other = Current
		ensure
			identity: (other = Current) implies Result
		end

	same_root_context (other: ET_TYPE_CONTEXT): BOOLEAN is
			-- Do current context and `other' have the same root context?
		require
			other_not_void: other /= Void
		do
			Result := other.root_context = root_context
		ensure
			definition: Result = (other.root_context = root_context)
		end

feature -- Stacked contexts

	previous_stacked_context: ET_TYPE_CONTEXT is
			-- Previous context in a stack of contexts
		do
			-- Result := Void
		end

	has_stacked_context (a_context: ET_TYPE_CONTEXT) : BOOLEAN is
			-- Is `a_context' the same context as current context,
			-- or recursively the same context as the context of
			-- `previous_stacked_context'?
		require
			a_context_not_void: a_context /= Void
		do
			if same_context (a_context) then
				Result := True
			elseif previous_stacked_context /= Void then
				Result := previous_stacked_context.has_stacked_context (a_context)
			end
		end

end
