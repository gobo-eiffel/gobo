indexing

	description:

		"Objects that implement the XSLT unparsed-text-available() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			an_href, an_encoding: STRING
			a_uri: UT_URI
		do
			arguments.item (1).evaluate_item (a_context)
			if arguments.item (1).last_evaluated_item = Void then
				-- logically can't happen - needs a change to the spec
				create {XM_XPATH_BOOLEAN_VALUE} last_evaluated_item.make (True)
			elseif arguments.item (1).last_evaluated_item.is_error then
				create {XM_XPATH_BOOLEAN_VALUE} last_evaluated_item.make (False)
			else
				an_href := arguments.item (1).last_evaluated_item.string_value
				if Url_encoding.has_excluded_characters (an_href) then
					create {XM_XPATH_BOOLEAN_VALUE} last_evaluated_item.make (False)
				elseif an_href.has ('#') then
					create {XM_XPATH_BOOLEAN_VALUE} last_evaluated_item.make (False)
				else
					create a_uri.make_resolve (base_uri, an_href)
					if arguments.count = 2 then
						arguments.item (2).evaluate_item (a_context)
						if arguments.item (2).last_evaluated_item /= Void then
							if arguments.item (2).last_evaluated_item.is_error then
								create {XM_XPATH_BOOLEAN_VALUE} last_evaluated_item.make (False)
							else
								an_encoding := arguments.item (2).last_evaluated_item.string_value
							end
						end
					end
					if last_evaluated_item = Void then -- no result yet
						last_evaluated_item := evaluated_unparsed_text (a_uri, an_encoding, a_context, True)
					end
				end
			end
		end


	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
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
	
