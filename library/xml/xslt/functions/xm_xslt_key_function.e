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
			simplify, compute_special_properties, create_iterator, pre_evaluate, check_arguments
		end

	XM_XPATH_SHARED_ANY_NODE_TEST
		export {NONE} all end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			key_fingerprint := -1
			name := "key"; namespace_uri := Xpath_standard_functions_uri
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
				create Result.make (document_node_kind_test, Required_cardinality_exactly_one)
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

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
			-- N.B. This function is not 100% pure, as it may cause
			--  an index to be built for a key, but this is only a 
			--  performance-affecting side effect.
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
			an_error: XM_XPATH_ERROR_VALUE
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
				create an_error.make_from_string ("In the key() function, the context node must be in a tree whose root is a document node", "", "XTDE1270", Dynamic_error)
				a_transformer.report_fatal_error (an_error, Void)
			else
				a_fingerprint := key_fingerprint
				if a_fingerprint = -1 then
					arguments.item (1).evaluate_item (an_evaluation_context)
					a_given_key_name := arguments.item (1).last_evaluated_item.string_value
					a_fingerprint := namespace_context.fingerprint (a_given_key_name, False)
					if a_fingerprint = -1 then
						a_message := STRING_.concat ("Key '", a_given_key_name)
						a_message := STRING_.appended_string (a_message, "' has not been defined")
						create an_error.make_from_string (a_message, "", "XTDE1260", Dynamic_error)
						a_transformer.report_fatal_error (an_error, Void)
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
							a_transformer.key_manager.generate_keyed_sequence (a_fingerprint, a_context_document, an_atomic_value, an_evaluation_context)
							if a_transformer.is_error then
								create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("Non-recoverable error already reported",  Xpath_errors_uri, "FOER0000", Dynamic_error)
							else
								last_iterator := a_transformer.key_manager.last_key_sequence
							end
						else
							create {XM_XPATH_EMPTY_ITERATOR} last_iterator.make
						end
					else
						create a_key_context_information.make (a_context_document, an_evaluation_context, a_fingerprint)
						an_expression.create_iterator (a_context)
						if an_expression.last_iterator.is_error then
							last_iterator := an_expression.last_iterator
						else
							a_key_iterator := an_expression.last_iterator
							create all_values_iterator.make (a_key_iterator, a_key_context_information, Void)
							create a_local_order_comparer
							create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} last_iterator.make (all_values_iterator, a_local_order_comparer)
						end
					end
				else
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("Non-recoverable error already reported",  Xpath_errors_uri, "FOER0000", Dynamic_error)
				end
			end
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
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
						todo ("check_arguments - issue a dynamic error", True)
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
	
