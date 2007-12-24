indexing

	description:

		"Objects that implement the XSLT key() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_KEY_FUNCTION

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, compute_special_properties, create_iterator, pre_evaluate, check_arguments,
			check_static_type, create_node_iterator
		end

	XM_XPATH_SHARED_ANY_NODE_TEST
		export {NONE} all end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

	UC_UNICODE_FACTORY
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			key_fingerprint := -1
			name := "key"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Key_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 3
			create arguments.make (3)
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
				create Result.make_single_string
			when 2 then
				create Result.make_atomic_sequence
			when 3 then
				create Result.make_single_node
			end
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		local
			a_function:XM_XSLT_KEY_FUNCTION
		do
			Precursor
			if was_expression_replaced then
				a_function ?= replacement_expression -- TODO: as_key_function
				if a_function /= Void then
					a_function.add_context_document_argument (2, "key+")
				end
			else
				add_context_document_argument (2, "key+")
			end
			if arguments.item (3).context_document_nodeset then
				set_context_document_nodeset
			end
			merge_dependencies (arguments.item (3).dependencies)
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			Precursor (a_context, a_context_item_type)
			if is_error and then STRING_.same_string (error_value.code, new_unicode_string ("XPDY0002")) and then STRING_.same_string (error_value.namespace_uri, new_unicode_string (Xpath_errors_uri)) then
				error_value.set_code ("XTDE1270")
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		local
			l_transformer: XM_XSLT_TRANSFORMER
			l_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			l_context_document: XM_XPATH_DOCUMENT
			l_node: XM_XPATH_NODE
			l_fingerprint: INTEGER
			l_given_key_name, a_message: STRING
			l_expression: XM_XPATH_EXPRESSION
			l_atomic_value: XM_XPATH_ATOMIC_VALUE
			l_key_context_information: XM_XSLT_KEY_CONTEXT_INFORMATION
			l_key_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_values_iterator: XM_XPATH_NODE_MAPPING_ITERATOR
			l_local_order_comparer: XM_XPATH_LOCAL_ORDER_COMPARER
			l_error: XM_XPATH_ERROR_VALUE
			l_item: DS_CELL [XM_XPATH_ITEM]
		do
			l_evaluation_context ?= a_context
			check
				evaluation_context_not_void: l_evaluation_context /= Void
				-- as this is an XSLT function
			end
			l_transformer := l_evaluation_context.transformer
			create l_item.make (Void)
			arguments.item (3).evaluate_item (l_item, l_evaluation_context)
			if l_item.item.is_node then
				l_node := l_item.item.as_node
				l_context_document := l_node.document_root
			end
			if l_context_document = Void then
				create l_error.make_from_string ("In the key() function, the context node must be in a tree whose root is a document node",
															 Xpath_errors_uri, "XTDE1270", Dynamic_error)
				l_error.set_location (system_id, line_number)
				l_transformer.report_fatal_error (l_error)
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_iterator.make (l_error)
			else
				l_fingerprint := key_fingerprint
				if l_fingerprint = -1 then
					create l_item.make (Void)
					arguments.item (1).evaluate_item (l_item, l_evaluation_context)
					l_given_key_name := l_item.item.string_value
					l_fingerprint := namespace_context.fingerprint (l_given_key_name, False)
					if l_fingerprint = -1 then
						a_message := STRING_.concat ("Key '", l_given_key_name)
						a_message := STRING_.appended_string (a_message, "' has not been defined")
						create l_error.make_from_string (a_message, Xpath_errors_uri, "XTDE1260", Dynamic_error)
						l_error.set_location (system_id, line_number)
						l_transformer.report_fatal_error (l_error)
					end
				end
				if not l_transformer.is_error then

					-- If the second argument is a singleton, we evaluate the function  directly;
					-- otherwise we recurse to evaluate it once for each item in the sequence.

					l_expression := arguments.item (2)
					if not l_expression.cardinality_allows_many then
						create l_item.make (Void)
						l_expression.evaluate_item (l_item, l_evaluation_context)
						l_atomic_value ?= l_item.item
						if l_atomic_value /= Void then
							l_transformer.key_manager.generate_keyed_sequence (l_fingerprint, l_context_document, l_atomic_value, l_evaluation_context)
							if l_transformer.is_error then
								create {XM_XPATH_INVALID_NODE_ITERATOR} last_iterator.make_from_string ("Non-recoverable error already reported",  Xpath_errors_uri, "FOER0000", Dynamic_error)
							else
								last_iterator := l_transformer.key_manager.last_key_sequence
							end
						else
							create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
						end
					else
						create l_key_context_information.make (l_context_document, l_evaluation_context, l_fingerprint)
						l_expression.create_iterator (a_context)
						if l_expression.last_iterator.is_error then
							last_iterator := l_expression.last_iterator
						else
							l_key_iterator := l_expression.last_iterator
							create l_values_iterator.make (l_key_iterator, l_key_context_information, Void)
							create l_local_order_comparer
							create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} last_iterator.make (l_values_iterator, l_local_order_comparer)
						end
					end
					if not l_node.is_same_node (l_context_document) then
						create {XM_XPATH_SINGLETON_NODE_MAPPING_ITERATOR} last_iterator.make (last_iterator.as_node_iterator, create {XM_XSLT_SUBTREE_FILTER}.make (l_node))
					end
				else
					create {XM_XPATH_INVALID_NODE_ITERATOR} last_iterator.make_from_string ("Non-recoverable error already reported",  Xpath_errors_uri, "FOER0000", Dynamic_error)
				end
			end
		ensure then
			node_iterator: last_iterator.is_node_iterator
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			-- Suppress compile-time evaluation
		end
	
	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			create_iterator (a_context)
			last_node_iterator := last_iterator.as_node_iterator
		end

feature {XM_XPATH_FUNCTION_CALL} -- Restricted

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			a_string_value: XM_XPATH_STRING_VALUE
			an_xslt_context: XM_XSLT_EXPRESSION_CONTEXT
		do
			if not arguments_checked then
				arguments_checked := True
				Precursor (a_context)
				arguments.item (2).set_unsorted (False)
				if arguments.item (2).was_expression_replaced then
					arguments.replace (arguments.item (2).replacement_expression, 1)
				end
				a_string_value ?= arguments.item (1)
				an_xslt_context ?= a_context
				check
					static_context_is_xslt_context: an_xslt_context /= Void
				end
				if a_string_value /= Void then
					
					-- Common case, key name is supplied as a constant
					
					key_fingerprint := an_xslt_context.fingerprint (a_string_value.string_value, False)
					if key_fingerprint = -1 then
						set_last_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (STRING_.concat (a_string_value.string_value, " is not a defined key"),
							Xpath_errors_uri, "XTDE1260", Static_error))
					end
				else
					namespace_context := an_xslt_context.namespace_context
				end
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
			set_ordered_nodeset
			set_single_document_nodeset
			set_non_creating
		end

feature {NONE} -- Implementation

	key_fingerprint: INTEGER
			-- Fingerprint of key-name

	namespace_context: XM_XPATH_NAMESPACE_RESOLVER
			-- Namespace context

	arguments_checked: BOOLEAN
			-- Have arguments been cheked yet?

end
	
