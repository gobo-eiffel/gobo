﻿note

	description:

		"Objects that implement the XPath id() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_ID

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, pre_evaluate, check_arguments,
			compute_special_properties, create_iterator, create_node_iterator
		end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "id"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Id_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := element_node_kind_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			inspect
				argument_number
			when 1 then
					create Result.make_string_sequence
			when 2 then
				create Result.make_single_node
			end
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations
		do
			Precursor (a_replacement)
			if a_replacement.item = Current then
				add_context_document_argument (1, "id+")
				merge_dependencies (arguments.item (2))
			end
		end

feature -- Evaluation


	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- An iterator over the values of a sequence
		local
			l_node: XM_XPATH_NODE
			l_node2: detachable XM_XPATH_NODE
			l_idrefs: STRING
			l_is_singleton: BOOLEAN
			l_splitter: ST_SPLITTER
			l_idref_list: DS_LIST [STRING]
			l_item: detachable XM_XPATH_ITEM
			l_mapping_iterator: XM_XPATH_NODE_MAPPING_ITERATOR
			l_local_order_comparer: XM_XPATH_LOCAL_ORDER_COMPARER
			l_id_mapping_function: XM_XPATH_ID_MAPPING_FUNCTION
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
		do
			create l_result.make (Void)
			arguments.item (2).evaluate_item (l_result, a_context)
			check
				node: attached l_result.item as l_result_item and then l_result_item.is_node
				-- `required_type' will have ensured this
			then
				l_node := l_result_item.as_node.root
				if l_node.is_document then
					if is_singleton_id then
						l_is_singleton := True
						create l_result.make (Void)
						arguments.item (1).evaluate_item (l_result, a_context)
						l_item := l_result.item
						if l_item = Void then
							create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
						elseif attached l_item.error_value as l_error_value then
							check is_error: l_item.is_error end
							create {XM_XPATH_INVALID_NODE_ITERATOR} last_iterator.make (l_error_value)
						elseif l_item.is_atomic_value then
							l_idrefs := l_item.as_atomic_value.string_value
							create l_splitter.make
							l_idref_list := l_splitter.split (l_idrefs)
							if l_idref_list.count = 1 then
								l_node2 := l_node.as_document.selected_id (l_idref_list.item(1))
								if l_node2 = Void then
									create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
								else
									create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_iterator.make (l_node2)
								end
							else
								l_is_singleton := False
							end
						else
							create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
						end
					end
					if not l_is_singleton then
						create l_local_order_comparer
						arguments.item (1).create_iterator (a_context)
						check postcondition_of_create_iterator: attached arguments.item (1).last_iterator as l_last_iterator then
							if l_last_iterator.is_error then
								last_iterator := l_last_iterator
							else
								create l_id_mapping_function.make (l_node.as_document)
								create l_mapping_iterator.make (l_last_iterator, l_id_mapping_function, Void)
								create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} last_iterator.make (l_mapping_iterator, l_local_order_comparer)
							end
						end
					end
				else
					create {XM_XPATH_INVALID_NODE_ITERATOR} last_iterator.make_from_string ("In the id() function," +
														 " the tree being searched must be one whose root is a document node", Xpath_errors_uri, "FODC0001", Dynamic_error)
				end
			end
		ensure then
			node_iterator: attached last_iterator as l_last_iterator and then l_last_iterator.is_node_iterator
		end

	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence
		do
			create_iterator (a_context)
			check postcondition_of_create_iterator: attached last_iterator as l_last_iterator then
				last_node_iterator := l_last_iterator.as_node_iterator
			end
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			Precursor (a_replacement, a_context)
			if a_replacement.item = Void then
				create l_replacement.make (Void)
				arguments.item (1).set_unsorted (l_replacement, False)
				check postcondition_of_set_unsorted: attached l_replacement.item as l_replacement_item then
					if arguments.item (1) /= l_replacement_item then
						arguments.replace (l_replacement_item, 1)
					end
					is_singleton_id := not arguments.item (1).cardinality_allows_many
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
			set_single_document_nodeset
			set_ordered_nodeset
			set_non_creating
			if supplied_argument_count = 1 or else arguments.item (1).context_document_nodeset then
				set_context_document_nodeset
			end
		end

feature {NONE} -- Implementation

	is_singleton_id: BOOLEAN
			-- Is only one IDREFS value supplied?

end

