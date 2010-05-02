note

	description:

		"Objects that implement the XPath resolve-uri() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_RESOLVE_URI

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			check_static_type, evaluate_item
		end

	UT_SHARED_URL_ENCODING
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "resolve-uri"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Resolve_uri_function_type_code
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
			Result := type_factory.any_uri_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			if argument_number = 1 then
				create Result.make_optional_string
			else
				create Result.make_single_string
			end
		end


feature -- Optimization

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static analysis of an expression and its subexpressions
		do

			-- We must set the base URI before calling the Precursor, in case
			--  of pre-evaluation.

			if arguments.count = 1 then
				base_uri := a_context.base_uri
				check
					base_uri_is_absolute: base_uri /= Void and then base_uri.is_absolute
					-- From post-condition of `a_context.base_uri'`
				end
			end
			Precursor (a_replacement, a_context, a_context_item_type)
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_string: STRING
			l_uri: UT_URI
		do
			if arguments.count = 2 then
				arguments.item (2).evaluate_item (a_result, a_context)
				if not a_result.item.is_error then
					l_string := a_result.item.string_value
					a_result.put (Void)
					if l_string.is_empty then
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Second argument to fn:resolve-uri() is the empty string", Xpath_errors_uri,
							"FORG0002", Dynamic_error))
					elseif Url_encoding.has_excluded_characters (l_string) then
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Second argument to fn:resolve-uri() has invalid characters", Xpath_errors_uri,
							"FORG0002", Dynamic_error))
					elseif l_string.occurrences ('#') > 1 then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Second argument to fn:resolve-uri() has more than 1 #", Xpath_errors_uri,
								"FORG0002", Dynamic_error))
					else
						create base_uri.make (l_string)
						if not base_uri.is_absolute then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Second argument to fn:resolve-uri() is not an absolute URI", Xpath_errors_uri,
								"FORG0002", Dynamic_error))
						end
					end
				end
			end
			if a_result.item = Void then -- i.e. no error yet
				if not base_uri.is_absolute then
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Base URI supplied as second argument of fn:resolve-uri() is not absolute", Xpath_errors_uri,
						"FORG0009", Dynamic_error))
				else
					arguments.item (1).evaluate_item (a_result, a_context)
					if a_result.item /= Void and then not a_result.item.is_error then
						l_string := a_result.item.string_value
						a_result.put (Void)
						if l_string.is_empty then
							l_uri := base_uri
						elseif Url_encoding.has_excluded_characters (l_string) then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("First argument to fn:resolve-uri() has invalid characters", Xpath_errors_uri,
								"FORG0002", Dynamic_error))
						elseif l_string.occurrences ('#') > 1 then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("First argument to fn:resolve-uri() has more than 1 #", Xpath_errors_uri,
								"FORG0002", Dynamic_error))
						else
							create l_uri.make_resolve (base_uri, l_string)
							if not l_uri.is_absolute then
								a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("URI resolution process failed", Xpath_errors_uri,
									"FORG0009", Dynamic_error))
							end
						end
						if a_result.item = Void then
							a_result.put (create {XM_XPATH_ANY_URI_VALUE}.make (l_uri.full_reference))
						end
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

feature {NONE} -- Implementation

	base_uri: UT_URI
			-- Base URI from static_context

end

