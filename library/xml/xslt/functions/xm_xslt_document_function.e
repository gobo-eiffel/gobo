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
			a_base_uri: UT_URI
			a_node, another_node: XM_XPATH_NODE
			a_document: XM_XPATH_DOCUMENT
			a_uri, a_fragment_id: STRING
			a_splitter: ST_SPLITTER
			uri_parts: DS_LIST [STRING]
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
			create a_splitter.make
			a_splitter.set_separators ("#")
			uri_parts := a_splitter.split (an_item.string_value)
			if uri_parts.count > 2 then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} Result.make
			else
				a_uri := uri_parts.item (1)
				if uri_parts.count = 2 then
					a_fragment_id := uri_parts.item (2)
				end
				parse_document (a_uri, a_base_uri, a_context)
				if last_evaluated_document.is_error then
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} Result.make
				else
					a_document ?= last_evaluated_document
					check
						document: a_document /= Void
						-- as `parse_document' only returns documents or invalid items
					end
					if a_fragment_id /= Void and then is_ncname (a_fragment_id) then

						-- Note the test for `is_ncname'. If not, it is a recoverable error
						--  and we recover silently by ignoring the fragment id
						--  and returning the document node

						-- Note we are ignoring any media-type (as we don't have the information)
						--  and assuming that the rules for the media-type concerned are
						--  that the ID selects one element node (and it's descendants).
						-- TODO: review this
	
						another_node := a_document.selected_id (a_fragment_id)
					else
						another_node := a_document
					end
					create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_NODE]} Result.make (another_node)
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

end
	

