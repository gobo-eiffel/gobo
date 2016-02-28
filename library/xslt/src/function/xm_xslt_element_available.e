note

	description:

		"Objects that implement the XSLT element-available() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ELEMENT_AVAILABLE

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
			name := "element-available"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Element_available_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
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
			create Result.make_single_string
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate `Current' as a single item
		local
			l_uri: detachable STRING
			l_xml_prefix: STRING
			l_parser: XM_XPATH_QNAME_PARSER
			l_boolean: BOOLEAN
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			check attached a_result.item as l_result_item then
				if l_result_item.is_error then
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Argument to 'element-available' is not a lexical QName",
						Xpath_errors_uri, "XTDE1440", Dynamic_error))
				else
					if not l_result_item.is_atomic_value then
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Argument to 'element-available' is not a lexical QName",
							Xpath_errors_uri, "XTDE1440", Dynamic_error))
					else
						create l_parser.make (l_result_item.as_atomic_value.string_value)
						if not l_parser.is_valid then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Argument to 'element-available' is not a lexical QName",
								Xpath_errors_uri, "XTDE1440", Dynamic_error))
						else
							check
								l_parser_is_valid: attached l_parser.optional_prefix as l_optional_prefix
								l_parser_is_valid: attached l_parser.local_name as l_local_name
							then
								check attached namespace_context as l_namespace_context then
									if not l_parser.is_prefix_present then
										l_xml_prefix := ""
										l_uri := l_namespace_context.uri_for_defaulted_prefix (l_xml_prefix, True)
									else
										l_xml_prefix := l_optional_prefix
										l_uri := l_namespace_context.uri_for_defaulted_prefix (l_xml_prefix, False)
									end
								end
								if l_uri = Void then
									a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("QName prefix in argument to 'element-available' has not been declared.",
										Xpath_errors_uri, "XTDE1440", Dynamic_error))
								else
									check attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_evaluation_context then
										l_boolean := is_element_available (l_uri, l_local_name, l_evaluation_context)
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
			l_parser: XM_XPATH_QNAME_PARSER
			l_boolean: BOOLEAN
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			check
				fixed_string: arguments.item (1).is_string_value
				-- static typing and `pre_evaluate' is only called for fixed values
			end
			create l_parser.make (arguments.item (1).as_string_value.string_value)
			if not l_parser.is_valid then
				set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make_from_string ("Argument to 'element-available' is not a lexical QName",
					Xpath_errors_uri, "XTDE1440", Static_error))
			else
				l_boolean := a_context.is_element_available (arguments.item (1).as_string_value.string_value)
				create l_boolean_value.make (l_boolean)
				set_replacement (a_replacement, l_boolean_value)
			end
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Check arguments during parsing, when all the argument expressions have been read.
		local
			namespaces_needed: BOOLEAN
		do
			if not checked then
				Precursor (a_replacement, a_context)
				if a_replacement.item = Void then
					if not arguments.item (1).is_value then
						namespaces_needed := True
						check
							expression_context: attached {XM_XSLT_EXPRESSION_CONTEXT} a_context as l_expression_context
							-- as this is XSLT
						then
							namespace_context := l_expression_context.namespace_context
						end
					end
				end
				checked := True
			end
		ensure then
			arguments_cheked: checked
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	node_factory: detachable XM_XSLT_NODE_FACTORY
			-- Node factory

	namespace_context: detachable XM_XSLT_NAMESPACE_CONTEXT
			-- Saved namespace context

	checked: BOOLEAN
			-- Has `check_arguments' been called already?

	is_element_available (a_uri, a_local_name: STRING; a_context: XM_XSLT_EVALUATION_CONTEXT): BOOLEAN
			-- Is named instruction element available at run-time?
		require
			local_name_not_void: a_local_name /= Void
			context_not_void: a_context /= Void
		local
			a_config: XM_XSLT_CONFIGURATION
			l_node_factory: like node_factory
		do
			l_node_factory := node_factory
			if l_node_factory = Void then
				if a_context.is_restricted then
					a_config := a_context.configuration
				else
					check attached a_context.transformer as l_transformer then
						a_config := l_transformer.configuration
					end
				end
				create l_node_factory.make (a_config.error_listener, a_config)
				node_factory := l_node_factory
			end
			Result := l_node_factory.is_element_available (a_uri, a_local_name)
		end

end

