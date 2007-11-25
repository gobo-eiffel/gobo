indexing

	description:

		"Objects that implement the XSLT system-property() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SYSTEM_PROPERTY

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, evaluate_item, check_arguments
		end

	KL_GOBO_VERSION
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "system-property"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := System_property_function_type_code
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
			Result := type_factory.string_type
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

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_uri: STRING
			l_parser: XM_XPATH_QNAME_PARSER
			l_string_value: XM_XPATH_STRING_VALUE
			l_argument: XM_XPATH_EXPRESSION
		do
			product_name := a_context.configuration.product_name
			l_argument := arguments.item (1)
			l_argument.evaluate_item (a_result, a_context)
			if l_argument.is_error then
				set_last_error (l_argument.error_value)
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_argument.error_value))
			else
				create l_parser.make (a_result.item.string_value)
				a_result.put (Void)
				if not l_parser.is_valid then
					set_last_error_from_string ("Argument to 'system-property' is not a QName",
						Xpath_errors_uri, "XTDE1390", Static_error)
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make (error_value))
				else
					if not l_parser.is_prefix_present then
						l_uri := ""
					else
						l_uri := namespace_context.uri_for_defaulted_prefix (l_parser.optional_prefix, False)
						if l_uri = Void then
							set_last_error_from_string ("Prefix to argument to 'system-property' is not declared",
								Xpath_errors_uri, "XTDE1390", Static_error)
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make (error_value))
						end
					end
					if a_result.item = Void then
						create l_string_value.make (system_property (l_uri, l_parser.local_name))
						a_result.put (l_string_value)
					end
				end
			end
		end


	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		local
			l_uri: STRING
			l_parser: XM_XPATH_QNAME_PARSER
			l_string_value: XM_XPATH_STRING_VALUE
		do
			product_name := a_context.configuration.product_name
			check
				string_value: arguments.item (1).is_string_value
				-- from static typing, and `pre_evaluate' is only called for fixed values
			end
			create l_parser.make (arguments.item (1).as_string_value.string_value)
			if not l_parser.is_valid then
				set_last_error_from_string ("Argument to 'system-property' is not a QName",
													 Xpath_errors_uri, "XTDE1390", Static_error)
			else
				if not l_parser.is_prefix_present then
					l_uri := ""
				else
					if a_context.is_prefix_declared (l_parser.optional_prefix) then
						l_uri := a_context.uri_for_prefix (l_parser.optional_prefix)
					else
						set_last_error_from_string ("Prefix to argument to 'system-property' is not declared",
							Xpath_errors_uri, "XTDE1390", Static_error)
					end
				end
				if not is_error then
					create l_string_value.make (system_property (l_uri, l_parser.local_name))
					set_replacement (l_string_value)
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
			Precursor (a_context)
			if not arguments.item (1).is_string_value then

				-- we need to save the namespace context

				an_expression_context ?= a_context
				check
					expression_context: an_expression_context /= Void
					-- as this is XSLT
				end
				namespace_context := an_expression_context.namespace_context
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	namespace_context: XM_XSLT_NAMESPACE_CONTEXT
			-- Saved namespace context

	product_name: STRING
			-- Product name ("Gexslt" or "Gestalt")

	system_property (a_namespace_uri, a_local_name: STRING): STRING is
			-- Value of system-property named by {`a_namespace_uri'}`a_local_name'
		require
			namespace_uri_not_void: a_namespace_uri /= Void
			local_name_not_void: a_local_name /= Void
			product_name_not_void: product_name /= Void
		do
			if STRING_.same_string (a_namespace_uri, Xslt_uri) then
				if STRING_.same_string (a_local_name, "version") then
					Result := "2.0"
				elseif STRING_.same_string (a_local_name, "vendor") then
					Result := "Gobo"
				elseif STRING_.same_string (a_local_name, "vendor-url") then
					Result := "http://www.gobosoft.com/"
				elseif STRING_.same_string (a_local_name, "product-name") then
					Result := product_name
				elseif STRING_.same_string (a_local_name, "product-version") then
					Result := Version_number
				elseif STRING_.same_string (a_local_name, "is-schema-aware") then
					Result := "no"
				elseif STRING_.same_string (a_local_name, "supports-serialization") then
					Result := "yes"
				elseif STRING_.same_string (a_local_name, "supports-backwards-compatibility") then
					Result := "yes"					
				else
					Result := ""
				end
			elseif STRING_.same_string (a_namespace_uri, Exslt_environment_uri) then
				Result := Execution_environment.variable_value (a_local_name)
				if Result = Void then Result := "" end
			else
				Result := ""
			end
		end

end
	
