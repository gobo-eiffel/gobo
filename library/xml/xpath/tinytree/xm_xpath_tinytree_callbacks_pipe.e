indexing

	description:
	
		"Standard pipe of callbacks filter leading to construction of an XM_XPATH_TINY_DOCUMENT"
	
	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
class XM_XPATH_TINYTREE_CALLBACKS_PIPE

inherit

	ANY

	XM_CALLBACKS_FILTER_FACTORY
		export {NONE}
			all
		end

	XM_XPATH_SHARED_NAME_POOL
		
		-- This pipeline is suitable for use by a stand-alone XPath evaluator.
		-- It is not particularly suitable for use by documents to be used as input to
		-- XSLT, as XSLT has more stringent white-space stripping rules, and
		-- in addition, stylesheets must have their comments and PIs stripped.
		
creation

	make

feature {NONE} -- Initialization

	make (a_system_id: STRING) is
			-- Create a new pipe.
		require
			system_id_not_void: a_system_id /= Void
		local
			a_dummy: XM_CALLBACKS
			namespace_resolver: XM_NAMESPACE_RESOLVER
		do
			shared_pool := default_pool.default_pool
			create tree.make (shared_pool)
			tree.set_system_id (a_system_id)
			create emitter.make (tree, shared_pool)
			create error.set_next (emitter)
			create namespace_resolver.set_next (error)
			namespace_resolver.set_forward_xmlns (True)
			create attributes.set_next (namespace_resolver)
			create content.set_next (attributes)
			create whitespace.set_next (content)
			create start.set_next (whitespace)
		end

feature -- Access

	shared_pool: XM_XPATH_NAME_POOL
			-- The default name pool

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

	emitter: XM_XPATH_CONTENT_EMITTER
			-- Couples pipeline to the tree-builder

	tree: XM_XPATH_TINY_BUILDER
			-- Tree construction

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

end
