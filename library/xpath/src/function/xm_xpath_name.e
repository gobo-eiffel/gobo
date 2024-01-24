note

	description:

		"Objects that implement the XPath name() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_NAME

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, evaluate_item
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "name"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Name_function_type_code
			minimum_argument_count := 0
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
			set_argument_error_code ("XPTY0004")
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
			create Result.make_optional_node
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		do
			use_context_item_as_default
			Precursor (a_replacement)
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_name: detachable STRING
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if attached a_result.item as a_result_item then
				if not a_result_item.is_error then
					if not a_result_item.is_node then
						a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
					else
						l_name := a_result_item.as_node.node_name
						if l_name = Void then
							l_name := ""
						end
						a_result.put (create {XM_XPATH_STRING_VALUE}.make (l_name))
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

end

