﻿note

	description:

		"Objects that implement the XSLT document() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_DOCUMENT_FUNCTION

inherit

	XM_XPATH_DOC_ROUTINES

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			check_arguments, compute_special_properties, pre_evaluate, create_iterator, create_node_iterator
		end

	XM_UNICODE_CHARACTERS_1_1

	XM_XPATH_SHARED_ANY_NODE_TEST
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "document"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Document_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (0)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := any_node_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			if argument_number = 1 then
				create Result.make_any_sequence
			else
				create Result.make_single_node
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterator over the values of a sequence
		local
			l_href_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_base_uri: detachable UT_URI
			l_base_node: XM_XPATH_NODE
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
			l_map_object: XM_XSLT_DOCUMENT_INFORMATION
			l_mapping_iterator: XM_XPATH_NODE_MAPPING_ITERATOR
			l_comparer: XM_XPATH_GLOBAL_ORDER_COMPARER
		do
			last_iterator := Void
			arguments.item (1).create_iterator (a_context)
			check postcondition_of_create_iterator: attached arguments.item (1).last_iterator as l_last_iterator then
				l_href_iterator := l_last_iterator
				if not l_href_iterator.is_error then
					if supplied_argument_count = 2 then
						create l_item.make (Void)
						arguments.item (2).evaluate_item (l_item, a_context)
						check attached l_item.item as l_item_item then
							if attached l_item_item.error_value as l_error_value then
								check is_error: l_item_item.is_error end
								create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_error_value)
							else
								check
									item_is_node: l_item_item.is_node
									-- Static typing
								end
								l_base_node := l_item_item.as_node
								check attached l_base_node.base_uri as l_base_node_base_uri then
									create l_base_uri.make (l_base_node_base_uri)
								end
							end
						end
					end
					if last_iterator = Void then -- no error yet
						if transformer = Void then
							check
								xslt_context_not_void: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_xslt_context
								-- as this is an XSLT function
							then
								transformer := l_xslt_context.transformer
							end
						end
						check
							attached transformer as l_transformer
							attached stylesheet_base_uri as l_stylesheet_base_uri
						then
							create l_map_object.make (l_base_uri, l_stylesheet_base_uri, l_transformer)
							create l_mapping_iterator.make (l_href_iterator, l_map_object, a_context)
							create l_comparer
							create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} last_iterator.make (l_mapping_iterator, l_comparer) -- to eliminate duplicates if two hrefs are the same
						end
					end
				else
					last_iterator := l_href_iterator
				end
			end
		end

	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence.
		local
			l_href_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_base_uri: detachable UT_URI
			l_base_node: XM_XPATH_NODE
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
			l_map_object: XM_XSLT_DOCUMENT_INFORMATION
			l_mapping_iterator: XM_XPATH_NODE_MAPPING_ITERATOR
			l_comparer: XM_XPATH_GLOBAL_ORDER_COMPARER
		do
			last_node_iterator := Void
			arguments.item (1).create_iterator (a_context)
			check postcondition_of_create_iterator: attached arguments.item (1).last_iterator as l_last_iterator then
				l_href_iterator := l_last_iterator
				if not attached l_href_iterator.error_value as l_error_value then
					if supplied_argument_count = 2 then
						create l_item.make (Void)
						arguments.item (2).evaluate_item (l_item, a_context)
						check attached l_item.item as l_item_item then
							if attached l_item_item.error_value as l_error_value then
								check is_error: l_item_item.is_error end
								create {XM_XPATH_INVALID_NODE_ITERATOR} last_iterator.make (l_error_value)
							else
								check
									item_is_node: l_item_item.is_node
									-- Static typing
								end
								l_base_node := l_item_item.as_node
								check attached l_base_node.base_uri as l_base_node_base_uri then
									create l_base_uri.make (l_base_node_base_uri)
								end
							end
						end
					end
					if last_node_iterator = Void then -- no error yet
						if transformer = Void then
							check
								xslt_context_not_void: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_xslt_context
								-- as this is an XSLT function
							then
								transformer := l_xslt_context.transformer
							end
						end
						check
							attached transformer as l_transformer
							attached stylesheet_base_uri as l_stylesheet_base_uri
						then
							create l_map_object.make (l_base_uri, l_stylesheet_base_uri, l_transformer)
							create l_mapping_iterator.make (l_href_iterator, l_map_object, a_context)
							create l_comparer
							create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} last_node_iterator.make (l_mapping_iterator, l_comparer) -- to eliminate duplicates if two hrefs are the same
						end
					end
				else
					check is_error: l_href_iterator.is_error end
					create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_error_value)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end

	compute_special_properties
			-- Compute special properties.
		do
			initialize_special_properties
			set_ordered_nodeset

			-- Declaring it as a peer node-set expression avoids sorting of expressions such as document(XXX)/a/b/c

			set_peer_nodeset

			-- Multiple calls with same argument yield same nodes, so not creative

			set_non_creating
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			Precursor (a_replacement, a_context)
			if a_replacement.item = Void then
				-- the not-void test is to avoid the correct value being overridden
				-- when compiling a template - see W3C test case mdocs21
				if stylesheet_base_uri = Void then
					stylesheet_base_uri := a_context.base_uri
				end
				create l_replacement.make (Void)
				arguments.item (1).set_unsorted (l_replacement, False)
				check postcondition_of_set_unsorted: attached l_replacement.item as l_replacement_item then
					if arguments.item (1) /= l_replacement_item then
						arguments.replace (l_replacement_item, 1)
					end
				end
			end
		end

feature {NONE} -- Implementation

	stylesheet_base_uri: detachable UT_URI
			-- Base URI from static context

	transformer: detachable XM_XSLT_TRANSFORMER
			-- Transformer, for error reovery

end


