note

	description:

		"Objects that implement the XSLT unparsed-text-available() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_UNPARSED_TEXT_AVAILABLE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			check_arguments, pre_evaluate, evaluate_item
		end

	XM_XSLT_UNPARSED_TEXT_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "unparsed-text-available"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Unparsed_text_function_type_code
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
			create Result.make_single_string
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_href: STRING
			l_encoding: detachable STRING
			l_uri: UT_URI
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if not attached a_result.item as l_result_item_1 then
				-- logically can't happen - needs a change to the spec
				a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (True))
			elseif l_result_item_1.is_error then
				a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (False))
			else
				l_href := l_result_item_1.string_value
				if Url_encoding.has_excluded_characters (l_href) then
					a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (False))
				elseif l_href.has ('#') then
					a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (False))
				else
					check attached base_uri as l_base_uri then
						create l_uri.make_resolve (l_base_uri, l_href)
						if arguments.count = 2 then
							a_result.put (Void)
							arguments.item (2).evaluate_item (a_result, a_context)
							if attached a_result.item as l_result_item_2 then
								if l_result_item_2.is_error then
									a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (False))
								else
									l_encoding := l_result_item_2.string_value
								end
							end
						end
						if a_result.item = Void then -- no result yet
							a_result.put (evaluated_unparsed_text (l_uri, l_encoding, a_context, True))
						end
					end
				end
			end
		end

	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		do
			-- Suppress compile-time evaluation
			a_replacement.put (Current)
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Check arguments during parsing, when all the argument expressions have been read.
		do
			Precursor (a_replacement, a_context)
			if base_uri = Void then
				base_uri := a_context.base_uri
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	base_uri: detachable UT_URI
			-- Base URI saved from static context

end

