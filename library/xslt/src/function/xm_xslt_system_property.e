note

	description:

		"Objects that implement the XSLT system-property() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2024, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_SYSTEM_PROPERTY

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, evaluate_item, check_arguments
		end

	UT_GOBO_VERSION
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "system-property"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := System_property_function_type_code
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
			Result := type_factory.string_type
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
			-- Evaluate as a single item to `a_result'.
		local
			l_uri: detachable STRING
			l_parser: XM_XPATH_QNAME_PARSER
			l_string_value: XM_XPATH_STRING_VALUE
			l_argument: XM_XPATH_EXPRESSION
			l_configuration: XM_XPATH_CONFIGURATION
		do
			l_configuration := a_context.configuration
			read_configuration (l_configuration)
			l_argument := arguments.item (1)
			l_argument.evaluate_item (a_result, a_context)
			check attached a_result.item as l_result_item_1 then
				if attached l_result_item_1.error_value as l_error_value then
					check is_error: l_result_item_1.is_error end
					set_last_error (l_error_value)
				else
					create l_parser.make (l_result_item_1.string_value)
					a_result.put (Void)
					if not l_parser.is_valid then
						set_last_error_from_string ("Argument to 'system-property' is not a QName",
							Xpath_errors_uri, "XTDE1390", Static_error)
						check attached error_value as l_error_value then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
						end
					else
						check
							l_parser_is_valid: attached l_parser.optional_prefix as l_optional_prefix
							l_parser_is_valid_2: attached l_parser.local_name as l_local_name
						then
							if not l_parser.is_prefix_present then
								l_uri := ""
							else
								check attached namespace_context as l_namespace_context then
									l_uri := l_namespace_context.uri_for_defaulted_prefix (l_optional_prefix, False)
								end
								if l_uri = Void then
									set_last_error_from_string ("Prefix to argument to 'system-property' is not declared",
										Xpath_errors_uri, "XTDE1390", Static_error)
									check attached error_value as l_error_value then
										a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
									end
								end
							end
							if a_result.item = Void then
								check l_uri /= Void then
									create l_string_value.make (system_property (l_uri, l_local_name, a_context.configuration))
									a_result.put (l_string_value)
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
			l_uri: STRING
			l_parser: XM_XPATH_QNAME_PARSER
			l_string_value: XM_XPATH_STRING_VALUE
			l_configuration: XM_XPATH_CONFIGURATION
		do
			l_configuration := a_context.configuration
			read_configuration (l_configuration)
			check
				string_value: arguments.item (1).is_string_value
				-- from static typing, and `pre_evaluate' is only called for fixed values
			end
			create l_parser.make (arguments.item (1).as_string_value.string_value)
			if not l_parser.is_valid then
				set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make_from_string ("Argument to 'system-property' is not a QName",
					Xpath_errors_uri, "XTDE1390", Static_error))
			else
				check
					l_parser_is_valid: attached l_parser.optional_prefix as l_optional_prefix
					l_parser_is_valid_2: attached l_parser.local_name as l_local_name
				then
					if not l_parser.is_prefix_present then
						l_uri := ""
					else
						if a_context.is_prefix_declared (l_optional_prefix) then
							l_uri := a_context.uri_for_prefix (l_optional_prefix)
						else
							set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make_from_string ("Prefix to argument to 'system-property' is not declared",
								Xpath_errors_uri, "XTDE1390", Static_error))
							l_uri := ""
						end
					end
					if a_replacement.item = Void then
						create l_string_value.make (system_property (l_uri, l_local_name, a_context.configuration))
						set_replacement (a_replacement, l_string_value)
					end
				end
			end
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Check arguments during parsing, when all the argument expressions have been read.
		do
			Precursor (a_replacement, a_context)
			if a_replacement.item = Void then
				if not arguments.item (1).is_string_value then

					-- we need to save the namespace context

					check
						expression_context: attached {XM_XSLT_EXPRESSION_CONTEXT} a_context as l_expression_context
						-- as this is XSLT
					then
						namespace_context := l_expression_context.namespace_context
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	namespace_context: detachable XM_XSLT_NAMESPACE_CONTEXT
			-- Saved namespace context

	product_name: detachable STRING
			-- Product name (e.g. "Gexslt" or "Gestalt")

	product_version: detachable STRING
			-- Product version number (e.g. Gobo version number or Gestalt version number)

	vendor_name: detachable STRING
			-- Name of organization or individual responsible for this configuration (e.g. "Gobo" or "Colin Adams")

	vendor_url: detachable STRING
			-- Web page for `vendor_name'

	read_configuration (a_configuration: XM_XPATH_CONFIGURATION)
			-- Read configuration to get values for `product_name' etc.
		require
			a_configuration_not_void: a_configuration /= Void
		do
			product_name := a_configuration.product_name
			product_version := a_configuration.product_version
			vendor_name := a_configuration.vendor_name
			vendor_url := a_configuration.vendor_url
		end

	system_property (a_namespace_uri, a_local_name: STRING; a_configuration: XM_XPATH_CONFIGURATION): STRING
			-- Value of system-property named by {`a_namespace_uri'}`a_local_name'
		require
			namespace_uri_not_void: a_namespace_uri /= Void
			local_name_not_void: a_local_name /= Void
		local
			l_tables: DS_HASH_TABLE [DS_HASH_TABLE [STRING, STRING], STRING]
			l_table: DS_HASH_TABLE [STRING, STRING]
		do
			if STRING_.same_string (a_namespace_uri, Xslt_uri) then
				if STRING_.same_string (a_local_name, "version") then
					Result := "2.0"
				elseif STRING_.same_string (a_local_name, "vendor") then
					if attached vendor_name as l_vendor_name then
						Result := l_vendor_name
					else
						Result := "Gobo"
					end
				elseif STRING_.same_string (a_local_name, "vendor-url") then
					if attached vendor_url as l_vendor_url then
						Result := l_vendor_url
					else
						Result := "http://www.gobosoft.com/"
					end
				elseif STRING_.same_string (a_local_name, "product-name") then
					if attached product_name as l_product_name then
						Result := l_product_name
					else
						Result :=  "Gexslt"
					end
				elseif STRING_.same_string (a_local_name, "product-version") then
					if attached product_version as l_product_version then
						Result := l_product_version
					else
						Result := Version_number
					end
				elseif STRING_.same_string (a_local_name, "is-schema-aware") then
					Result := "no"
				elseif STRING_.same_string (a_local_name, "supports-serialization") then
					Result := "yes"
				elseif STRING_.same_string (a_local_name, "supports-backwards-compatibility") then
					Result := "yes"
				elseif STRING_.same_string (a_local_name, "supports-namespace-axis") then
					Result := "no"
				else
					Result := ""
				end
			elseif STRING_.same_string (a_namespace_uri, Exslt_environment_uri) then
				if attached Execution_environment.variable_value (a_local_name) as l_local_value then
					Result := l_local_value
				else
					Result := ""
				end
			else
				l_tables := a_configuration.system_properties
				if l_tables.has (a_namespace_uri) then
					l_table := l_tables.item (a_namespace_uri)
					if l_table.has (a_local_name) then
						Result := l_table.item (a_local_name)
					else
						Result := ""
					end
				else
					Result := ""
				end
			end
		end

end

