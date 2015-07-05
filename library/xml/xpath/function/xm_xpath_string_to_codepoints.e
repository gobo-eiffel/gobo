note

	description:

		"Objects that implement the XPath string-to-codepoints() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_STRING_TO_CODEPOINTS

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, create_iterator
		end

	UC_IMPORTED_UNICODE_ROUTINES

	XM_UNICODE_CHARACTERS_1_1
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			name := "string-to-codepoints"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := String_to_codepoints_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

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

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		do
			check
				sequence_result: False
				-- Cannot call `evaluate_item' on a sequence
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- An iterator over the values of a sequence
		local
			l_item: detachable XM_XPATH_ITEM
			l_string: STRING
			l_array: DS_ARRAYED_LIST [XM_XPATH_INTEGER_VALUE]
			l_index, l_count: INTEGER
			l_integer: XM_XPATH_INTEGER_VALUE
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
		do
			create l_result.make (Void)
			arguments.item (1).evaluate_item (l_result, a_context)
			l_item := l_result.item
			if l_item = Void then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
			elseif attached l_item.error_value as l_error_value then
				check is_error: l_item.is_error end
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_error_value)
			else
				l_string := l_item.string_value
				if l_string.is_empty then
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
				else
					from
						create l_array.make (l_string.count)
						l_index := 1
						l_count := l_string.count
					until
						l_index > l_count
					loop
						create l_integer.make_from_integer (l_string.item_code (l_index))
						l_array.put (l_integer, l_index)
						l_index := l_index + 1
					end
					create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_INTEGER_VALUE]} last_iterator.make (l_array)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end

end

