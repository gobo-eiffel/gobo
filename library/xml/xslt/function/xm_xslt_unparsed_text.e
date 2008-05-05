indexing

	description:

		"Objects that implement the XSLT unparsed-text() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_UNPARSED_TEXT

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
			name := "unparsed-text"; namespace_uri := Xpath_standard_functions_uri
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
			if argument_number = 1 then
				create Result.make_optional_string
			else
				create Result.make_single_string
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_href, l_encoding: STRING
			l_uri: UT_URI
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if a_result.item /= Void and then not a_result.item.is_error then
				l_href := a_result.item.string_value
				if Url_encoding.has_excluded_characters (l_href) then
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("URI in unparsed-text() contains invalid characters",
						Xpath_errors_uri, "XTDE1170", Dynamic_error))
				elseif l_href.has ('#') then
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("URI in unparsed-text() contains a fragment identifier",
						Xpath_errors_uri, "XTDE1170", Dynamic_error))
				else
					a_result.put (Void)
					create l_uri.make_resolve (base_uri, l_href)
					if arguments.count = 2 then
						arguments.item (2).evaluate_item (a_result, a_context)
						if a_result.item /= Void and then not a_result.item.is_error then
							l_encoding := a_result.item.string_value
						end
					end
					if a_result.item = Void then -- no error yet
						a_result.put (evaluated_unparsed_text (l_uri, l_encoding, a_context, False))
					end
				end
			end
		end

	pre_evaluate (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
			-- Suppress compile-time evaluation
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		do
			Precursor (a_replacement, a_context)
			if base_uri = Void then
				base_uri := a_context.base_uri
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

feature {NONE} -- Implementation

	base_uri: UT_URI
			-- Base URI saved from static context

end
	
