note

	description:

		"Objects that implement the XPath string-length() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_STRING_LENGTH

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			simplify, evaluate_item, is_string_length_function, as_string_length_function
		end

	-- TODO: pre-evaluate

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "string-length"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := String_length_function_type_code
			minimum_argument_count := 0
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	is_string_length_function: BOOLEAN
			-- Is `Current' XPath an string-length() function?
		do
			Result := True
		end

	as_string_length_function: XM_XPATH_STRING_LENGTH
			-- `Current' seen as an XPath string-length() function
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			Result := type_factory.integer_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE
			-- Type of argument number `argument_number'
		do
			create Result.make_optional_string
		end

	is_test_for_zero: BOOLEAN
			-- If this is set we return 0 for a zero length string, 1 for any other;
			-- Set by the optimizer.

feature -- Status setting

	set_test_for_zero
			-- Set `is_test_for_zero'.
		do
			is_test_for_zero := True
		ensure
			is_test_for_zero = True
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
			l_atomic_value: detachable XM_XPATH_ATOMIC_VALUE
			l_string: STRING
		do
			arguments.item (1).evaluate_item (a_result, a_context)
			if not attached a_result.item as a_result_item then
				create {XM_XPATH_STRING_VALUE} l_atomic_value.make ("")
			elseif a_result_item.is_error then
				-- nothing to do
			elseif  not a_result_item.is_atomic_value then
				create {XM_XPATH_STRING_VALUE} l_atomic_value.make ("")
			else
				l_atomic_value := a_result_item.as_atomic_value
			end
			if not attached a_result.item as a_result_item or else not a_result_item.is_error then
				check attached l_atomic_value then
					l_string := l_atomic_value.string_value
					if is_test_for_zero then
						if l_string.count = 0 then
							a_result.put (create {XM_XPATH_INTEGER_VALUE}.make_from_integer (0))
						else
							a_result.put (create {XM_XPATH_INTEGER_VALUE}.make_from_integer (1))
						end
					else
						a_result.put (create {XM_XPATH_INTEGER_VALUE}.make_from_integer (l_string.count))
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

