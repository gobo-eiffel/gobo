indexing

	description:

		"Objects that implement the XSLT document() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DOCUMENT_FUNCTION

inherit

	XM_XPATH_DOC_ROUTINES

	XM_XPATH_NODE_MAPPING_FUNCTION
	
	XM_XPATH_SYSTEM_FUNCTION
		redefine
			check_arguments, compute_special_properties, pre_evaluate, iterator
		end

	XM_UNICODE_CHARACTERS_1_1

	XM_XPATH_SHARED_ANY_NODE_TEST

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "document"
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (0)
			arguments.set_equality_tester (expression_tester)
			compute_static_properties
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := any_node_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			if argument_number = 1 then
				create Result.make_any_sequence
			else
				create Result.make_single_node
			end
		end

feature -- Evaluation

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		local
			an_href_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_base_uri: UT_URI
			a_base_node: XM_XPATH_NODE
			an_item: XM_XPATH_ITEM
			a_map_object: XM_XSLT_DOCUMENT_INFORMATION
			a_mapping_iterator: XM_XPATH_NODE_MAPPING_ITERATOR
			a_comparer: XM_XPATH_GLOBAL_ORDER_COMPARER
			an_xslt_context: XM_XSLT_EVALUATION_CONTEXT
		do
			an_href_iterator := arguments.item (1).iterator (a_context)
			if not an_href_iterator.is_error then
				if supplied_argument_count = 2 then
					arguments.item (2).evaluate_item (a_context)
					an_item := arguments.item (2).last_evaluated_item
					if an_item.is_error then
						create {XM_XPATH_INVALID_ITERATOR} Result.make (an_item.error_value)
					else
						a_base_node ?= an_item
						check
							item_is_node: a_base_node /= Void
							-- Static typing
						end
						create a_base_uri.make (a_base_node.base_uri)
					end
				end
				if Result = Void then -- no error yet
					if transformer = Void then
						an_xslt_context ?= a_context
						check
							xslt_context_not_void: an_xslt_context /= Void
							-- as this is an XSLT function
						end
						transformer := an_xslt_context.transformer
					end
					create a_map_object.make (a_base_uri, stylesheet_base_uri)
					create a_mapping_iterator.make (an_href_iterator, Current, a_context, a_map_object)
					create a_comparer
					create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} Result.make (a_mapping_iterator, a_comparer) -- to eliminate duplicates if two hrefs are the same
				end
			else
				Result := an_href_iterator
			end
		end

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT; an_information_object: ANY): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- Map `an_item' to a sequence
		local
			a_map_object: XM_XSLT_DOCUMENT_INFORMATION
			a_base_uri, a_uri: UT_URI
			a_node: XM_XPATH_NODE
			a_document: XM_XPATH_DOCUMENT
			a_uri_reference: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			a_map_object ?= an_information_object
			check
				document_information: a_map_object /= Void
				-- as that was what was passed in `iterator'
			end
			a_base_uri := a_map_object.base_uri
			if a_base_uri = Void then
				a_node ?= an_item
				if a_node /= Void then
					create a_base_uri.make (a_node.base_uri)
				else
					a_base_uri := a_map_object.stylesheet_base_uri
				end
			end
			a_uri_reference := an_item.string_value
			if uri_encoding.has_excluded_characters (a_uri_reference) then
				create an_error.make_from_string ("Argument to fn:document is not a valid URI", Xpath_errors_uri, "FODC0005", Dynamic_error)
				transformer.report_recoverable_error (an_error, Void)
				if not transformer.is_error then
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} Result.make
				end		
			else
				create a_uri.make_resolve (a_base_uri, a_uri_reference)
				parse_document (an_item.string_value, a_base_uri, a_context)
				if last_evaluated_document.is_error then
					transformer.report_recoverable_error (last_evaluated_document.error_value, Void)
					if not transformer.is_error then
						create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} Result.make
					end
				else
					a_document ?= last_evaluated_document
					check
						document: a_document /= Void
						-- as `parse_document' only returns documents or invalid items
					end
					if a_uri.has_fragment then
						Result := fragment (a_uri, a_document)
					else
						create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_NODE]} Result.make (a_document)
					end
				end
			end
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			--	do_nothing
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end
	
	compute_special_properties is
			-- Compute special properties.
		do
			initialize_special_properties
			set_ordered_nodeset
			set_peer_nodeset

			-- Declaring it as a peer node-set expression avoids sorting of expressions such as document(XXX)/a/b/c

		end
	
feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		do
			Precursor (a_context)
			stylesheet_base_uri := a_context.base_uri
			arguments.item (1).set_unsorted (False)
		end

feature {NONE} -- Implementation

	stylesheet_base_uri: UT_URI
			-- Base URI from static context

	configuration: XM_XSLT_CONFIGURATION
			-- Configuration, for XPointer options

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer, for error reovery

	fragment (a_uri: UT_URI; a_document: XM_XPATH_DOCUMENT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- Node sequence from fragment of `a_uri'
		require
			uri_has_fragment: a_uri /= Void and then a_uri.has_fragment
			document_not_void: a_document /= Void
			transformer_not_void: transformer /= Void
		local
			a_media_type: UT_MEDIA_TYPE
			a_fragment_id: STRING
			media_type_ok, use_xpointer: BOOLEAN
			an_error: XM_XPATH_ERROR_VALUE
			a_node: XM_XPATH_NODE
			two_booleans: INTEGER
		do
			a_fragment_id := a_uri.fragment_item.decoded_utf8
			if configuration = Void then configuration := transformer.configuration end
			a_media_type ?= last_evaluated_media_type
			if a_media_type = Void then a_media_type := configuration.default_media_type (a_uri.full_uri) end
			two_booleans := media_type_correctness (a_media_type)
			if two_booleans > 0 then
				media_type_ok := True
				if two_booleans = 2 then
					use_xpointer := True
				end
			end
			if not media_type_ok then
				create an_error.make_from_string ("Media-type is not recognized, or the fragment identifier does not conform to the rules for the media-type", "", "XT1160", Dynamic_error)
				transformer.report_recoverable_error (an_error, Void)
				if not transformer.is_error then
					a_node := a_document
				end
			else
				a_node := Void
				if use_xpointer then
					Result := xpointer_fragment (a_fragment_id, a_document)
				else
					a_node := a_document.selected_id (a_fragment_id)
				end
			end
			if Result = Void and then a_node = Void then create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_NODE]} Result.make (a_node) end
		ensure
			error_or_not_void: not transformer.is_error implies Result /= Void
		end

	media_type_correctness (a_media_type: UT_MEDIA_TYPE): INTEGER is
			-- Correctnes and Xpointer-uasge for `a_media_type'
		require
			media_type_not_void:  a_media_type /= Void
		local
			a_type, a_subtype: STRING
			media_type_ok, use_xpointer: BOOLEAN
		do
			a_type := a_media_type.type
			a_subtype := a_media_type.subtype
			if a_type.is_equal ("text") then
				if a_subtype.is_equal ("html") then
					if configuration.assume_html_is_xhtml then
						a_type := "application"; a_subtype := "xhtml+xml"
					end
				end
				if a_subtype.is_equal ("xml") or else a_subtype.is_equal ("xml-external-parsed-entity") then
					if configuration.use_xpointer then
						use_xpointer := True; media_type_ok := True
					end
				end
			end
			if a_type.is_equal ("application") then
				if a_subtype.is_equal ("xml") or else a_subtype.is_equal ("xml-external-parsed-entity") or else a_subtype.is_equal ("xslt+xml") then
					if configuration.use_xpointer then
						use_xpointer := True; media_type_ok := True
					end
				elseif a_subtype.is_equal ("xhtml+xml") then
					media_type_ok := True; use_xpointer := configuration.use_xpointer
				elseif a_subtype.count > 4 and then a_subtype.substring (a_subtype.count - 4, a_subtype.count).is_equal ("+xml") then
					if configuration.use_xpointer then
						use_xpointer := True; media_type_ok := True
					end
				end
			end
			if media_type_ok then
				Result := 1
				if use_xpointer then Result := 2 end
			end
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
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
			a_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
			a_node_value: XM_XPATH_SINGLETON_NODE
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
			an_empty_sequence ?= a_value
			if an_empty_sequence /= Void then
				a_node := a_document
			elseif a_value.is_error then
				create an_error.make_from_string ("XPointer reported an error", "", "XT1160", Dynamic_error)
				transformer.report_recoverable_error (an_error, Void)
				if not transformer.is_error then
					a_node := a_document
				end
			else
				a_node_value ?= a_value
				if a_node_value = Void then
					a_sequence_extent ?= a_value
					check
						sequence_extent: a_sequence_extent /= Void
						-- Only remaining possibility
					end
					if a_sequence_extent.is_node_sequence then
						Result := a_sequence_extent.node_iterator
					else
						create an_error.make_from_string ("XPointer returned something other than a sequence of nodes", "", "XT1160", Dynamic_error)
						transformer.report_recoverable_error (an_error, Void)
						if not transformer.is_error then
							a_node := a_document
						end
					end
				else
					a_node := a_node_value.node
				end
			end
			if not transformer.is_error then
				if Result = Void then
					create  {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_NODE]} Result.make (a_node)
				end
			end
		ensure
			error_or_not_void: not transformer.is_error implies Result /= Void
		end

end
	

