indexing

	description:

		"Objects that implement the XSLT element-available() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
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

	make is
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
			create Result.make_single_string
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			a_uri, an_xml_prefix: STRING
			a_parser: XM_XPATH_QNAME_PARSER
			a_boolean: BOOLEAN
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
			an_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
		do
			arguments.item (1).evaluate_item (a_context)
			if arguments.item (1).last_evaluated_item.is_error then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Argument to 'element-available' is not a lexical QName",
																											Xpath_errors_uri, "XTDE1440", Dynamic_error)
			else
				if not arguments.item (1).last_evaluated_item.is_atomic_value then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Argument to 'element-available' is not a lexical QName",
																												Xpath_errors_uri, "XTDE1440", Dynamic_error)
				else
					create a_parser.make (arguments.item (1).last_evaluated_item.as_atomic_value.string_value)
					if not a_parser.is_valid then
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Argument to 'element-available' is not a lexical QName",
																													Xpath_errors_uri, "XTDE1440", Dynamic_error)
					else
						if not a_parser.is_prefix_present then
							a_uri := namespace_context.uri_for_defaulted_prefix (an_xml_prefix, True)
							an_xml_prefix := ""
						else
							an_xml_prefix := a_parser.optional_prefix
							a_uri := namespace_context.uri_for_defaulted_prefix (an_xml_prefix, False)
						end
						if a_uri = Void then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("QName prefix in argument to 'element-available' has not been declared.",
																														Xpath_errors_uri, "XTDE1440", Dynamic_error)
						else
							an_evaluation_context ?= a_context
							a_boolean := is_element_available (a_uri, a_parser.local_name, an_evaluation_context)
							create a_boolean_value.make (a_boolean)
							last_evaluated_item := a_boolean_value
						end
					end
				end
			end
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		local
			a_parser: XM_XPATH_QNAME_PARSER
			a_boolean: BOOLEAN
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
			an_expression_context: XM_XSLT_EXPRESSION_CONTEXT
		do
			check
				fixed_string: arguments.item (1).is_string_value
				-- static typing and `pre_evaluate' is only called for fixed values
			end
			create a_parser.make (arguments.item (1).as_string_value.string_value)
			if not a_parser.is_valid then
				set_last_error_from_string ("Argument to 'element-available' is not a lexical QName",
													 Xpath_errors_uri, "XTDE1440", Static_error)
			else
				an_expression_context ?= a_context
				a_boolean := an_expression_context.is_element_available (arguments.item (1).as_string_value.string_value)
				create a_boolean_value.make (a_boolean)
				set_replacement (a_boolean_value)
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
			namespaces_needed: BOOLEAN
			an_expression_context: XM_XSLT_EXPRESSION_CONTEXT
		do
			if not checked then
				Precursor (a_context)
				if not arguments.item (1).is_value then
					namespaces_needed := True
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
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	node_factory: XM_XSLT_NODE_FACTORY
			-- Node factory

	namespace_context: XM_XSLT_NAMESPACE_CONTEXT
			-- Saved namespace context

	checked: BOOLEAN
			-- Has `check_arguments' been called already?

	is_element_available (a_uri, a_local_name: STRING; a_context: XM_XSLT_EVALUATION_CONTEXT): BOOLEAN is
			-- Is named instruction element available at run-time?
		require
			local_name_not_void: a_local_name /= Void
			context_not_void: a_context /= Void
		local
			a_config: XM_XSLT_CONFIGURATION
		do
			if node_factory = Void then
				if a_context.is_restricted then
					a_config := a_context.configuration
				else
					a_config := a_context.transformer.configuration
				end
				create node_factory.make (a_config.error_listener, a_config)
			end
			Result := node_factory.is_element_available (a_uri, a_local_name)
		end

end
	
