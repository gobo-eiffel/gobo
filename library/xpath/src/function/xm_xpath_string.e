note

	description:

		"Objects that implement the XPath string() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_STRING

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, check_static_type, evaluate_item, is_string_function, as_string_function
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "string"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := String_function_type_code
			minimum_argument_count := 0
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	is_string_function: BOOLEAN
			-- Is `Current' XPath an string() function?
		do
			Result := True
		end

	as_string_function: XM_XPATH_STRING
			-- `Current' seen as an XPath string() function
		do
			Result := Current
		end

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
			create Result.make_optional_item
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		do
			use_context_item_as_default
			Precursor (a_replacement)
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static analysis of an expression and its subexpressions
		do
			Precursor (a_replacement, a_context, a_context_item_type)
			if a_replacement.item = Current then
				if arguments.item (1).item_type.is_same_type (type_factory.string_type) and
					arguments.item (1).cardinality_exactly_one then
					a_replacement.put (Void)
					set_replacement (a_replacement, arguments.item (1))
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if not attached a_result.item as a_result_item then
				a_result.put (create {XM_XPATH_STRING_VALUE}.make (""))
			elseif a_result_item.is_error then
				-- nothing to do
			else
				a_result.put (create {XM_XPATH_STRING_VALUE}.make (a_result_item.string_value))
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end

