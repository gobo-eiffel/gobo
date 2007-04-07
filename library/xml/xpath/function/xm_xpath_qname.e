indexing

	description:

		"Objects that implement the XPath QName() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
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

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_parser: XM_XPATH_QNAME_PARSER
			l_uri: STRING
			l_name_code: INTEGER
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if a_result.item = Void then
				l_uri := ""
			elseif a_result.item.is_error then
				-- nothing to do
			else
				l_uri := a_result.item.string_value
			end
			if l_uri /= Void then
				a_result.put (Void)
				arguments.item (2).evaluate_item (a_result, a_context)
				if not a_result.item.is_error then
					create l_parser.make (a_result.item.string_value)
					if l_parser.is_valid then
						if not shared_name_pool.is_name_code_allocated (l_parser.optional_prefix, l_uri, l_parser.local_name) then
							shared_name_pool.allocate_name (l_parser.optional_prefix, l_uri, l_parser.local_name)
							l_name_code := shared_name_pool.last_name_code
						else
							l_name_code := shared_name_pool.name_code (l_parser.optional_prefix, l_uri, l_parser.local_name)
						end
						a_result.put (create {XM_XPATH_QNAME_VALUE}.make (l_name_code))
					else
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("Second argument to fn:QName() is not a lexical QName",
							Xpath_errors_uri, "FOCA0002", Dynamic_error))
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
			set_cardinality_exactly_one
		end

end
	
