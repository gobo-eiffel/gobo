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
			default_pool := shared_pool.default_pool
			create tree.make (default_pool)
			create emitter.make (tree, default_pool)
			create error.set_next (emitter)
			create namespace_resolver.set_next (error)
			namespace_resolver.set_forward_xmlns (True)
			create attributes.set_next (namespace_resolver)
			create content.set_next (attributes)
			create whitespace.set_next (content)
			create start.set_next (whitespace)
		end

feature -- Name pool

	shared_pool: XM_XPATH_SHARED_NAME_POOL is
			-- The shared name pool
		once
			create Result.make
		end

	default_pool: XM_XPATH_NAME_POOL
			-- The default name pool
	
feature -- Filters (part of the pipe)

	start: XM_UNICODE_VALIDATION_FILTER
			-- Starting point for XM_CALLBACKS_SOURCE (e.g. parser)

	whitespace: XM_WHITESPACE_NORMALIZER
			-- Normalize white space

	content: XM_CONTENT_CONCATENATOR
			-- Content concatenator

	attributes: XM_ATTRIBUTE_DEFAULT_FILTER
			-- Set attribute defaults from the DTD

	error: XM_STOP_ON_ERROR_FILTER
			-- Error collector

feature -- Builder

	emitter: XM_XPATH_CONTENT_EMITTER
			-- Couples pipeline to the tree-builder

	tree: XM_XPATH_TINY_BUILDER
			-- Tree construction

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
