indexing

	description:

		"Objects that support the XSLT document() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DOCUMENT_INFORMATION

inherit

	ANY -- SE 2.1

	XM_XPATH_NODE_MAPPING_FUNCTION

	XM_XPATH_DOC_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_base_uri, a_stylesheet_base_uri: UT_URI; a_transformer: XM_XSLT_TRANSFORMER) is
			-- Establish invariant
		require
			stylesheet_base_uri_not_void: a_stylesheet_base_uri /= Void
			transformer_not_void: a_transformer /= Void
		do
			base_uri := a_base_uri
			stylesheet_base_uri := a_stylesheet_base_uri
			transformer := a_transformer
		ensure
			base_uri_set: base_uri = a_base_uri
			stylesheet_base_uri_set: stylesheet_base_uri = a_stylesheet_base_uri
			transformer_set: transformer = a_transformer
		end

feature -- Access
	
	base_uri, stylesheet_base_uri: UT_URI
			-- Base URIs

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer, for error reovery

feature -- Evaluation
	
	map_nodes (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		local
			a_base_uri, a_uri: UT_URI
			a_document: XM_XPATH_DOCUMENT
			a_uri_reference: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			if a_base_uri = Void then
				if an_item.is_node then
					create a_base_uri.make (an_item.as_node.base_uri)
				else
					a_base_uri := stylesheet_base_uri
				end
			end
			a_uri_reference := an_item.string_value
			if uri_encoding.has_excluded_characters (a_uri_reference) then
				create an_error.make_from_string ("Argument to fn:document is not a valid URI", Xpath_errors_uri, "FODC0005", Dynamic_error)
				transformer.report_recoverable_error (an_error)
				create {XM_XPATH_EMPTY_ITERATOR} last_node_iterator.make
 				if transformer.is_error then
					last_node_iterator.set_last_error (an_error)
				end
			else
				create a_uri.make_resolve (a_base_uri, a_uri_reference)
				parse_document (an_item.string_value, a_base_uri, a_context)
				if last_evaluated_document.is_error then
					transformer.report_recoverable_error (last_evaluated_document.error_value)
					if not transformer.is_error then
						create {XM_XPATH_EMPTY_ITERATOR} last_node_iterator.make
					end
				else
					check
						document: last_evaluated_document.is_document
						-- as `parse_document' only returns documents or invalid items
					end
					a_document := last_evaluated_document.as_document
					if a_uri.has_fragment then
						last_node_iterator := fragment (a_uri, a_document)
						if last_node_iterator = Void then
							create {XM_XPATH_EMPTY_ITERATOR} last_node_iterator.make
							last_node_iterator.set_last_error (fragment_error_value)
						end
					else
						create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_node_iterator.make (a_document)
					end
				end
			end
		end

feature {NONE} -- Implementation

	fragment_error_value: XM_XPATH_ERROR_VALUE
			-- Set by `fragment'

	configuration: XM_XSLT_CONFIGURATION
			-- Configuration

	fragment (a_uri: UT_URI; a_document: XM_XPATH_DOCUMENT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- Node sequence from fragment of `a_uri'
		require
			uri_has_fragment: a_uri /= Void and then a_uri.has_fragment
			document_not_void: a_document /= Void
			transformer_not_void: transformer /= Void
		local
			a_media_type: UT_MEDIA_TYPE
			a_fragment_id: STRING
			a_media_type_map: XM_XSLT_MEDIA_TYPE_MAP
			a_node: XM_XPATH_NODE
			in_error: BOOLEAN
		do
			a_fragment_id := a_uri.fragment_item.decoded_utf8
			if configuration = Void then configuration := transformer.configuration end
			a_media_type := last_evaluated_media_type
			if a_media_type = Void then a_media_type := configuration.default_media_type (a_uri.full_uri) end
			a_media_type_map := configuration.media_type_map
			a_media_type_map.check_fragment_processing_rules (a_media_type, configuration.assume_html_is_xhtml)
			if a_media_type_map.may_use_xpointer then
				Result := xpointer_fragment (a_fragment_id, a_document)
				in_error := Result = Void
			elseif a_media_type_map.may_use_id then
				a_node := a_document.selected_id (a_fragment_id)
				if a_node = Void then
					in_error := True
				else
					create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (a_node)
				end
			else
				in_error := True
			end
			if in_error then
				create fragment_error_value.make_from_string ("Media-type is not recognized, or the fragment identifier does not conform to the rules for the media-type",
																			 Xpath_errors_uri, "XTRE1160", Dynamic_error)
				transformer.report_recoverable_error (fragment_error_value)
				if not transformer.is_error then
					create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (a_document)
				end
			end
		ensure
			error_or_not_void: not transformer.is_error implies Result /= Void
		end

	xpointer_fragment (a_fragment_id: STRING; a_document: XM_XPATH_DOCUMENT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- Node sequence from xpointer
		require
			fragment_not_empty: a_fragment_id /= Void and then a_fragment_id.count > 0
			document_not_void: a_document /= Void
			transformer_not_void: transformer /= Void
			configuration_not_void: configuration /= Void
		local
			an_xpointer_processor: XM_XPATH_XPOINTER
			an_element_scheme: XM_XPATH_XPOINTER_ELEMENT_SCHEME
			an_xpath_scheme: XM_XPATH_XPOINTER_XPATH_SCHEME
			an_xmlns_scheme: XM_XPATH_XPOINTER_XMLNS_SCHEME
			a_value: XM_XPATH_VALUE
			a_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
			a_node: XM_XPATH_NODE
			an_error: XM_XPATH_ERROR_VALUE
		do
			create an_xpointer_processor.make (False)
			create an_element_scheme.make
			create an_xpath_scheme.make
			create an_xmlns_scheme.make
			an_xpointer_processor.register_scheme (an_element_scheme)
			an_xpointer_processor.register_scheme (an_xmlns_scheme)
			an_xpointer_processor.register_scheme (an_xpath_scheme)
			an_xpointer_processor.evaluate (a_fragment_id, a_document)
			a_value := an_xpointer_processor.value
			if a_value.is_error or else a_value.is_empty_sequence then
				create an_error.make_from_string ("XPointer reported an error",
															 Xpath_errors_uri, "XTRE1160", Dynamic_error)
				transformer.report_recoverable_error (an_error)
				if not transformer.is_error then
					a_node := a_document
				end
			elseif not a_value.is_singleton_node then
				check
					sequence_extent: a_value.is_sequence_extent
					-- Only remaining possibility
				end
				a_sequence_extent := a_value.as_sequence_extent
				if a_sequence_extent.is_node_sequence then
					Result := a_sequence_extent.node_iterator (False)
				else
					create an_error.make_from_string ("XPointer returned something other than a sequence of nodes",
																 Xpath_errors_uri, "XTRE1160", Dynamic_error)
					transformer.report_recoverable_error (an_error)
					if not transformer.is_error then
						a_node := a_document
					end
				end
			else
				a_node := a_value.as_singleton_node.node
			end
			if not transformer.is_error then
				if Result = Void then
					create  {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (a_node)
				end
			end
		ensure
			error_or_not_void: not transformer.is_error implies Result /= Void
		end

invariant

	stylesheet_base_uri_not_void: stylesheet_base_uri /= Void
	transformer_not_void: transformer /= Void

end
	

