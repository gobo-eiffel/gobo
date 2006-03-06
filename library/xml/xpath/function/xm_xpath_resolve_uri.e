indexing

	description:

		"Objects that implement the XPath resolve-uri() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

	make is
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

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.any_uri_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			if argument_number = 1 then
				create Result.make_optional_string
			else
				create Result.make_single_string
			end
		end


feature -- Optimization

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
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
			Precursor (a_context, a_context_item_type)
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_string: STRING
			a_uri: UT_URI
		do
			if arguments.count = 2 then
				arguments.item (2).evaluate_item (a_context)
				if arguments.item (2).last_evaluated_item.is_error then
					last_evaluated_item := arguments.item (2).last_evaluated_item
				else
					a_string := arguments.item (2).last_evaluated_item.string_value
					if a_string.is_empty then
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Second argument to fn:resolve-uri() is the empty string", Xpath_errors_uri,
																													"FORG0002", Dynamic_error)
					elseif Url_encoding.has_excluded_characters (a_string) then
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Second argument to fn:resolve-uri() has invalid characters", Xpath_errors_uri,
																													"FORG0002", Dynamic_error)
					else
						create base_uri.make (a_string)
						if not base_uri.is_absolute then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Second argument to fn:resolve-uri() is not an absolute URI", Xpath_errors_uri,
																														"FORG0002", Dynamic_error)
						end
					end
				end
			end
			if last_evaluated_item = Void then -- i.e. no error yet
				if not base_uri.is_absolute then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Base URI supplied as second argument of fn:resolve-uri() is not absolute", Xpath_errors_uri,
																															"FORG0009", Dynamic_error)
				else
					arguments.item (1).evaluate_item (a_context)
					if arguments.item (1).last_evaluated_item = Void then
						last_evaluated_item := Void
					elseif arguments.item (1).last_evaluated_item.is_error then
						last_evaluated_item := arguments.item (1).last_evaluated_item
					else
						a_string := arguments.item (1).last_evaluated_item.string_value
						if a_string.is_empty then
							a_uri := base_uri
						elseif Url_encoding.has_excluded_characters (a_string) then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("first argument to fn:resolve-uri() has invalid characters", Xpath_errors_uri,
																													"FORG0002", Dynamic_error)
						else
							create a_uri.make_resolve (base_uri, a_string)
							if not a_uri.is_absolute then
								create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("URI resolution process failed", Xpath_errors_uri,
																															"FORG0009", Dynamic_error)
							end
						end
						if last_evaluated_item = Void then
							create {XM_XPATH_ANY_URI_VALUE} last_evaluated_item.make (a_uri.full_reference)
						end
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			-- pre-condition is never met
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

feature {NONE} -- Implementation

	base_uri: UT_URI
			-- Base URI from static_context

end
	
