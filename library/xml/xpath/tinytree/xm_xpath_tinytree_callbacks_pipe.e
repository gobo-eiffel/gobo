note

	description:

		"Standard pipe of callbacks filter leading to construction of an XM_XPATH_TINY_DOCUMENT"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINYTREE_CALLBACKS_PIPE

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

	make (a_parser: XM_PARSER; is_line_numbering: BOOLEAN; a_base_uri: STRING; a_document_uri: detachable UT_URI)
			-- Create a new pipe.
		require
			a_parser_not_void: a_parser /= Void
			a_base_uri_not_void: a_base_uri /= Void
		local
			namespace_resolver: XM_NAMESPACE_RESOLVER
			a_locator: XM_XPATH_RESOLVER_LOCATOR
		do
			create tree.make (a_base_uri, a_document_uri)
			create a_locator.make (a_parser)
			tree.set_document_locator (a_locator)
			tree.set_line_numbering (is_line_numbering)
			error := a_parser.new_stop_on_error_filter
			create emitter.make (tree, error)
			create namespace_resolver.make_next (emitter)
			namespace_resolver.set_forward_xmlns (True)
			create attributes.make_next (namespace_resolver)
			attributes.set_next_dtd (emitter)
			create content.make_next (attributes)
			create whitespace.make_next (content)
			create start.make_next (whitespace)
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

	tree: XM_XPATH_TINY_BUILDER
			-- Tree construction

	document: detachable XM_XPATH_TINY_DOCUMENT
			-- Document (from tree building filter)
		require
			not_error: not error.has_error
		do
			Result := tree.tiny_document
		end

	last_error: STRING
			-- Error (from error filter)
		require
			error: error.has_error
		do
			check invariant_XM_STOP_ON_ERROR_FILTER_last_error_not_void: attached error.last_error as l_last_error then
				Result := l_last_error
			end
		ensure
			last_error_not_void: Result /= Void
		end

invariant

	tree_not_void: tree /= Void

end
