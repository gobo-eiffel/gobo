indexing

	description:

		"Objects that implement the XPath idref() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_IDREF

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, pre_evaluate, check_arguments,
			compute_special_properties, create_iterator, create_node_iterator
		end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "idref"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Idref_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			initialized := True
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
			inspect
				argument_number
			when 1 then
					create Result.make_string_sequence
			when 2 then
				create Result.make_single_node
			end	
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		do
			Precursor
			add_context_document_argument (1, "idref+")
			merge_dependencies (arguments.item (2))
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create iterator over values of a sequence.
		local
			l_idrefs: DS_ARRAYED_LIST [STRING]
			l_node: XM_XPATH_NODE
			l_splitter: ST_SPLITTER
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_result: DS_CELL [XM_XPATH_ITEM]
		do
			last_iterator := Void
			create l_result.make (Void)
			arguments.item (2).evaluate_item (l_result, a_context)
			if l_result.item.is_error then
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_result.item.error_value)
			else
				check
					node: l_result.item.is_node
					-- `required_type' will have ensured this
				end
				l_node := l_result.item.as_node.root
				if l_node.is_document then
					arguments.item (1).create_iterator (a_context)
					if arguments.item (1).last_iterator.is_error then
						last_iterator := arguments.item (1).last_iterator
					else
						create l_idrefs.make_default
						l_idrefs.set_equality_tester (string_equality_tester)
						l_iterator := arguments.item (1).last_iterator
						from l_iterator.start until l_iterator.is_error or else l_iterator.after loop
							create l_splitter.make
							l_idrefs.append_last (l_splitter.split (l_iterator.item.string_value))
							l_iterator.forth
						end
						if l_iterator.is_error then
							last_iterator := l_iterator
						else
							last_iterator := l_node.as_document.idrefs_nodes (l_idrefs)
						end
					end
				else
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("In the idref() function," +
						" the tree being searched must be one whose root is a document node", Xpath_errors_uri, "FODC0001", Dynamic_error)
				end
			end
		end	

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create iterator over nodes of a sequence.
		local
			l_idrefs: DS_ARRAYED_LIST [STRING]
			l_node: XM_XPATH_NODE
			l_splitter: ST_SPLITTER
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_result: DS_CELL [XM_XPATH_ITEM]
		do
			last_node_iterator := Void
			create l_result.make (Void)
			arguments.item (2).evaluate_item (l_result, a_context)
			if l_result.item.is_error then
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_result.item.error_value)
			else
				check
					node: l_result.item.is_node
					-- `required_type' will have ensured this
				end
				l_node := l_result.item.as_node.root
				if l_node.is_document then
					arguments.item (1).create_iterator (a_context)
					if arguments.item (1).last_iterator.is_error then
						create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (arguments.item (1).last_iterator.error_value)
					else
						create l_idrefs.make_default
						l_idrefs.set_equality_tester (string_equality_tester)
						l_iterator := arguments.item (1).last_iterator
						from l_iterator.start until l_iterator.is_error or else l_iterator.after loop
							create l_splitter.make
							l_idrefs.append_last (l_splitter.split (l_iterator.item.string_value))
							l_iterator.forth
						end
						if l_iterator.is_error then
							create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_iterator.error_value)
						else
							last_node_iterator := l_node.as_document.idrefs_nodes (l_idrefs)
						end
					end
				else
					create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make_from_string ("In the idref() function," +
						" the tree being searched must be one whose root is a document node", Xpath_errors_uri, "FODC0001", Dynamic_error)
				end
			end
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			-- Suppress compile-time evaluation
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		local

		do
			Precursor (a_context)
			arguments.item (1).set_unsorted (False)
			if arguments.item (1).was_expression_replaced then
				arguments.replace (arguments.item (1).replacement_expression, 1)
			end
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
			set_single_document_nodeset
			set_ordered_nodeset
			set_non_creating
			if supplied_argument_count = 1 or else arguments.item (1).context_document_nodeset then
				set_context_document_nodeset
			end
		end

end
	
