note

	description:

		"Standard pipe of callbacks filter leading to construction of a tree of XM_NODEs"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TREE_CALLBACKS_PIPE

inherit

	ANY

	XM_CALLBACKS_FILTER_FACTORY
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new pipe.
		local
			a_dummy: XM_CALLBACKS
		do
			start := new_namespace_resolver
			error := new_stop_on_error
			create tree.make_null
			last := tree
				-- Dummy because we already store 'start' in
				-- a variable of a descendant type
			a_dummy := callbacks_pipe (<<
				start,
				-- new_shared_strings,
				-- -- check this is valuable?
				error,
				tree >>)
		end

feature -- Filters (part of the pipe)

	start: XM_CALLBACKS_FILTER
			-- Starting point for XM_CALLBACKS_SOURCE (e.g. parser)

	error: XM_STOP_ON_ERROR_FILTER
			-- Error collector

	tree: XM_CALLBACKS_TO_TREE_FILTER
			-- Tree construction

	last: XM_CALLBACKS_FILTER
			-- Last element in the pipe, to which further filters can be added

feature -- Shortcuts

	document: XM_DOCUMENT
			-- Document (from tree building filter)
		require
			not_error: not error.has_error
		do
			Result := tree.document
		end

	last_error: STRING
			-- Error (from error filter)
		require
			error: error.has_error
		do
			check has_error: attached error.last_error as l_last_error then
				Result := l_last_error
			end
		ensure
			last_error_not_void: Result /= Void
		end

invariant

	tree_not_void: tree /= Void
	error_not_void: error /= Void

end
