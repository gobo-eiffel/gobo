indexing

	description:
	
		"Standard pipe of callbacks filter leading to construction of an XM_XPATH_TREE_DOCUMENT"
	
	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
class XM_XPATH_TREE_CALLBACKS_PIPE

inherit

	ANY

	XM_CALLBACKS_FILTER_FACTORY
		export {NONE}
			all
		end

		-- This pipeline is suitable for use by a stand-alone XPath evaluator.
		-- It is not particularly suitable for use by documents to be used as input to
		-- XSLT, as XSLT has more stringent white-space stripping rules, and
		-- in addition, stylesheets must have their comments and PIs stripped.
		
create

	make

feature {NONE} -- Initialization

	make (a_parser: XM_PARSER; is_line_numbering: BOOLEAN) is
			-- Create a new pipe.
		require
			parser_not_void: a_parser /= Void
		local
			a_namespace_resolver: XM_NAMESPACE_RESOLVER
			a_node_factory: XM_XPATH_NODE_FACTORY
			a_locator: XM_XPATH_RESOLVER_LOCATOR
		do
			create a_node_factory
			create tree.make (a_node_factory)
			create a_locator.make (a_parser)
			tree.set_document_locator (a_locator)
			tree.set_line_numbering (is_line_numbering)
			error := a_parser.new_stop_on_error_filter
			create emitter.make (tree, error)
			create a_namespace_resolver.set_next (emitter)
			a_namespace_resolver.set_forward_xmlns (True)
			create attributes.set_next (a_namespace_resolver)
			create content.set_next (attributes)
			create whitespace.set_next (content)
			create start.set_next (whitespace)
		end

feature -- Access

	start: XM_UNICODE_VALIDATION_FILTER
			-- Starting point for XM_CALLBACKS_SOURCE (e.g. parser)

	whitespace: XM_WHITESPACE_NORMALIZER
			-- Normalize white space

	content: XM_CONTENT_CONCATENATOR
			-- Content concatenator

	attributes: XM_ATTRIBUTE_DEFAULT_FILTER
			-- Set attribute defaults from the DTD
	
	error: XM_PARSER_STOP_ON_ERROR_FILTER
			-- Error collector

	emitter: XM_XPATH_CONTENT_EMITTER
			-- Couples pipeline to the tree-builder

	tree: XM_XPATH_TREE_BUILDER
			-- Tree construction

--	debugger: XM_PRETTY_PRINT_FILTER
			-- Only used when debugging

	document: XM_XPATH_TREE_DOCUMENT is
			-- Document (from tree building filter)
		require
			not_error: not tree.has_error
		do
			Result := tree.tree_document
		end

	last_error: STRING is
			-- Error (from error filter)
		require
			error: tree.has_error
		do
			Result := tree.last_error
		ensure
			last_error_not_void: Result /= Void
		end

invariant

	tree_not_void: tree /= Void

end
