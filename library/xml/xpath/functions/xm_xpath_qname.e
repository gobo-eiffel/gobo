indexing

	description:

		"Objects that implement the XPath QName() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_QNAME

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "QName"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Qname_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.qname_type
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

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_parser: XM_XPATH_QNAME_PARSER
			a_uri: STRING
			a_name_code: INTEGER
		do
			arguments.item (1).evaluate_item (a_context)
			if arguments.item (1).last_evaluated_item = Void then
				a_uri := ""
			elseif arguments.item (1).last_evaluated_item.is_error then
				last_evaluated_item := arguments.item (1).last_evaluated_item
			else
				a_uri := arguments.item (1).last_evaluated_item.string_value
				arguments.item (2).evaluate_item (a_context)
				if arguments.item (2).last_evaluated_item.is_error then
					last_evaluated_item := arguments.item (2).last_evaluated_item
				else
					create a_parser.make (arguments.item (2).last_evaluated_item.string_value)
					if a_parser.is_valid then
						if not shared_name_pool.is_name_code_allocated (a_parser.optional_prefix, a_uri, a_parser.local_name) then
							shared_name_pool.allocate_name (a_parser.optional_prefix, a_uri, a_parser.local_name)
							a_name_code := shared_name_pool.last_name_code
						else
							a_name_code := shared_name_pool.name_code (a_parser.optional_prefix, a_uri, a_parser.local_name)
						end
						create {XM_XPATH_QNAME_VALUE} last_evaluated_item.make (a_name_code)
					else
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Second argument to fn:QName() is not a lexical QName",
																													Xpath_errors_uri, "FOCA0002", Dynamic_error)
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end
	
