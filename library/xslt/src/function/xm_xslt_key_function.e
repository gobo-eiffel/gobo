note

	description:

		"Objects that implement the XSLT key() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
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

	make
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

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		do
			Precursor (a_replacement)
			check postcondition_of_precursor: attached a_replacement.item as l_replacement_item then
				if l_replacement_item /= Current then
						-- TODO: as_key_function
					if attached {XM_XSLT_KEY_FUNCTION} l_replacement_item as l_function then
						l_function.add_context_document_argument (2, "key+")
					end
				else
					add_context_document_argument (2, "key+")
					if arguments.item (3).context_document_nodeset then
						set_context_document_nodeset
					end
					merge_dependencies (arguments.item (3))
				end
			end
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			Precursor (a_replacement, a_context, a_context_item_type)
			check postcondition_of_precursor: attached a_replacement.item as l_replacement_item then
				if attached l_replacement_item.error_value as l_error_value and then
					STRING_.same_string (l_error_value.code, new_unicode_string ("XPDY0002")) and then
					STRING_.same_string (l_error_value.namespace_uri, new_unicode_string (Xpath_errors_uri)) then
					check is_error: l_replacement_item.is_error  end
					l_error_value.set_code ("XTDE1270")
				end
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterator over the values of a sequence
		local
			l_transformer: detachable XM_XSLT_TRANSFORMER
			l_context_document: detachable XM_XPATH_DOCUMENT
			l_node: detachable XM_XPATH_NODE
			l_fingerprint: INTEGER
			l_given_key_name, a_message: STRING
			l_expression: XM_XPATH_EXPRESSION
			l_key_context_information: XM_XSLT_KEY_CONTEXT_INFORMATION
			l_key_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_values_iterator: XM_XPATH_NODE_MAPPING_ITERATOR
			l_local_order_comparer: XM_XPATH_LOCAL_ORDER_COMPARER
			l_error: XM_XPATH_ERROR_VALUE
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
		do
			check
				evaluation_context_not_void: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_evaluation_context
				-- as this is an XSLT function
			then
				l_transformer := l_evaluation_context.transformer
				check l_transformer /= Void then
					create l_item.make (Void)
					arguments.item (3).evaluate_item (l_item, l_evaluation_context)
					check attached l_item.item as l_item_item then
						if l_item_item.is_node then
							l_node := l_item_item.as_node
							l_context_document := l_node.document_root
						end
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
							check attached l_item.item as l_item_item then
								l_given_key_name := l_item_item.string_value
								check attached namespace_context as l_namespace_context then
									l_fingerprint := l_namespace_context.fingerprint (l_given_key_name, False)
									if l_fingerprint = -1 then
										a_message := STRING_.concat ("Key '", l_given_key_name)
										a_message := STRING_.appended_string (a_message, "' has not been defined")
										create l_error.make_from_string (a_message, Xpath_errors_uri, "XTDE1260", Dynamic_error)
										l_error.set_location (system_id, line_number)
										l_transformer.report_fatal_error (l_error)
									end
								end
							end
						end
						if not l_transformer.is_error then

							-- If the second argument is a singleton, we evaluate the function  directly;
							-- otherwise we recurse to evaluate it once for each item in the sequence.

							l_expression := arguments.item (2)
							if not l_expression.cardinality_allows_many then
								create l_item.make (Void)
								l_expression.evaluate_item (l_item, l_evaluation_context)
								check attached l_item.item as l_item_item then
									if attached {XM_XPATH_ATOMIC_VALUE} l_item_item as l_atomic_value then
										l_transformer.key_manager.generate_keyed_sequence (l_fingerprint, l_context_document, l_atomic_value, l_evaluation_context)
										if l_transformer.is_error then
											create {XM_XPATH_INVALID_NODE_ITERATOR} last_iterator.make_from_string ("Non-recoverable error already reported",  Xpath_errors_uri, "FOER0000", Dynamic_error)
										else
											last_iterator := l_transformer.key_manager.last_key_sequence
										end
									else
										create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
									end
								end
							else
								create l_key_context_information.make (l_context_document, l_evaluation_context, l_fingerprint)
								l_expression.create_iterator (a_context)
								check postcondition_of_create_iterator: attached l_expression.last_iterator as l_last_iterator then
									if l_last_iterator.is_error then
										last_iterator := l_last_iterator
									else
										l_key_iterator := l_last_iterator
										create l_values_iterator.make (l_key_iterator, l_key_context_information, Void)
										create l_local_order_comparer
										create {XM_XPATH_DOCUMENT_ORDER_ITERATOR} last_iterator.make (l_values_iterator, l_local_order_comparer)
									end
								end
							end
							check l_node /= Void then
								if not l_node.is_same_node (l_context_document) then
									check attached last_iterator as l_last_iterator then
										create {XM_XPATH_SINGLETON_NODE_MAPPING_ITERATOR} last_iterator.make (l_last_iterator.as_node_iterator, create {XM_XSLT_SUBTREE_FILTER}.make (l_node))
									end
								end
							end
						else
							create {XM_XPATH_INVALID_NODE_ITERATOR} last_iterator.make_from_string ("Non-recoverable error already reported",  Xpath_errors_uri, "FOER0000", Dynamic_error)
						end
					end
				end
			end
		ensure then
			node_iterator: attached last_iterator as l_last_iterator and then l_last_iterator.is_node_iterator
		end

	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
			-- Suppress compile-time evaluation
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence
		do
			create_iterator (a_context)
			check postcondition_of_create_iterator: attached last_iterator as l_last_iterator then
				last_node_iterator := l_last_iterator.as_node_iterator
			end
		end

feature {XM_XPATH_FUNCTION_CALL} -- Restricted

	check_arguments (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			if not arguments_checked then
				arguments_checked := True
				Precursor (a_replacement, a_context)
				if a_replacement.item = Void then
					create l_replacement.make (Void)
					arguments.item (2).set_unsorted (l_replacement, False)
					check postcondition_of_set_unsorted: attached l_replacement.item as l_replacement_item then
						if arguments.item (2) /= l_replacement_item then
							arguments.replace (l_replacement_item, 1)
						end
						check
							static_context_is_xslt_context: attached {XM_XSLT_EXPRESSION_CONTEXT} a_context as l_xslt_context
						then
							if attached {XM_XPATH_STRING_VALUE} arguments.item (1) as l_string_value then

								-- Common case, key name is supplied as a constant

								key_fingerprint := l_xslt_context.fingerprint (l_string_value.string_value, False)
								if key_fingerprint = -1 then
									a_replacement.put (Void)
									set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make_from_string (
										STRING_.concat (l_string_value.string_value, " is not a defined key"),
										Xpath_errors_uri, "XTDE1260", Static_error))
								end
							else
								namespace_context := l_xslt_context.namespace_context
							end
						end
					end
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
			set_single_document_nodeset
			set_non_creating
		end

feature {NONE} -- Implementation

	key_fingerprint: INTEGER
			-- Fingerprint of key-name

	namespace_context: detachable XM_XPATH_NAMESPACE_RESOLVER
			-- Namespace context

	arguments_checked: BOOLEAN
			-- Have arguments been cheked yet?

end

