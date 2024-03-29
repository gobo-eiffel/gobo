note

	description:

		"Objects that support the XSLT document() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_DOCUMENT_INFORMATION

inherit

	ANY

	XM_XPATH_NODE_MAPPING_FUNCTION
		export {NONE} all end

	XM_XPATH_DOC_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_base_uri: detachable UT_URI; a_stylesheet_base_uri: UT_URI; a_transformer: XM_XSLT_TRANSFORMER)
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

	base_uri: detachable UT_URI
	stylesheet_base_uri: UT_URI
			-- Base URIs

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer, for error reovery

	last_node_iterator: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Result from `map_nodes'

feature -- Evaluation

	map_nodes (a_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT)
			-- Map `a_item' to a sequence
		local
			l_base_uri, l_uri: UT_URI
			l_document: XM_XPATH_DOCUMENT
			l_uri_reference: STRING
			l_error: XM_XPATH_ERROR_VALUE
			l_last_node_iterator: like last_node_iterator
		do
			if not attached base_uri as l_base_uri2 then
				if a_item.is_node then
					check attached a_item.as_node.base_uri as l_node_base_uri then
						create l_base_uri.make (l_node_base_uri)
					end
				else
					l_base_uri := stylesheet_base_uri
				end
			else
				l_base_uri := l_base_uri2
			end
			l_uri_reference := a_item.string_value
			if uri_encoding.has_excluded_characters (l_uri_reference) then
				l_uri_reference := escaped_uri (l_uri_reference)
			end
			if l_uri_reference.occurrences ('#') > 1 then
				create l_error.make_from_string ("Argument to fn:document is not a valid URI", Xpath_errors_uri, "FODC0005", Dynamic_error)
				transformer.report_recoverable_error (l_error)
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} l_last_node_iterator.make
				last_node_iterator := l_last_node_iterator
 				if transformer.is_error then
					l_last_node_iterator.set_last_error (l_error)
				end
			else
				create l_uri.make_resolve (l_base_uri, l_uri_reference)
				parse_document (a_item.string_value, l_base_uri, a_context)
				check attached last_evaluated_document as l_last_evaluated_document then
					if attached l_last_evaluated_document.error_value as l_error_value then
						check is_error: l_last_evaluated_document.is_error end
						transformer.report_recoverable_error (l_error_value)
						create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_node_iterator.make
					else
						check
							document: l_last_evaluated_document.is_document
							-- as `parse_document' only returns documents or invalid items
						end
						l_document := l_last_evaluated_document.as_document
						if l_uri.has_fragment then
							last_node_iterator := fragment (l_uri, l_document)
							if last_node_iterator = Void then
								create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} l_last_node_iterator.make
								last_node_iterator := l_last_node_iterator
								check attached fragment_error_value as l_fragment_error_value then
									l_last_node_iterator.set_last_error (l_fragment_error_value)
								end
							end
						else
							create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_node_iterator.make (l_document)
						end
					end
				end
			end
		end

feature {NONE} -- Implementation

	fragment_error_value: detachable XM_XPATH_ERROR_VALUE
			-- Set by `fragment'

	configuration: detachable XM_XSLT_CONFIGURATION
			-- Configuration

	fragment (a_uri: UT_URI; a_document: XM_XPATH_DOCUMENT): detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Node sequence from fragment of `a_uri'
		require
			uri_has_fragment: a_uri /= Void and then a_uri.has_fragment
			document_not_void: a_document /= Void
			transformer_not_void: transformer /= Void
		local
			l_media_type: detachable UT_MEDIA_TYPE
			l_fragment_id: detachable STRING
			l_media_type_map: XM_XSLT_MEDIA_TYPE_MAP
			l_node: detachable XM_XPATH_NODE
			l_error: BOOLEAN
			l_configuration: like configuration
			l_fragment_error_value: like fragment_error_value
		do
			check precondition_has_fragment: attached a_uri.fragment_item as l_uri_fragment_item then
				l_fragment_id := l_uri_fragment_item.decoded_utf8
				if l_fragment_id = Void then
					l_error := True
				else
					l_configuration := configuration
					if l_configuration = Void then
						l_configuration := transformer.configuration
						configuration := l_configuration
					end
					l_media_type := last_evaluated_media_type
					if l_media_type = Void then
						l_media_type := l_configuration.default_media_type (a_uri.full_uri)
					end
					l_media_type_map := l_configuration.media_type_map
					l_media_type_map.check_fragment_processing_rules (l_media_type, l_configuration.assume_html_is_xhtml)
					if l_media_type_map.may_use_xpointer then
						Result := xpointer_fragment (l_fragment_id, a_document)
						l_error := Result = Void
					elseif l_media_type_map.may_use_id then
						l_node := a_document.selected_id (l_fragment_id)
						if l_node = Void then
							l_error := True
						else
							create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (l_node)
						end
					else
						l_error := True
					end
				end
				if l_error then
					create l_fragment_error_value.make_from_string ("Media-type is not recognized, or the fragment identifier does not conform to the rules for the media-type",
																				 Xpath_errors_uri, "XTRE1160", Dynamic_error)
					fragment_error_value := l_fragment_error_value
					transformer.report_recoverable_error (l_fragment_error_value)
					if not transformer.is_error then
						create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (a_document)
					end
				end
			end
		ensure
			error_or_not_void: not transformer.is_error implies Result /= Void
		end

	xpointer_fragment (a_fragment_id: STRING; a_document: XM_XPATH_DOCUMENT): detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
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
			a_node: detachable XM_XPATH_NODE
			an_error: XM_XPATH_ERROR_VALUE
			l_result: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			create an_xpointer_processor.make (False)
			create an_element_scheme.make
			create an_xpath_scheme.make
			create an_xmlns_scheme.make
			an_xpointer_processor.register_scheme (an_element_scheme)
			an_xpointer_processor.register_scheme (an_xmlns_scheme)
			an_xpointer_processor.register_scheme (an_xpath_scheme)
			an_xpointer_processor.evaluate (a_fragment_id, a_document)
			check postcondition_of_evaluate: attached an_xpointer_processor.value as l_value then
				a_value := l_value
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
						l_result := a_sequence_extent.node_iterator (False)
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
					if l_result = Void then
						create  {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (a_node)
					else
						Result := l_result
					end
				end
			end
		ensure
			error_or_not_void: not transformer.is_error implies Result /= Void
		end

invariant

	stylesheet_base_uri_not_void: stylesheet_base_uri /= Void
	transformer_not_void: transformer /= Void

end


