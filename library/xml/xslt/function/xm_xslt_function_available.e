indexing

	description:

		"Objects that implement the XSLT function-available() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FUNCTION_AVAILABLE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, evaluate_item, check_arguments
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "function-available"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Function_available_function_type_code
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
			Result := type_factory.boolean_type
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
				create Result.make_single_integer
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			an_arity, a_fingerprint: INTEGER
			an_integer_value: XM_XPATH_INTEGER_VALUE
			a_uri, an_xml_prefix: STRING
			a_parser: XM_XPATH_QNAME_PARSER
			a_boolean: BOOLEAN
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			an_arity := -1
			if arguments.count = 2 then
				arguments.item (2).evaluate_item (a_context)
				if arguments.item (2).last_evaluated_item.is_error then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (arguments.item (2).last_evaluated_item.error_value)
				else
					check
						integer: arguments.item (2).last_evaluated_item.is_integer_value
						-- static typing
					end
					an_integer_value := arguments.item (2).last_evaluated_item.as_integer_value
					an_arity := an_integer_value.value.to_integer
				end
			end
			if not is_error then
				arguments.item (1).evaluate_item (a_context)
				if arguments.item (1).last_evaluated_item.is_error then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("First argument to 'function-available' is not a lexical QName",
																												Xpath_errors_uri, "XTDE1400", Dynamic_error)
				else
					if not arguments.item (1).last_evaluated_item.is_atomic_value then
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("First argument to 'function-available' is not a lexical QName",
																													Xpath_errors_uri, "XTDE1400", Dynamic_error)
					else
						create a_parser.make (arguments.item (1).last_evaluated_item.as_atomic_value.string_value)
						if not a_parser.is_valid then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("First argument to 'function-available' is not a lexical QName",
																														Xpath_errors_uri, "XTDE1400", Dynamic_error)
						else
							if not a_parser.is_prefix_present then
								a_uri := Xpath_standard_functions_uri
								an_xml_prefix := ""
							else
								check
									namespace_context_saved: namespaces_needed and namespace_context /= Void
									-- from `check_arguments'.
								end
								an_xml_prefix := a_parser.optional_prefix
								a_uri := namespace_context.uri_for_defaulted_prefix (an_xml_prefix, False)
							end
							if a_uri = Void then
								create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("QName prefix in first argument to 'function-available' has not been declared.",
																															Xpath_errors_uri, "XTDE1400", Dynamic_error)
							else
								if not shared_name_pool.is_name_code_allocated (an_xml_prefix, a_uri, a_parser.local_name) then
									shared_name_pool.allocate_name (an_xml_prefix, a_uri, a_parser.local_name)
								end
								a_fingerprint := shared_name_pool.fingerprint (a_uri, a_parser.local_name)
								a_boolean := a_context.available_functions.is_function_available (a_fingerprint, an_arity, a_context.is_restricted)
								create a_boolean_value.make (a_boolean)
								last_evaluated_item := a_boolean_value
							end
						end
					end
				end
			end
		end


	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		local
			an_arity, a_fingerprint: INTEGER
			a_uri: STRING
			a_parser: XM_XPATH_QNAME_PARSER
			a_boolean: BOOLEAN
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			an_arity := -1
			if arguments.count = 2 then
				arguments.item (2).evaluate_item (Void)
				if arguments.item (2).last_evaluated_item.is_error then
					set_last_error (arguments.item (2).last_evaluated_item.error_value)
				else
					check
						integer: arguments.item (2).last_evaluated_item.is_integer_value
						-- static typing
					end
					an_arity := arguments.item (2).last_evaluated_item.as_integer_value.value.to_integer
				end
			end
			if not is_error then
				check
					fixed_string: arguments.item (1).is_string_value
					-- static typing and `pre_evaluate' is only called for fixed values
				end
				create a_parser.make (arguments.item (1).as_string_value.string_value)
				if not a_parser.is_valid then
					set_last_error_from_string ("First argument to 'function-available' is not a lexical QName",
														 Xpath_errors_uri, "XTDE1400", Static_error)
				else
					if not a_parser.is_prefix_present then
						a_uri := Xpath_standard_functions_uri
					elseif a_context.is_prefix_declared (a_parser.optional_prefix) then
						a_uri := a_context.uri_for_prefix (a_parser.optional_prefix)
					else
						set_last_error_from_string ("Prefix in first argument to 'function-available' is not bound to an in-scope namespace",
															 Xpath_errors_uri, "XTDE1400", Static_error)
					end
					if not is_error then
						if not shared_name_pool.is_name_code_allocated (a_parser.optional_prefix, a_uri, a_parser.local_name) then
							shared_name_pool.allocate_name (a_parser.optional_prefix, a_uri, a_parser.local_name)
						end
						a_fingerprint := shared_name_pool.fingerprint (a_uri, a_parser.local_name)
						a_boolean := a_context.available_functions.is_function_available (a_fingerprint, an_arity, a_context.is_restricted)
						create a_boolean_value.make (a_boolean)
						set_replacement (a_boolean_value)
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			-- pre-condition is never met
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			an_expression_context: XM_XSLT_EXPRESSION_CONTEXT
		do
			if not checked then
				Precursor (a_context)
				if not arguments.item (1).is_value or else
					(arguments.count = 2 and then not arguments.item (2).is_value) then
					namespaces_needed := True
				end
				if namespaces_needed then
					an_expression_context ?= a_context
					check
						expression_context: an_expression_context /= Void
						-- as this is XSLT
					end
					namespace_context := an_expression_context.namespace_context
				end
				checked := True
			end
		ensure then
			arguments_cheked: checked
			namespace_context_saved: namespaces_needed implies namespace_context /= Void
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	namespaces_needed: BOOLEAN
			-- Is namespace context needed at run-time?

	namespace_context: XM_XSLT_NAMESPACE_CONTEXT
			-- Saved namespace context

	checked: BOOLEAN
			-- Has `check_arguments' been called already?

invariant

	namespaces_needed: namespaces_needed implies namespace_context /= Void

end
	
