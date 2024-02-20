note

	description:

		"Objects that implement the XSLT function-available() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_FUNCTION_AVAILABLE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, evaluate_item, check_arguments
		end

create

	make

feature {NONE} -- Initialization

	make
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

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.boolean_type
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
				create Result.make_single_integer
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_arity, l_fingerprint: INTEGER
			l_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
			l_uri: detachable STRING
			l_xml_prefix: STRING
			l_parser: XM_XPATH_QNAME_PARSER
			l_boolean: BOOLEAN
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			l_arity := -1
			if arguments.count = 2 then
				arguments.item (2).evaluate_item (a_result, a_context)
				check attached a_result.item as l_result_item then
					if attached l_result_item.error_value as l_error_value then
						check is_error: l_result_item.is_error end
						set_last_error (l_error_value)
					else
						check
							integer: l_result_item.is_machine_integer_value
							-- static typing
						end
						l_integer_value := l_result_item.as_machine_integer_value
						l_arity := l_integer_value.value.to_integer
					end
				end
			end
			if not is_error then
				a_result.put (Void)
				arguments.item (1).evaluate_item (a_result, a_context)
				check attached a_result.item as l_result_item then
					if l_result_item.is_error then
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("First argument to 'function-available' is not a lexical QName",
							Xpath_errors_uri, "XTDE1400", Dynamic_error))
					else
						if not l_result_item.is_atomic_value then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("First argument to 'function-available' is not a lexical QName",
								Xpath_errors_uri, "XTDE1400", Dynamic_error))
						else
							create l_parser.make (l_result_item.as_atomic_value.string_value)
							if not l_parser.is_valid then
								a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("First argument to 'function-available' is not a lexical QName",
									Xpath_errors_uri, "XTDE1400", Dynamic_error))
							else
								check
									l_parser_is_valid: attached l_parser.optional_prefix as l_optional_prefix
									l_parser_is_valid_2: attached l_parser.local_name as l_local_name
								then
									if not l_parser.is_prefix_present then
										l_uri := Xpath_standard_functions_uri
										l_xml_prefix := ""
									else
										check
											namespace_context_saved: namespaces_needed and attached namespace_context as l_namespace_context
											-- from `check_arguments'.
										then
											l_xml_prefix := l_optional_prefix
											l_uri := l_namespace_context.uri_for_defaulted_prefix (l_xml_prefix, False)
										end
									end
									if l_uri = Void then
										a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("QName prefix in first argument to 'function-available' has not been declared.",
											Xpath_errors_uri, "XTDE1400", Dynamic_error))
									else
										if not shared_name_pool.is_name_code_allocated (l_xml_prefix, l_uri, l_local_name) then
											shared_name_pool.allocate_name (l_xml_prefix, l_uri, l_local_name)
										end
										l_fingerprint := shared_name_pool.fingerprint (l_uri, l_local_name)
										l_boolean := a_context.available_functions.is_function_available (l_fingerprint, l_arity, a_context.is_restricted)
										create l_boolean_value.make (l_boolean)
										a_result.put (l_boolean_value)
									end
								end
							end
						end
					end
				end
			end
		end


	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		local
			l_arity, l_fingerprint: INTEGER
			l_uri: detachable STRING
			l_parser: XM_XPATH_QNAME_PARSER
			l_boolean: BOOLEAN
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
		do
			l_arity := -1
			if arguments.count = 2 then
				create l_item.make (Void)
				arguments.item (2).evaluate_item (l_item, a_context.new_compile_time_context)
				check attached l_item.item as l_item_item then
					if attached l_item_item.error_value as l_error_value then
						check is_error: l_item_item.is_error end
						set_last_error (l_error_value)
					else
						check
							integer: l_item_item.is_machine_integer_value
							-- static typing
						end
						l_arity := l_item_item.as_machine_integer_value.value.to_integer
					end
				end
			end
			if not is_error then
				check
					fixed_string: arguments.item (1).is_string_value
					-- static typing and `pre_evaluate' is only called for fixed values
				end
				create l_parser.make (arguments.item (1).as_string_value.string_value)
				if not l_parser.is_valid then
					set_last_error_from_string ("First argument to 'function-available' is not a lexical QName",
														 Xpath_errors_uri, "XTDE1400", Static_error)
				else
					check
						parser_valid: attached l_parser.optional_prefix as l_optional_prefix
						parser_valid2: attached l_parser.local_name as l_local_name
					then
						if not l_parser.is_prefix_present then
							l_uri := Xpath_standard_functions_uri
						elseif a_context.is_prefix_declared (l_optional_prefix) then
							l_uri := a_context.uri_for_prefix (l_optional_prefix)
						else
							set_last_error_from_string ("Prefix in first argument to 'function-available' is not bound to an in-scope namespace",
																 Xpath_errors_uri, "XTDE1400", Static_error)
						end
						if not is_error then
							check l_uri /= Void then
								if not shared_name_pool.is_name_code_allocated (l_optional_prefix, l_uri, l_local_name) then
									shared_name_pool.allocate_name (l_optional_prefix, l_uri, l_local_name)
								end
								l_fingerprint := shared_name_pool.fingerprint (l_uri, l_local_name)
								l_boolean := a_context.available_functions.is_function_available (l_fingerprint, l_arity, a_context.is_restricted)
								create l_boolean_value.make (l_boolean)
								set_replacement (a_replacement, l_boolean_value)
							end
						end
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Check arguments during parsing, when all the argument expressions have been read.
		do
			if not checked then
				Precursor (a_replacement, a_context)
				if a_replacement.item = Void then
					if not arguments.item (1).is_value or else
						(arguments.count = 2 and then not arguments.item (2).is_value) then
						namespaces_needed := True
					end
					if namespaces_needed then
						check
							expression_context: attached {XM_XSLT_EXPRESSION_CONTEXT} a_context as l_expression_context
						then
							namespace_context := l_expression_context.namespace_context
						end
					end
				end
				checked := True
			end
		ensure then
			arguments_cheked: checked
			namespace_context_saved: namespaces_needed implies namespace_context /= Void
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	namespaces_needed: BOOLEAN
			-- Is namespace context needed at run-time?

	namespace_context: detachable XM_XSLT_NAMESPACE_CONTEXT
			-- Saved namespace context

	checked: BOOLEAN
			-- Has `check_arguments' been called already?

invariant

	namespaces_needed: namespaces_needed implies namespace_context /= Void

end

