indexing

	description:
	
		"Standard pipe of callbacks filter leading to construction of ax XM_XPATH_TINY_DOCUMENT"
	
	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2002, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
class XM_XPATH_TINYTREE_CALLBACKS_PIPE

inherit

	ANY

	XM_CALLBACKS_FILTER_FACTORY
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new pipe.
		local
			a_dummy: XM_CALLBACKS
			namespace_resolver: XM_NAMESPACE_RESOLVER
		do
			namespace_resolver := new_namespace_resolver
			namespace_resolver.set_forward_xmlns (True)
			start := namespace_resolver
			error := new_stop_on_error
			content := new_content_concatenator
			tree := new_xpath_tinytree_builder
			last := tree
				-- Dummy because we already store 'start' in
				-- a variable of a descendant type
			a_dummy := callbacks_pipe (<<
				start,
				-- new_shared_strings,
				-- -- check this is valuable?
				content,
				error,
				tree >>)
		end
		
feature -- Filters (part of the pipe)

	start: XM_CALLBACKS_FILTER
			-- Starting point for XM_CALLBACKS_SOURCE (e.g. parser)

	error: XM_STOP_ON_ERROR_FILTER
			-- Error collector

	content: XM_CONTENT_CONCATENATOR
			-- Content concatenator
	
	tree: XM_XPATH_TINY_BUILDER
			-- Tree construction

	last: XM_CALLBACKS_FILTER
			-- Last element in the pipe, to which further filters can be added

feature -- Shortcuts

	document: XM_XPATH_TINY_DOCUMENT is
			-- Document (from tree building filter)
		require
			not_error: not error.has_error
		do
			Result := tree.document
		end

	last_error: STRING is
			-- Error (from error filter)
		require
			error: error.has_error
		do
			Result := error.last_error
		ensure
			last_error_not_void: Result /= Void
		end

invariant

	tree_not_void: tree /= Void
	error_not_void: error /= Void

end
