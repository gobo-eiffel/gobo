indexing

	description:

		"Eiffel feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FEATURE_CALL

inherit

	ET_AST_NODE

feature -- Access

	target: ET_EXPRESSION is
			-- Target
		deferred
		end

	name: ET_FEATURE_NAME is
			-- Feature name
		deferred
		ensure
			name_not_void: Result /= Void
		end

	arguments: ET_ACTUAL_ARGUMENTS is
			-- Arguments
		deferred
		end

	call_index: INTEGER
			-- Index of current call in enclosing feature;
			-- Used to get dynamic information about this call.

feature -- Status report

	is_qualified_call: BOOLEAN is
			-- Is current call qualified?
		do
			Result := (target /= Void)
		ensure
			definition: Result = (target /= Void)
		end

feature -- Setting

	set_call_index (i: INTEGER) is
			-- Set `call_index' to `i'.
		require
			i_nonnegative: i >= 0
		do
			call_index := i
		ensure
			call_index_set: call_index = i
		end

invariant

	call_index_nonnegative: call_index >= 0

end
