indexing

	description:

		"Objects that implement the XSLT unparsed-text-available() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
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

	make is
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

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_href, l_encoding: STRING
			l_uri: UT_URI
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if a_result.item = Void then
				-- logically can't happen - needs a change to the spec
				a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (True))
			elseif a_result.item.is_error then
				a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (False))
			else
				l_href := a_result.item.string_value
				if Url_encoding.has_excluded_characters (l_href) then
					a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (False))
				elseif l_href.has ('#') then
					a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (False))
				else
					create l_uri.make_resolve (base_uri, l_href)
					if arguments.count = 2 then
						a_result.put (Void)
						arguments.item (2).evaluate_item (a_result, a_context)
						if a_result.item /= Void then
							if a_result.item.is_error then
								a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (False))
							else
								l_encoding := a_result.item.string_value
							end
						end
					end
					if a_result.item = Void then -- no result yet
						a_result.put (evaluated_unparsed_text (l_uri, l_encoding, a_context, True))
					end
				end
			end
		end


	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			-- Suppress compile-time evaluation
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			-- pre-condition is never met
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		do
			Precursor (a_context)
			if base_uri = Void then base_uri := a_context.base_uri end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	base_uri: UT_URI
			-- Base URI saved from static context

end
	
