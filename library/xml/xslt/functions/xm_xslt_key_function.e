indexing

	description:

		"Objects that implement the XSLT key() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_KEY_FUNCTION

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplified_expression, compute_special_properties, iterator, pre_evaluate, check_arguments
		end

	XM_XPATH_NODE_MAPPING_FUNCTION

	XM_XPATH_SHARED_ANY_NODE_TEST

	XM_XPATH_SHARED_NODE_KIND_TESTS

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			key_fingerprint := -1
			name := "key"
			minimum_argument_count := 2
			maximum_argument_count := 2
			create arguments.make (3)
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
			inspect
				argument_number
			when 1 then
				create Result.make_single_string
			when 2 then
				create Result.make_atomic_sequence
			when 3 then
				create Result.make (document_node_kind_test, Required_cardinality_exactly_one)
			end
		end

feature -- Optimization

	simplified_expression: XM_XPATH_EXPRESSION is
			-- Simplified expression as a result of context-independent static optimizations
		local
			result_expression: XM_XSLT_KEY_FUNCTION
			a_simplifier: XM_XPATH_ARGUMENT_SIMPLIFIER
		do
			result_expression ?= Precursor
			result_expression.add_context_document_argument (2, "key+")
			Result := result_expression
		end

feature -- Evaluation

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		local
			a_transformer: XM_XSLT_TRANSFORMER
			an_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			a_context_document: XM_XPATH_DOCUMENT
			a_fingerprint: INTEGER
			a_given_key_name, a_message: STRING
			an_expression: XM_XPATH_EXPRESSION
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			a_key_context_information: XM_XSLT_KEY_CONTEXT_INFORMATION
			a_key_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			all_values_iterator: XM_XPATH_NODE_MAPPING_ITERATOR
			a_local_order_comparer: XM_XPATH_LOCAL_ORDER_COMPARER
		do
			an_evaluation_context ?= a_context
			check
				evaluation_context_not_void: an_evaluation_context /= Void
				-- as this is an XSLT function
			end
			a_transformer := an_evaluation_context.transformer
			arguments.item (3).evaluate_item (an_evaluation_context)
			a_context_document ?= arguments.item (3).last_evaluated_item
			if a_context_document = Void then
				a_transformer.report_fatal_error ("In the key() function, the context node must be in a tree whose root is a document node", Void)
			else
				a_fingerprint := key_fingerprint
				if a_fingerprint = -1 then
					arguments.item (1).evaluate_item (an_evaluation_context)
					a_given_key_name := arguments.item (1).last_evaluated_item.string_value
					a_fingerprint := namespace_context.fingerprint (a_given_key_name, False, a_transformer.name_pool)
					if a_fingerprint = -1 then
						a_message := STRING_.concat ("Key '", a_given_key_name)
						a_message := STRING_.appended_string (a_message, "' has not been defined")
						a_transformer.report_fatal_error (a_message, Void)
					end
				end
				if not a_transformer.is_error then

					-- If the second argument is a singleton, we evaluate the function  directly;
					-- otherwise we recurse to evaluate it once for each item in the sequence.

					an_expression := arguments.item (2)
					if not an_expression.cardinality_allows_many then
						an_expression.evaluate_item (an_evaluation_context)
						an_atomic_value ?= an_expression.last_evaluated_item
						if an_atomic_value /= Void then
							Result := a_transformer.key_manager.sequence_by_key (a_fingerprint, a_context_document, an_atomic_value, a_transformer)
						else
							create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_ITEM]} Result.make
						end
					else
						create a_key_context_information.make (a_context_document, a_transformer, a_fingerprint)
						a_key_iterator := an_expression.iterator (a_context)
						create all_values_iterator.make (a_key_iterator, Current, Void, a_key_context_information)
						create a_local_order_comparer
						create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} Result.make (all_values_iterator, a_local_order_comparer)
					end
				else
					create {XM_XPATH_INVALID_ITERATOR} Result.make_from_string ("Non-recoverable error already reported", 0, Dynamic_error)
				end
			end
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			set_replacement (Current)
		end

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT; an_information_object: ANY): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- Map `an_item' to a sequence
		local
			a_key_context_information: XM_XSLT_KEY_CONTEXT_INFORMATION
			a_key_manager: XM_XSLT_KEY_MANAGER
			a_key_value: XM_XPATH_ATOMIC_VALUE
		do
			a_key_context_information ?= an_information_object
			check
				key_context_information: a_key_context_information /= Void
				-- See `iterator'.
			end
			a_key_manager := a_key_context_information.transformer.key_manager
			a_key_value ?= an_item
			check
				key_value_is_atomic: a_key_value /= Void
				-- By definition.
			end
			Result := a_key_manager.sequence_by_key (a_key_context_information.key_fingerprint,
																			a_key_context_information.document, a_key_value,
																			a_key_context_information.transformer)
		end

feature {XM_XPATH_FUNCTION_CALL} -- Restricted

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			a_string_value: XM_XPATH_STRING_VALUE
			an_xslt_context: XM_XSLT_EXPRESSION_CONTEXT
		do
			Precursor (a_context)
			arguments.item (2).set_unsorted (False)
			a_string_value ?= arguments.item (1)
			an_xslt_context ?= a_context
			check
				static_context_is_xslt_context: an_xslt_context /= Void
			end
			if a_string_value /= Void then

				-- Common case, key name is supplied as a constant

				key_fingerprint := an_xslt_context.fingerprint (a_string_value.string_value, False)
				if key_fingerprint = -1 then
					todo ("check_arguments - issue a dynamic error", True)
				end
			else
				namespace_context := an_xslt_context.namespace_context
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
			set_context_document_nodeset
			set_ordered_nodeset
		end

feature {NONE} -- Implementation

	key_fingerprint: INTEGER
			-- Fingerprint of key-name

	namespace_context: XM_XSLT_NAMESPACE_RESOLVER
			-- Namespace context

end
	
